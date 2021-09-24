using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Carwash2
{
    public class Voiture
    {
        public string Plaque { get; private set; }

        public Voiture(string Plaque)
        {
            this.Plaque = Plaque;
        }
    }
}