using AnimalApi;
using Xunit;

namespace AnimalApiTests
{
    public class AnimalControllerTest
    {
        [Fact]
        public void Get_ReturnsAnimals()
        {
            var animalController = new AnimalController();

            var response = animalController.Index();

            Assert.Collection(
                response,
                animal => Assert.Equal(new Animal() {Name = "Dog"}, animal),
                animal => Assert.Equal(new Animal() {Name = "Cat"}, animal)
            );
        }
    }
}
