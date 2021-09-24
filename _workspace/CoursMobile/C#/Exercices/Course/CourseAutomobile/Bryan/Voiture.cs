using System;
using System.Collections.Generic;

namespace Course_de_Voiture
{
    class Voiture
    {
        private int carNumber;
        private double vitesseMax;
        private double vitesseMin;
        private List<double> total_vitesses;

        public Voiture(int carNumber, double vitesseMin, double vitesseMax)
        {
            this.carNumber = carNumber;
            this.total_vitesses = new List<double>();
            this.vitesseMax = vitesseMax;
            this.vitesseMin = vitesseMin;
        }

        public double getVitesseMax()
        {
            return this.vitesseMax;
        }

        public double getVitesseMin()
        {
            return this.vitesseMin;
        }

        public List<double> getTotal()
        {
            return this.total_vitesses;
        }

        private double getCircuitTime(double km)
        {
            return (new Random().Next((int)this.vitesseMin, (int)this.vitesseMax)) / km;
        }

        public void runOnce(double km)
        {
            this.total_vitesses.Add(getCircuitTime(km));
        }

        public double getTotalAsDouble()
        {
            double result = 0;
            foreach (double d in getTotal())
            {
                result += d;
            }
            return result;
        }

        public int getCarNumber()
        {
            return this.carNumber;
        }
    }
}
