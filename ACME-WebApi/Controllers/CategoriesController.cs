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
    public class CategoriesController : ControllerBase
    {
        private readonly PROG7311T2Context _context;

        public CategoriesController(PROG7311T2Context context)
        {
            _context = context;
        }

        // GET: api/Categories - Returns a list of categories from the DB
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Category>>> GetCategories()
        {
            return await _context.Categories.ToListAsync();
        }

        // GET: api/Categories/5 - Returns a selected category depending on the ID
        [HttpGet("{id}")]
        public async Task<ActionResult<Category>> GetCategory(int id)
        {
            var category = await _context.Categories.FindAsync(id);

            if (category == null)
            {
                return NotFound();
            }

            return category;
        }

     
        // POST: api/Categories - Creates a new Category
        [HttpPost]
        public async Task<ActionResult<Category>> NewCategory(CategoryModel c)
        {
            Category category = new Category();
            category.CategoryName = c.CategoryName;
            
            _context.Categories.Add(category);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCategory", new { id = category.Cid }, category);
        }
    }
}
