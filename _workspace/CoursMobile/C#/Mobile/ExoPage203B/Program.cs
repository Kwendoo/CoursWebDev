using System;

namespace ExoPage203B
{
    class Program
    {

        public enum Couleurs { Coeur, Carreau, Pique, Trefle }

        public enum Valeurs { As = 14, deux = 2, trois = 3, quatre = 4, cinq = 5, six = 6, sept = 7, huit = 8, neuf = 9, dix = 10, Valet = 11, Dame = 12, Roi = 13 }

        static void Main(string[] args)
        {
            Console.WriteLine("------EXO 1-------");
            Couleurs color = Couleurs.Carreau;
            Console.WriteLine(color);
            Console.WriteLine("------EXO 2-------");
            Valeurs val = Valeurs.huit;
            Console.WriteLine((int)val);
        }
    }
}
