using System;
using System.Linq;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace AnimalApi.Data
{
    public class Animal
    {
        public string Name { get; set; }

        protected bool Equals(Animal other)
        {
            return Name == other.Name && ID == other.ID;
        }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            if (ReferenceEquals(this, obj)) return true;
            if (obj.GetType() != GetType()) return false;
            return Equals((Animal) obj);
        }

        public override int GetHashCode()
        {
            return HashCode.Combine(Name, ID);
        }

        public long ID { get; set; }
    }

    public class AnimalContext : DbContext
    {
        public AnimalContext(DbContextOptions options) : base(options)
        {
        }

        public DbSet<Animal> Animals { get; set; }
    }

    public class AnimalDbInitializer : IStartupFilter
    {
        private readonly IServiceProvider _serviceProvider;

        public AnimalDbInitializer(IServiceProvider serviceProvider)
        {
            _serviceProvider = serviceProvider;
        }

        public Action<IApplicationBuilder> Configure(Action<IApplicationBuilder> next)
        {
            var serviceScope = _serviceProvider.CreateScope();

            using (var animalContext = serviceScope.ServiceProvider.GetService<AnimalContext>())
            {
                animalContext.Database.EnsureCreated();

                if (!animalContext.Animals.Any())
                {
                    animalContext.Add(new Animal {Name = "Dog", ID = 123});
                    animalContext.Add(new Animal {Name = "Cat", ID = 456});
                    animalContext.SaveChanges();
                }
            }

            return next;
        }
    }
}
