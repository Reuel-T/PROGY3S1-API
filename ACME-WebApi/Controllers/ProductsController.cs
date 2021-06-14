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
    public class ProductsController : ControllerBase
    {
        private readonly PROG7311T2Context _context;

        public ProductsController(PROG7311T2Context context)
        {
            _context = context;
        }

        // Returns all products, filterable
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Product>>> GetProducts(string q, int c)
        {
            try
            {
                var ctx = _context.Products.Include(p => p.CidNavigation).OrderBy(x => x.Cid);

                List<Product> products = await ctx.ToListAsync();

                if (q != null)
                {
                    if (!q.Equals(""))
                    {
                        //if there is a search query
                        products = products.Where(x => x.Name.ToLowerInvariant().Contains(q.ToLowerInvariant())).ToList();
                    }
                }

                if (c > 0 && c <= _context.Categories.Count())
                {
                    //if there is a valid category ID
                    products = products.Where(x => x.Cid == c).ToList();
                }

                return Ok(products);
            }
            catch (Exception)
            {
               return StatusCode(StatusCodes.Status500InternalServerError, "Server Error");
            }
        }

        // GET: api/Products/5 - gets a single product by the ID
        [HttpGet("{id}")]
        public async Task<ActionResult<Product>> GetProduct(int id)
        {
            var product = await _context.Products.FindAsync(id);

            if (product == null)
            {
                return NotFound();
            }

            return Ok(product);
        }


        // POST: api/Products - Creates A new Product
        [HttpPost]
        public async Task<ActionResult<Product>> NewProduct(ProductModel p)
        {
            Product product = new Product();

            product.Name = p.Name;
            product.Description = p.Description;
            product.Price = p.Price;
            product.Cid = p.Cid;

            _context.Products.Add(product);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetProduct", new { id = product.Pid }, product);
        }
    }
}
