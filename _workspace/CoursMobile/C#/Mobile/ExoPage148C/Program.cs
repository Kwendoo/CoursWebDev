using System;

namespace ExoPage148C
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Combien de nombre premier voulez vous afficher ?");
            int userNumber = int.Parse(Console.ReadLine());
            int nbFound = 0;

            for (int nbToAnalayse = 0; nbFound < userNumber; nbToAnalayse++)
            {
                bool isNbPremier = true;
                int nbDiv = 0;

                for (int diviseur= 1; diviseur <= nbToAnalayse ; diviseur++)
                {
                    if (nbToAnalayse % diviseur == 0) nbDiv++;
                }

                isNbPremier = nbDiv == 2;

                if (isNbPremier)
                {
                    nbFound++;
                    Console.WriteLine(nbToAnalayse);
                }
            }
        }
    }
}
