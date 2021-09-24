using System;

namespace ExoPage148E
{
    class Program
    {
        static void Main(string[] args)
        {
            //for (double i = 0; i < 20; i += 0.1)//Perte de précision à un certain stade
            //{
            //    Console.WriteLine($"{i}");
            //}

            for (decimal i = 0; i <= 20; i += 0.1m)
            {
                Console.WriteLine($"{i}");
            }

            //for (int i = 0; i < 200; i++)
            //{
            //    Console.WriteLine($"{i/10.0}");
            //}
        }
    }
}
