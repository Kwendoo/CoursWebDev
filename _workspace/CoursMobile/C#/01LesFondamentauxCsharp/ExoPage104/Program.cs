using System;

namespace ExoPage104A
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write($"Veuillez entrer un premier nombre entier :");
            
            string x = Console.ReadLine();
            int x2 = int.Parse(x);

            Console.Write($"Veuillez entrer un second nombre entier :");

            string y = Console.ReadLine();
            int y2 = int.Parse(y);

            Console.WriteLine($"Voici le résultat de l'addition de vos deux nombre : {x2 + y2}");
        }
    }
}
