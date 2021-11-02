using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FilmDB.Controllers
{
    public class CastingController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
