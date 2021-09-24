using System;

namespace ExoPage148B
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Entrez une valeur à factoriser : ");
            int numberFactorial = int.Parse(Console.ReadLine());
            int result = numberFactorial;

            for (int i = 1; i < numberFactorial; i++)
            {
                result = result * i;
            }
            Console.WriteLine(result);
        }
    }
}
