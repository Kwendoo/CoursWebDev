using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarWash
{
    class Voiture
    {

        // Attribut 
        private string _plaque;

        // Propriété
        public string Plaque
        {
            get { return _plaque; }
            private set { _plaque = value; }
        }


        // Constructeurs

        public Voiture (string Numero)
        {
            _plaque = Numero;
        }


    }
}
