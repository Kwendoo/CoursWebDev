using System;

namespace Mobile.Solution
{
    class Program
    {
        static void Main(string[] args)
        {

            //WriteLine : écrit  un texte et passe à la ligne
            Console.WriteLine("Hello World!");

            //Write : écrit mais ne passe pas à la ligne
            Console.Write("Hello");
            Console.Write("World !");

            //Write + args : permet d'écrite un texte à trou en spécifiant les éléments à mettre dans les trous
            Console.WriteLine("Bonjour {0} ! Aujourd'hui, nous sommes  {1}", "Mobile", "jeudi");

            //Placer un break point en cliquant à gauche de la colonne des numéro de ligne. Ca permet de faire des arret lors de l'exécution globale du code

            //Clear
            Console.Clear();

            //ReadLine
            Console.WriteLine("Entrez un texte :");
            string s = Console.ReadLine(); //On stock l'éléments dans une variable

            Console.WriteLine("Vous avez entré : {0}", s);

        }
    }
}
