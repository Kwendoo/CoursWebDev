using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CourseAutomobile.Model
{
    class Circuit
    {

        public double Distance;
        public double Tour;

        public Circuit(double Tour, double Distance)
        {
            this.Tour = Tour;
            this.Distance = Distance;
        }

        public double RecupDist()
        {
            return this.Distance;
        }

        public double RecupTour()
        {
            return this.Tour;
        }

    }
}
