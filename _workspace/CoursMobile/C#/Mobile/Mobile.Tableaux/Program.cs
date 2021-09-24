using System;
using System.Collections;

namespace Mobile.Tableaux
{
    class Program
    {
        static void Main(string[] args)
        {
            //Tableau a une dimenssion

            const int LENGHT = 50;
            int[] ints = new int[LENGHT];

            int nbElems = 0;
            bool again = true;

            while (nbElems < LENGHT && again)
            {
                Console.WriteLine("Entrez la valeur à ajouter au tableau :");
                ints[nbElems] = int.Parse(Console.ReadLine());
                nbElems++;
                Console.WriteLine("Voulez vous entrer une nouvelle valeur ? o/n");
                again = Console.ReadLine() == "o";
            }

            Console.WriteLine("Affichage du tableau :");

            for (int index = 0; index < LENGHT; index++)
            {
                Console.Write($"{ints[index]}");
                if (index > nbElems) Console.Write(", ");
            }
        }
    }
}
