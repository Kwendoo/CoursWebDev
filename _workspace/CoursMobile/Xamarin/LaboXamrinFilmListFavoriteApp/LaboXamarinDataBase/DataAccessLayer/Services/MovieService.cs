using DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ToolBox.Database;
using System.Data.SqlClient;
using System.Data;
using DataAccessLayer.Models;
using Microsoft.Extensions.Configuration;

namespace DataAccessLayer.Services
{
    public class MovieService : IMovieService
    {
        private string _connectionString;
        private Connection _Connection;

        public MovieService(IConfiguration config)
        {
            _connectionString = config.GetConnectionString("default");

            _Connection = new Connection(SqlClientFactory.Instance, _connectionString);
        }

        private Movie Converter(IDataReader reader)
        {
            return new Movie
            {
                Id = (int)reader["Id"],
                Name = reader["Nom"].ToString(),
                ReleaseYear = (int)reader["ReleaseYear"],
                Synopsis = reader["Synopsis"].ToString(),
                PosterUrl = reader["PosterUrl"].ToString(),
                RealisatorId = (int)reader["RealisatorId"],
                ScenaristId = (int)reader["ScenaristId"],
                CategoryId = (int)reader["CategoryId"],
                PersonalComment = reader["PersonalComment"].ToString()
            };
        }

        public IEnumerable<Movie> GetAll()
        {
            Command command = new Command("SELECT * FROM Movie");

            _Connection.Open();
            IEnumerable<Movie> movies = _Connection.ExecuteReader(command, Converter).ToList();
            _Connection.Close();

            return movies;
        }

        public IEnumerable<Movie> GetByCategory(int Id)
        {
            Command command = new Command("SELECT * FROM Movie WHERE CategoryId = @Id");
            command.AddParameter("Id", Id);

            _Connection.Open();
            IEnumerable<Movie> movies = _Connection.ExecuteReader(command, Converter).ToList();
            _Connection.Close();

            return movies;
        }
    }
}
