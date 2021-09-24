using System;

namespace ExoPage104
{
    class Program
    {
        static void Main(string[] args)
        {
            // EX 1

            Console.WriteLine("Introduisez un nombre :");
            string i = Console.ReadLine();
            int i2 = int.Parse(i);

            Console.WriteLine("Introduisez un second nombre :");
            string j = Console.ReadLine();
            int j2 = int.Parse(j);

            int k = i2 + j2;

            Console.WriteLine(k);

            Console.Clear();




            // EX 2

            Console.WriteLine("Introduisez un nombre :");
            string l = Console.ReadLine();

            int l2;

            int.TryParse(l, out l2);


            Console.WriteLine("Introduisez un second nombre :");
            string m = Console.ReadLine();

            int m2;

            int.TryParse(m, out m2);

            int o = l2 + m2;

            Console.WriteLine(o);


        }
    }
}
