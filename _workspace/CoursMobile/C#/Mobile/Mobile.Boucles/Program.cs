using System;

namespace Mobile.Boucles
{
    class Program
    {
        static void Main(string[] args)
        {
            // While

            Console.WriteLine("Entrez une valeur numérique : ");
            string userInput = Console.ReadLine();

            while (int.TryParse(userInput, out _))
            {
                Console.WriteLine("Mauvaise entrée\nEntrez une valeur numérique : ");
                userInput = Console.ReadLine();
            }

            Console.WriteLine("C'est bien une valeur numérique.");


            // Do while

            do
            {
                Console.WriteLine("Entrez une valeur numérique : ");
            } while (!int.TryParse(Console.ReadLine(), out _));

            Console.WriteLine("C'est bien une valeur numérique.");

            // For

            Console.WriteLine("Entrez le nombre de côtes : ");
            string snbCotes = Console.ReadLine();
            int nbCotes = int.Parse(snbCotes);

            int sum = 0;
            double avg;

            for (int i = 0; i < nbCotes, i++)
            {
                Console.WriteLine($"Entrez la cote de l'élève n°{i + 1} : ");
                sum += int.Parse(Console.ReadLine());
            }

            avg = (double)sum / nbCotes;

            Console.WriteLine( $"La moyenne de la classe est de : {avg}");

        }
    }
}
