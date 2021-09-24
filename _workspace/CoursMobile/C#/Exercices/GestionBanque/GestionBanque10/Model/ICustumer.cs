using System;

namespace GestionBanque10.Model
{
    interface ICustumer
    {
        // Propriété
        double Solde { get; }

        // Méthodes
        void Depot(double Montant);
        void Retrait(double Montant);

    }
}
