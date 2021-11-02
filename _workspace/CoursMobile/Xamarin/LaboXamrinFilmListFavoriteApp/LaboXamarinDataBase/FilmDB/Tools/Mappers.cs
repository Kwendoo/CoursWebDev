using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using API = FilmDB.Models;
using DAL = DataAccessLayer.Models;



namespace FilmDB.Tools
{
    public static class Mappers
    {
        public static API.Movie ToAPI(this DAL.Movie c)
        {
            return new API.Movie
            {
                Id = c.Id,
                Name = c.Name,
                ReleaseYear = c.ReleaseYear,
                Synopsis = c.Synopsis,
                PosterUrl = c.PosterUrl,
                RealisatorId = c.RealisatorId,
                ScenaristId = c.ScenaristId,
                CategoryId = c.CategoryId,
                PersonalComment = c.PersonalComment
            };
        }

        public static DAL.Movie ToDAL(this API.Movie c)
        {
            return new DAL.Movie
            {
                Id = c.Id,
                Name = c.Name,
                ReleaseYear = c.ReleaseYear,
                Synopsis = c.Synopsis,
                PosterUrl = c.PosterUrl,
                RealisatorId = c.RealisatorId,
                ScenaristId = c.ScenaristId,
                CategoryId = c.CategoryId,
                PersonalComment = c.PersonalComment
            };
        }

        public static API.Casting ToAPI(this DAL.Casting c)
        {
            return new API.Casting
            {
                Id = c.Id,
                MovieId = c.MovieId,
                PersonId = c.PersonId,
                Role = c.Role
            };
        }

        public static DAL.Casting ToDAL(this API.Casting c)
        {
            return new DAL.Casting
            {
                Id = c.Id,
                MovieId = c.MovieId,
                PersonId = c.PersonId,
                Role = c.Role
            };
        }

        public static API.Person ToAPI(this DAL.Person c)
        {
            return new API.Person
            {
                Id = c.Id,
                LastName = c.LastName,
                FirstName = c.FirstName,
                PictureUrl = c.PictureUrl
            };
        }

        public static DAL.Person ToDAL(this API.Person c)
        {
            return new DAL.Person
            {
                Id = c.Id,
                LastName = c.LastName,
                FirstName = c.FirstName,
                PictureUrl = c.PictureUrl
            };
        }

        public static API.Category ToAPI(this DAL.Category c)
        {
            return new API.Category
            {
                Id = c.Id,
                Nom = c.Nom
            };
        }

        public static DAL.Category ToDAL(this API.Category c)
        {
            return new DAL.Category
            {
                Id = c.Id,
                Nom = c.Nom
            };
        }

        public static API.TitleMovie ToAPI(this DAL.TitleMovie c)
        {
            return new API.TitleMovie
            {
                Id = c.Id,
                PersonId = c.PersonId,
                Title = c.Title
            };
        }

        public static DAL.TitleMovie ToDAL(this API.TitleMovie c)
        {
            return new DAL.TitleMovie
            {
                Id = c.Id,
                PersonId = c.PersonId,
                Title = c.Title
            };
        }
    }
}
