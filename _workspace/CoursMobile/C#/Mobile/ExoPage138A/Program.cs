using System;

namespace ExoPage138A
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Entrez un nombre : ");

            if (int.TryParse(Console.ReadLine(),out int nb1))
            {
                Console.WriteLine("Entrez un nombre : ");

                if (int.TryParse(Console.ReadLine(), out int nb2))
                {
                    Console.WriteLine($"Division entière : {nb1/nb2}; Modulo : {nb1%nb2}; Division : {(double)nb1/nb2}");
                }

            }

        }
    }
}
