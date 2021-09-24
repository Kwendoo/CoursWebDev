using System;

namespace ExoPage138
{
    class Program
    {
        static void Main(string[] args)
        {

            // -- EX 01

            Console.WriteLine("Introduisez un nombre :");
            string i = Console.ReadLine();
            int i2 = int.Parse(i);

            Console.WriteLine("Introduisez un second nombre :");
            string j = Console.ReadLine();
            int j2 = int.Parse(j);

            int k = i2 / j2;

            Console.WriteLine("Division entière : "+k);
        }
    }
}
