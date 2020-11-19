using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;

namespace AnimalApi
{
    public class AnimalController : Controller
    {
        [Route("/api/animals")]
        public List<Animal> Index()
        {
            return new List<Animal>
            {
                new Animal {Name = "Dog"},
                new Animal {Name = "Cat"}
            };
        }
    }

    public class Animal
    {
        protected bool Equals(Animal other)
        {
            return Name == other.Name;
        }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            if (ReferenceEquals(this, obj)) return true;
            if (obj.GetType() != this.GetType()) return false;
            return Equals((Animal) obj);
        }

        public override int GetHashCode()
        {
            return (Name != null ? Name.GetHashCode() : 0);
        }

        public string Name { get; set; }
    }
}
