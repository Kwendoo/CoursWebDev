using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Course_de_Voiture
{
    class Circuit
    {
        private double distance;
        private double tours;
        public Circuit(double distance, int tours)
        {
            this.distance = distance;
            this.tours = tours;
        }

        public double getDistance()
        {
            return this.distance;
        }

        public double getTours()
        {
            return this.tours;
        }
    }
}
