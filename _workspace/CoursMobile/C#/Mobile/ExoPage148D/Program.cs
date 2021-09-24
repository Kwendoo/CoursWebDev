using System;

namespace ExoPage148D
{
    class Program
    {
        static void Main(string[] args)
        {
            for (int table = 1; table <= 5; table++)
            {
                Console.WriteLine($"Table de {table}");
                for (int number = 1; number <= 20; number++)
                {
                    Console.WriteLine($"{number} X {table} = {number * table}");
                }
            }
        }
    }
}
