using System;

namespace ExoPage138A
{
    class Program
    {
        static void Main(string[] args)
        {
            int x = 5;
            int y = 2;

            int a = x / y;
            int b = x % y;
            double c = (double)x / y;

            Console.WriteLine($"Division entière : {a}, modulo : {b} et division standard : {c}");
        }
    }
}
