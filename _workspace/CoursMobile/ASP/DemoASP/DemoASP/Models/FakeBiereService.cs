using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DemoASP.Models
{
    public class FakeBiereService : IFakeBiereService
    {
        public List<Biere> ListeBiere { get; set; }

        public FakeBiereService()
        {
            ListeBiere = new List<Biere>()
            {
                new Biere {Id = 1, Nom = "Maredsous Blonde", Alcool = 6, Type = "Abbaye"}
            };
        }

        public List<Biere> GetAll()
        {
            return ListeBiere;
        }

        public void Insert(Biere b)
        {
            int maxId = ListeBiere.Max(x => x.Id);
            b.Id = ++maxId;
            ListeBiere.Add(b);
        }

        public void Delete(int Id)
        {
            ListeBiere.Remove(ListeBiere.Where(x => x.Id == Id).First());
        }

        public Biere GetById(int Id)
        {
            return ListeBiere.Where(x => x.Id == Id).FirstOrDefault();
        }
    }
}
