using System;

namespace ExoPage114
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Veuillez entrer un nombre pour vérifier sa parité : ");

            string x = Console.ReadLine();

            int.TryParse(x, out int x2);

            int div = x2 / 2;

            if (div + div == x2) Console.WriteLine($"Votre nombre est pair !");
                else Console.WriteLine($"Votre nombre est impair !");
        }
    }
}
