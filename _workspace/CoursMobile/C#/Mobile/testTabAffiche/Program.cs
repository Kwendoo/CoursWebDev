using System;

namespace testTabAffiche
{
    class Program
    {
        static void Main(string[] args)
        {
            int[,] Tab = new int[5, 5];

            for (int i = 0; i < 5; i++)
            {
                for (int j = 0; j < 5; j++)
                {
                    Tab[i, j] = j+1;
                    Console.Write(Tab[i, j]);
                }
                Console.WriteLine();
            }
        }
    }
}
