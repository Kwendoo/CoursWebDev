using System;

namespace GestionBanque09.Model
{
    interface IBanker : ICustumer
    {
        // Propriétés
        Personne Titulaire { get; }
        string Numero { get; }

        // Méthode
        void AppliquerInteret();
    }
}
