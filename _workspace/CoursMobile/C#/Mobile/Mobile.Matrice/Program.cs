using System;

namespace Mobile.Matrice
{
    class Program
    {
        static void Main(string[] args)
        {
            //Tableau matriciel (multidimenssion)

            string[,] names = { { "Greets", "Gio", "Emmery" }, { "Quentin", "Fabio", "Nicolas" } };
            // {0} = nom; {1} = prénom

            Console.WriteLine($"Nom : {names[0, 0]} | Prénom : {names[0, 1]}");

            Console.WriteLine(names.Length);

            for (int i = 0; i < names.Length / 2; i++)
            {
                Console.WriteLine($"Nom : {names[0, i]} | Prénom : {names[1, i]}");
            }
        }
    }
}
