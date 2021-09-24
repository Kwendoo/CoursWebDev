using System;

namespace Mobile.Methodes
{
    class Program
    {
        static void Main(string[] args)
        {
            Calcul c = new Calcul();
            Console.WriteLine(c.Addition(1, 2));
            Console.WriteLine(c.Addition(1D, 2));
            Console.WriteLine(c.Addition(1D, 2D));

            Bonjour bonjour = new Bonjour();
            bonjour.direBonjour();                          // Bonjour
            bonjour.direBonjourPrenom("Quentin");           // Bonjour Quentin
            bonjour.direBonjourPrenom("Quentin", "Franck"); // Quentin dit bonjour à Franck
        }

        struct Calcul
        {
            public double Addition(double d1, double d2)
            {
                return d1 + d2;
            }

            public double Addition(int d1, int d2)
            {
                return d1 + d2;
            }

            public int Addition(double d1, int i1)
            {
                return (int)d1 + i1;
            }
        }

        struct Bonjour
        {
            public void direBonjour()
            {
                Console.WriteLine("Bonjour");
            }

            public void direBonjourPrenom(string prenom)
            {
                Console.WriteLine($"Bonjour {prenom}");
            }

            public void direBonjourPrenom(string prenom1, string prenom2)
            {
                Console.WriteLine($"{prenom1} dit bonjour à {prenom2}");
            }
        }
    }
}
