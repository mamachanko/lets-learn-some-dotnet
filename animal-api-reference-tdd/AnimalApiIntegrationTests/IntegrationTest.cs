using System.Net.Mime;
using System.Threading.Tasks;
using AnimalApi;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Testing;
using Quibble.Xunit;
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
            var httpClient = _factory.CreateClient();

            // Act
            var response = await httpClient.GetAsync("/api/animals");

            // Assert
            // 200 OK
            response.EnsureSuccessStatusCode();
            // application/json
            Assert.StartsWith(
                MediaTypeNames.Application.Json,
                response.Content.Headers.ContentType.ToString()
            );
            // [{🐶}, {🐱}]
            JsonAssert.Equal(
                @"[{""name"": ""Dog"", ""id"": 123}, {""name"": ""Cat"", ""id"": 456}]",
                await response.Content.ReadAsStringAsync()
            );
        }
    }
}
