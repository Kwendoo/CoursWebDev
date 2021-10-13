using DemoASP.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DemoASP.Controllers
{
    public class BiereController : Controller
    {
        private IFakeBiereService _service;

        public BiereController(IFakeBiereService service)
        {
            _service = service;
        }

        public IActionResult Index()
        {
            return View(_service.GetAll());
        }

        public IActionResult Details(int id)
        {
            return View(_service.GetById(id));
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(BiereForm form)
        {
            if (ModelState.IsValid)
            {
                _service.Insert(new Biere
                {
                    Nom = form.Nom,
                    Type = form.Type,
                    Alcool = form.Alcool
                });

                return RedirectToAction("Index");
            }

            return View(form);
        }

        public IActionResult Delete(int id)
        {
            _service.Delete(id);
            return RedirectToAction("Index");
        }
    }
}
