using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestionBanque05.Model
{
    class Banque
    {

        public string Nom { get; set; }

        Dictionary<string, Compte> _Comptes = new Dictionary<string, Compte>();

        public Compte this[string Numero]
        {
            get
            {
                _Comptes.TryGetValue(Numero, out Compte compte);

                return compte;
            }
        }

        // Methode

        public void Ajouter (Compte compte)
        {
            if (_Comptes.TryAdd(compte.Numero, compte)) Console.WriteLine("Ajouté");
            else Console.WriteLine("Compte déjà existant");
        }

        public void Supprimer (string Numero)
        {
            _Comptes.Remove(Numero);
        }

        public double AvoirDesComptes (Personne titulaire)
        {
            double totalDesAvoirs = 0;

            foreach (KeyValuePair<string, Compte> kvp in _Comptes)
            {
                Compte compte = kvp.Value;
                if (compte.Titulaire == titulaire)
                    totalDesAvoirs += compte;
            }

            return totalDesAvoirs;
        }
    }
}
