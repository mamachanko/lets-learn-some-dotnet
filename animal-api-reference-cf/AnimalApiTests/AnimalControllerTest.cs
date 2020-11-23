using AnimalApi;
using AnimalApi.Data;
using Microsoft.EntityFrameworkCore;
using Xunit;

namespace AnimalApiTests
{
    public class AnimalControllerTest
    {
        [Fact]
        public void Get_WhenAnimalsInDB_ReturnsAnimals()
        {
            // A
            var dbContextOptions = new DbContextOptionsBuilder<AnimalContext>()
                .UseInMemoryDatabase("animal-test-db")
                .Options;

            using (var animalContext = new AnimalContext(dbContextOptions))
            {
                animalContext.Database.EnsureCreated();

                animalContext.Animals.Add(new Animal {Name = "test1", ID = 1});
                animalContext.Animals.Add(new Animal {Name = "test2", ID = 2});
                animalContext.SaveChanges();

                var animalController = new AnimalController(animalContext);

                // A
                var animals = animalController.Get();

                // A
                Assert.Collection(
                    animals,
                    a => Assert.Equal(new Animal {Name = "test1", ID = 1}, a),
                    a => Assert.Equal(new Animal {Name = "test2", ID = 2}, a)
                );
            }

        }
    }
}
