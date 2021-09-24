using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestionBanque08.Model
{
    interface ICustumer
    {

        // Propriétés
        double Solde { get; }

        // Méthodes
        void Depot(double Montant);
        void Retrait(double Montant);

    }
}
