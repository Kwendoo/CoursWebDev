using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DAL = DataAccessLayer.Models;
using API = DemoAPI.Models;

namespace DemoAPI.Tools
{
    public static class Mappers
    {
        public static API.Contact ToAPI(this DAL.Contact c)
        {
            return new API.Contact
            {
                Id = c.Id,
                Nom = c.LastName,
                Prenom = c.FirstName,
                Email = c.Email,
                Telephone = c.Telephone,
                IsFavorite = c.IsFavorite
            };
        }

        public static DAL.Contact ToDAL(this API.ContactForm c)
        {
            return new DAL.Contact
            {
                Id = 0,
                LastName = c.LastName,
                FirstName = c.FirstName,
                Email = c.Email,
                Telephone = c.Telephone,
                IsFavorite = c.IsFavorite
            };
        }
    }
}
