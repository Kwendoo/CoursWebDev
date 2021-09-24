using System.Collections.Generic;
using System.Linq;

namespace GestionBanque09.Model
{
    class Banque
    {
        // Attributs
        Dictionary<string, Compte> _Comptes = new Dictionary<string, Compte>();

        // Propriétés
        public string Nom { get; set; }
        public KeyValuePair<string, Compte>[] Compte
        {
            get
            {
                return _Comptes.ToArray();
            }
        }

        public Compte this[string Numero]
        {
            get
            {
                _Comptes.TryGetValue(Numero, out Compte compte);
                return compte;
            }
        }

        // Méthodes
        public void Ajouter(Compte compte)
        {
            if (_Comptes.TryAdd(compte.Numero, compte)) System.Console.WriteLine("Compte ajouté : " + compte.Numero);
            else System.Console.WriteLine("Le compte existe déjà.");
        }

        public void Supprimer(string Numero)
        {
            _Comptes.Remove(Numero);
        }

        public double AvoirDesComptes(Personne titulaire)
        {
            double totalDesAvoirs = 0;

            foreach (KeyValuePair<string, Compte> kvp in _Comptes)
            {
                Compte compte = kvp.Value;
                if (compte.Titulaire == titulaire) totalDesAvoirs += compte;
            }

            return totalDesAvoirs;
        }
    }
}
