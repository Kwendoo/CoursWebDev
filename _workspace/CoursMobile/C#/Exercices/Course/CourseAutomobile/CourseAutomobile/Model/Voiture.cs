using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CourseAutomobile.Model
{
    class Voiture
    {

        public int NumVoiture;
        public double vMax;
        public double vMin;
        public List<double> vTotal;

        public Voiture(int Num, double vMax, double vMin)
        {
            this.NumVoiture = Num;
            this.vMax = vMax;
            this.vMin = vMin;
        }

        public double RecupVMax()
        {
            return this.vMax;
        }
        public double RecupVMin()
        {
            return this.vMin;
        }

        public List<double> RecupVitesse()
        {
            return this.vTotal;
        }

        private double RecupTpsTour(double dist)
        {
            return (new Random().Next((int)this.vMax, (int)this.vMin)) / dist;
        }

        public void TpsTotalAdd(double dist)
        {
            this.vTotal.Add(RecupTpsTour(dist));
        }

        public double RecupTotalVitesse()
        {
            double result = 0;
            foreach (double d in RecupVitesse())
            {
                result += d;
            }
            return result;
        }

        public int RecupNumVoiture()
        {
            return this.NumVoiture;
        }

    }
}
