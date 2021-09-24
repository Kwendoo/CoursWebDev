using System;

namespace ExoPage192B
{
    class Program
    {
        static void Main(string[] args)
        {
            EquationSecondDegre esd = new EquationSecondDegre
            {
                A = 4,
                B = 10,
                C = 1
            };

            if (esd.Resoudre(out double? X1, out double? X2))
            {
                Console.WriteLine("Equation possible");

                if (X2 is null) Console.WriteLine("Une solution trouvée " + X1);
                else Console.WriteLine("Deux solutions trouvées : X1 : " + X1 + " X2 : " + X2);
            }
            else
            {
                Console.WriteLine("Pas de solution");
            }
        }
    }
}
