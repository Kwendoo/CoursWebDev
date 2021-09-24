using System;

namespace ExoPage104B
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write($"Veuillez entrer un premier nombre entier :");


            string x = Console.ReadLine();
            int.TryParse(x, out int x2);

            Console.Write($"Veuillez entrer un second nombre entier :");


            string y = Console.ReadLine();
            int.TryParse(y, out int y2);

            //Console.WriteLine($"Voici le résultat de l'addition de vos deux nombre : {x + y}"); // Attention ceci procède à un concaténation et non une addition

            int add = x2 + y2;

            Console.WriteLine($"Voici le résultat de l'addition de vos deux nombre : {add}"); // Attention ceci procède à un concaténation et non une addition

        }
    }
}
