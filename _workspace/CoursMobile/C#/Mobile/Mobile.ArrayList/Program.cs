using System;

using System.Collections;

namespace Mobile.List
{
    class Program
    {
        static void Main(string[] args)
        {
            //Collections/listes

            //ArrayList
            ArrayList list = new ArrayList();

            Console.WriteLine("Combien de valeurs voulez vous enregistrer ?");
            int nbValues = int.Parse(Console.ReadLine());

            for (int i = 0; i < nbValues; i++)
            {
                Console.WriteLine($"Encodez la valeur {i + 1} : ");
                Console.WriteLine("De quel type sera encodée la valeur ? (string ou int)");

                bool isString = Console.ReadLine() == "string";

                if (isString)
                {
                    list.Add(Console.ReadLine());
                }
                else
                {
                    list.Add(int.Parse(Console.ReadLine()));
                }
            }

            Console.WriteLine("-- Affichage --");

            foreach (object value in list)
            {
                Console.WriteLine(value);
            }
        }
    }
}
