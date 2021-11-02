using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FilmDB.Models
{
    public class Movie
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int ReleaseYear { get; set; }
        public string Synopsis { get; set; }
        public string PosterUrl { get; set; }
        public int RealisatorId { get; set; }
        public int ScenaristId { get; set; }
        public int CategoryId { get; set; }
        public string PersonalComment { get; set; }
    }
}
