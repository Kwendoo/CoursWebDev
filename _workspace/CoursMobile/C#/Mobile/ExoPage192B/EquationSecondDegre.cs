using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExoPage192B
{
    struct EquationSecondDegre
    {
        public double A, B, C;

        public bool Resoudre(out Nullable<double> X1, out double? X2)
        {
            X1 = null;
            X2 = null;

            double delta = GetDelta();

            if (delta < 0) return false;
            else if (delta == 0)
            {
                X1 = GetFinalResult();
            }
            else
            {
                X1 = GetFinalResult(-Math.Sqrt(delta));
                X2 = GetFinalResult(Math.Sqrt(delta));
            }

            return true;
        }

        public double GetDelta()
        {
            return (B * B) - 4 * A * C;
        }

        public double GetFinalResult(double sqrtDelta = 0)
        {
            return (-B + sqrtDelta) / (2 * A);
        }
    }
}
