using System;

namespace ExoPage203A
{
    class Program
    {

        public enum Couleurs { Coeur, Carreau, Pique, Trefle }

        static void Main(string[] args)
        {
            Couleurs color = Couleurs.Carreau;

            Console.WriteLine(color);
        }
    }
}
