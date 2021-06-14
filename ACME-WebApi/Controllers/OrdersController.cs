using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ACME_WebApi.Models;
using ACME_WebApi.Models.BodyModels;

namespace ACME_WebApi.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        private readonly PROG7311T2Context _context;

        public OrdersController(PROG7311T2Context context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<ProductOrder>>> Seed() 
        {
            List<ProductOrder> orders = new List<ProductOrder>();
            Random random = new Random();

            DateTime start = new DateTime(2021, 06, 01, 0, 0, 0);
            DateTime end = new DateTime(2021, 06, 30, 0, 0 ,0);

            TimeSpan timeSpan = end - start;
            //280
            for (int i = 0; i <= 279; i++)
            {
                TimeSpan newSpan = new TimeSpan(0, random.Next(0, (int)timeSpan.TotalMinutes), 0);
                DateTime randDate = start + newSpan;
                int user = random.Next(102, 108);
                int productID = random.Next(1, 12);
                decimal price = random.Next(100, 2000000);

                _context.ProductOrders.Add(new ProductOrder { Date = randDate, Pid = productID, Price = price, Uid = user, Qty = 1 });
            }

            await _context.SaveChangesAsync();


            return Ok(await _context.ProductOrders.ToListAsync());
        }

        // GET: api/Orders
        [HttpPost]
        public async Task<ActionResult<IEnumerable<ProductOrder>>> GetProductOrders(GetOrderModel m)
        {
            return await _context.ProductOrders.Where(x => x.Uid==m.uid).Include(x => x.PidNavigation).ThenInclude(c => c.CidNavigation).ToListAsync();
        }

        // GET: api/Orders/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ProductOrder>> GetProductOrder(int id)
        {
            var productOrder = await _context.ProductOrders.FindAsync(id);

            if (productOrder == null)
            {
                return NotFound();
            }

            return productOrder;
        }

        [HttpPost]
        public async Task<ActionResult<IEnumerable<ProductOrder>>> GetAnalytics(AnalyticsVM avm) 
        {
            List<ProductOrder> productOrders = await _context.ProductOrders.Include(p => p.PidNavigation).ThenInclude(c => c.CidNavigation).ToListAsync();//adds all relevant objs
            productOrders = productOrders.Where(x => DateTime.Compare(avm.StartDate.Date, x.Date) <= 0 && DateTime.Compare(avm.EndDate.Date, x.Date) >= 0).ToList();//selects dates within range
            productOrders = productOrders.Where(x => x.PidNavigation.Cid == int.Parse(avm.CategoryID)).ToList();

            return productOrders;
        }

        [HttpPost]
        public async Task<ActionResult<ProductOrder>> PostProductOrder(ProductOrder po)
        {
            ProductOrder productOrder = new ProductOrder();

            productOrder.Pid = po.Pid;
            productOrder.Uid = po.Uid;
            productOrder.Price = po.Price;
            productOrder.Date = DateTime.Now;
            productOrder.Qty = po.Qty;
            
            _context.ProductOrders.Add(productOrder);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetProductOrder", new { id = productOrder.Oid }, productOrder);
        }
    }
}
