using System;
using animal_lib;

namespace animal_compendium
{
    class Program
    {
        static void Main(string[] args)
        {
            var feature = Console.ReadLine();

            foreach (var animal in AnimalCompendium.Identify(feature))
            {
                Console.WriteLine(animal);
            }
        }
    }
}
