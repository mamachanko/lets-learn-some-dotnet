using Microsoft.AspNetCore.Mvc;

namespace AnimalApi
{
    public class AnimalController : Controller
    {
        [Route("/api/animals")]
        public IActionResult Index()
        {
            return Json("");
        }
    }
}
