using System;

namespace ExoPage114
{
    class Program
    {
        static void Main(string[] args)
        {
            //Version longue

            Console.WriteLine("Entrez un nombre :");

            string userInput = Console.ReadLine();

            int number;
            bool numberIsOk = int.TryParse(userInput, out number);

            int half;

            if (numberIsOk)
            {
                half = number / 2;
                if (half * 2 == number)
                {
                    Console.WriteLine($"Le nombre {number} est pair");
                }
                else
                {
                    Console.WriteLine($"Le nombre {number} est impair");
                }
            }
            else
            {
                Console.WriteLine($"Le nombre {userInput} n'est pas un nombre entier.");
            }

            //Version courte

            Console.WriteLine("Entrez un nombre : ");
            if (int.TryParse(Console.ReadLine(), out int number))
            {
                if ((number / 2) * 2 == number) Console.WriteLine($"Le nombre {number} est pair");
                else Console.WriteLine($"Le nombre {number} est impair.");
            }
            else Console.WriteLine($"L'entrée utilisateur n'est pas un nombre entier.");
        }
    }
}
