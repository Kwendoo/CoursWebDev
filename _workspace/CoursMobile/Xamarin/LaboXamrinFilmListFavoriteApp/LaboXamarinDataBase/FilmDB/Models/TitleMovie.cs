using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FilmDB.Models
{
    public class TitleMovie
    {
        public int Id { get; set; }
        public int PersonId { get; set; }
        public string Title { get; set; }
    }
}
