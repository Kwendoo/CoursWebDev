using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DemoAPI.Models;
using DataAccessLayer.Interfaces;
using DataAccessLayer.Models;
using DemoAPI.Tools;

namespace DemoAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private IUserService _userService;
        private ITokenManager _tokenManager;

        public UserController(IUserService userService, ITokenManager tokenManager)
        {
            _userService = userService;
            _tokenManager = tokenManager;
        }

        [HttpPost("login")]
        public IActionResult Login(LoginForm form)
        {
            User CurrentUser = _userService.Login(form.Email, form.Password);
            string token = _tokenManager.GenerateJWT(CurrentUser);

            return Ok(token);
        }

        [HttpPost("register")]
        public IActionResult Register(LoginForm form)
        {
            _userService.Register(form.Email, form.Password, false);
            return Ok();
        }
    }
}
