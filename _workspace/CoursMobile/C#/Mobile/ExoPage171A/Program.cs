using System;

namespace ExoPage171A
{
    class Program
    {
        static void Main(string[] args)
        {
            const int TAILLE = 5;
            Point?[,] points = new Point?[TAILLE,TAILLE];


            for (int i = 0; i < TAILLE; i++)
            {
                Point p;
                p.X = i + 1;
                p.Y = i + 1;
                points[i, i] = p;
            }

            for (int i = 0; i < TAILLE; i++)
            {
                for (int j = 0; j < TAILLE; j++)
                {
                    if (points[i, j] is null) Console.Write("\t");
                    else Console.WriteLine($"X : {((Point) points[i, j]).X} - Y : {((Point)points[i, j]).Y}");
                }
                Console.WriteLine();
            }

        }

        struct Point
        {
            public int X, Y;
        }

    }
}
