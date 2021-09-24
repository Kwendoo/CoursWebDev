using System;

namespace ExoPage203C
{
    public enum Couleurs { Coeur, Carreau, Pique, Trefle }

    public enum Valeurs { As = 14, deux = 2, trois = 3, quatre = 4, cinq = 5, six = 6, sept = 7, huit = 8, neuf = 9, dix = 10, Valet = 11, Dame = 12, Roi = 13 }

    class Program
    {
       

        static void Main(string[] args)
        {
            Console.WriteLine("------EXO 1-------");

            Couleurs color = Couleurs.Carreau;
            Console.WriteLine(color.ToString());



            Console.WriteLine("------EXO 2-------");

            Valeurs val = Valeurs.huit;
            Console.WriteLine((int)val);



            Console.WriteLine("------EXO 3-------");
            // Voir feuille "Cartes"


            Console.WriteLine("------EXO 4-------");
            Carte[] JeuDeCarte = new Carte[52];
            int i = 0;



            Console.WriteLine("------EXO Final-------");

            foreach (Couleurs Couleur in Enum.GetValues(typeof(Couleurs)))
            {
                foreach (Valeurs Valeur in Enum.GetValues(typeof(Valeurs)))
                {
                    JeuDeCarte[i] = new Carte { Couleur = Couleur, Valeur = Valeur};
                    Console.WriteLine($"{JeuDeCarte[i].Valeur} de {JeuDeCarte[i].Couleur}");
                    i++;
                }


            }

        }
    }
}
