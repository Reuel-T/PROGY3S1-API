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
    public class UsersController : ControllerBase
    {
        private readonly PROG7311T2Context _context;

        public UsersController(PROG7311T2Context context)
        {
            _context = context;
        }

        // GET: api/Users
        [HttpGet]
        public async Task<ActionResult<IEnumerable<User>>> GetUsers()
        {
            return await _context.Users.ToListAsync();
        }

        // GET: api/Users/5
        [HttpGet("{id}")]
        public async Task<ActionResult<User>> GetUser(int id)
        {
            var user = await _context.Users.FindAsync(id);

            if (user == null)
            {
                return NotFound();
            }

            return user;
        }

        [HttpPost]
        public async Task<ActionResult<User>> SignUp(User u)
        {
            try
            {
                User check = await _context.Users.FirstOrDefaultAsync(x => x.Username.Equals(u.Username));

                if (check == null)
                {
                    User user = new User();
                    user.Username = u.Username;
                    user.Password = u.Password;
                    user.Rid = u.Rid;

                    _context.Users.Add(user);
                    await _context.SaveChangesAsync();

                    return Ok(user);
                }
                else 
                {
                    return BadRequest("Unable to Crete User");
                }
            }
            catch 
            {
                return StatusCode(StatusCodes.Status500InternalServerError, "Server Error");
            }
        }

        [HttpPost]
        public async Task<ActionResult<User>> LogIn(LoginModel l) 
        {
            try
            {
                User u = await _context.Users.Where(x => x.Username.Equals(l.Username) && x.Password.Equals(l.Password)).FirstOrDefaultAsync();

                if (u == null)
                {
                    //No matching user
                    return Unauthorized("Unable to log in");
                }
                else
                {
                    //There is a matching user
                    return Ok(u);
                }
            }
            catch (Exception)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, "Server Error");
            }
        }
    }
}
