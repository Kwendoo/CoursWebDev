using System;

namespace ExoPAge203Correction
{
    class Program
    {
        static void Main(string[] args)
        {
            Carte[] cartes = new Carte[52];

            int i = 0;
            foreach (string couleur in Enum.GetNames(typeof(Couleur)) )
            {
                foreach (string valeur in Enum.GetNames(typeof(Valeur)))
                {
                    Carte carte = new Carte
                    {
                        Couleur = (Couleur)Enum.Parse(typeof(Couleur), couleur),
                        Valeur = (Valeur)Enum.Parse(typeof(Valeur), valeur)
                    };


                    cartes[i] = carte;
                    Console.WriteLine($"{cartes[i].Valeur} de {cartes[i].Couleur}");
                    i++;
                }
            }
        }
    }
}
