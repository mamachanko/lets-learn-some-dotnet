using System.Threading.Tasks;
using AnimalApi;
using Microsoft.AspNetCore.Mvc.Testing;
using Xunit;

namespace AnimalApiIntegrationTests
{
    public class IntegrationTest : IClassFixture<WebApplicationFactory<Startup>>
    {
        private readonly WebApplicationFactory<Startup> _factory;

        public IntegrationTest(WebApplicationFactory<Startup> factory)
        {
            _factory = factory;
        }

        [Fact]
        public async Task Get_ReturnsAnimals()
        {
            // Arrange
            // run app and create client
            var httpClient = _factory.CreateClient();

            // Act
            // GET /api/animals
            var httpResponse = await httpClient.GetAsync("/api/animals");

            // Assert
            // assert 200/Ok
            httpResponse.EnsureSuccessStatusCode();
            // assert Content-Type: application/json
            // assert [🐶, 🐱]
        }
    }
}
