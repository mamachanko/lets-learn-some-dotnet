using System.Collections.Generic;
using System.Linq;
using AnimalApi.Data;
using Microsoft.AspNetCore.Mvc;

namespace AnimalApi
{
    public class AnimalController : Controller
    {
        private readonly AnimalContext _animalContext;

        public AnimalController(AnimalContext animalContext)
        {
            _animalContext = animalContext;
        }

        [Route("/api/animals")]
        public List<Animal> Get()
        {
            return _animalContext.Animals.ToList();
        }
    }
}
