using System;

namespace ExoPage148A
{
    class Program
    {
        //static int Fibonacci(int n)
        //{
        //    int w;
        //    if (n <= 0) return 0;
        //    if (n == 1) return 1;
        //    int u = 0;
        //    int v = 1;
        //    for (int i = 2; i <= n; i++)
        //    {
        //        w = u + v;
        //        u = v;
        //        v = w;
        //    };
        //    return v;
        //}

        //static void Main(string[] args)
        //{
        //    for (int I = 0; I < 25; I++)
        //    {
        //        Console.Write($"Nombre {I+1} : {Fibonacci(I)}");
        //    }
        //}


        static void Main(string[] args)
        {
            int nb1 = 0, nb2 = 1, temp;

            int i = 0;

            Console.Write($"{nb1}");

            while (i < 25)
            {
                Console.Write($", {nb2}");

                temp = nb1 + nb2;
                nb1 = nb2;
                nb2 = temp;


                i++;
            }
        }


    }
}
