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
    public class RolesController : ControllerBase
    {
        private readonly PROG7311T2Context _context;

        public RolesController(PROG7311T2Context context)
        {
            _context = context;
        }

        // GET: api/Roles
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Role>>> GetRoles()
        {
            try
            {
                var response = await _context.Roles.ToListAsync();
                return Ok(response);
            }
            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, "Server Error");
            }
            
            
        }

        // GET: api/Roles/5 - gets role by ID
        [HttpGet("{id}")]
        public async Task<ActionResult<Role>> GetRole(int id)
        {
            try
            {
                var role = await _context.Roles.FindAsync(id);

                if (role == null)
                {
                    return NotFound();
                }

                return Ok(role);
            }
            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, "Server Error");
            }
        }

        [HttpPost]
        public async Task<ActionResult<Role>> NewRole(string r)
        {
            try
            {
                Role role = new Role();
                role.RoleName = r;
            
                _context.Roles.Add(role);
                await _context.SaveChangesAsync();

                return CreatedAtAction("GetRole", new { id = role.Rid }, role);
            }
            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, "Server Error");
            }
        }

        private bool RoleExists(int id)
        {
            return _context.Roles.Any(e => e.Rid == id);
        }
    }
}
