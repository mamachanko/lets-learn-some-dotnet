using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;

namespace AnimalApi
{
    public class AnimalController : Controller
    {
        [Route("/api/animals")]
        public IActionResult Index()
        {
            return Json(new List<Animal>()
            {
                new Animal {Name = "Dog"},
                new Animal {Name = "Cat"}
            });
        }
    }

    public class Animal
    {
        public string Name { get; set; }
    }
}
