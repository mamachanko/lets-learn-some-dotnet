# Lets learn some .NET

What I am thinking of to tell a story is this:

    1. bootstrap project
      1. create solution
      1. create api project
      1. add api project to solution
      1. run app
      1. curl localhost
      1. explore
        * AnimalApi.csproj
          * like pom.xml, build.gradle
        * Program
          * Main
          * IHost is what encapsulates the application
        * Startup
          * called "Startup" by convention
          * ConfigureServives
            * register services and options with the DI container
          * Configure
            * for configuring the app's request processing pipeline
      1. initialize git repository
      1. add .gitignore through dotnet cli
      1. commit

    1. implement GET /api/animals with fixed response
      1. create integration test project
        * ls to show new folder
        * dotnet test won't do anything, b/c we need to add to the solution
      1. add integration test project to solution
        * dotnet sln AnimalApi.sln add AnimalApiIntegrationTests
        * explore
          * rename UnitTest1.cs
          * [Fact] attribute is like Junit's @Test
      1. expect GET /api/animals to return animals
        * extend IClassFixture
        * add Testing kit
          * dotnet add AnimalApiIntegrationTests package Microsoft.AspNetCore.Mvc.Testing --version 3.1
        * reference AnimalAPI
          * dotnet add AnimalApiIntegrationTests reference AnimalApi
        * `: IClassFixture<WebApplicationFactory<Startup>>`
        * assert 200/OK
      1. see test fail
      1. create controller
      1. return with fixed data
        * add Quibble
          * dotnet add AnimalApiIntegrationTests package Quibble.Xunit
      1. see test pass
      1. run app
      1. curl localhost
      1. commit

    1. return animals from db
      1. create controller unit test
        * dotnet new xunit --name AnimalApiTests --framework netcoreapp3.1 --force
        * dotnet sln AnimalApi.sln add AnimalApiTests
        * rename UnitTest1 to AnimalControllerTest
        * expect list with size 2 to be returned

// --------------
      1. bootstrap database context
        * https://www.thecodebuzz.com/dbcontext-mock-and-unit-test-entity-framework-net-core/
        * dotnet add package Microsoft.EntityFrameworkCore.InMemory
        * create dbcontext in controller test
        * add it as dependency to controller
        * run all tests and see integration test fail
        * add db context to DI container
        * connect to postgres
          * dotnet add package Npgsql.EntityFrameworkCore.PostgreSQL
          * UseNpgsql
          * docker run --detach --rm --name animaldb --publish 5432:5432 --env POSTGRES_PASSWORD=secret postgres:13.1-alpine
          * docker run --rm -it --network host --env PGPASSWORD=secret --env PGUSER=postgres --env PGHOST=127.0.0.1 postgres:13.1-alpine psql --command '\l' 
          * dotnet test
          * `"ConnectionStrings": { "database": "Host=localhost;Port=5432;Username=postgres;Password=secret;Database=animaldb" }`
          * dotnet test

 *    1. expect animals to be returned from AnimalContext
      1. see test fail
      1. start local db
      1. introduce Animal class
      1. configure migration
      1. initialize db and hydrate

// ----- this is a whole thing

      1. see tests pass
      1. run app
      1. curl localhost
      1. commit
      1. isolate integration test db by configuring appsettings.IntegrationTests.json
      1. run app
      1. curl localhost
      1. commit

    1. deploy to CF
      1. cf push and see it fail
      1. bring in dependencies
      1. configure webhostbuilder
      1. configure db context
      1. run app
      1. curl localhost
      1. cf push
      1. curl cf
      1. commit

