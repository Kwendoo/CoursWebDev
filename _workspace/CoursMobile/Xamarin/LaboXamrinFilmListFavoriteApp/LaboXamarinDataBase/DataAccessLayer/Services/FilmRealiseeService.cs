using DataAccessLayer.Interfaces;
using DataAccessLayer.Models;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ToolBox.Database;

namespace DataAccessLayer.Services
{
    public class FilmRealiseeService : IFilmRealiseeService
    {
        private string _connectionString;
        private Connection _Connection;

        public FilmRealiseeService(IConfiguration config)
        {
            _connectionString = config.GetConnectionString("default");

            _Connection = new Connection(SqlClientFactory.Instance, _connectionString);
        }

        private MovieTitle Converter(IDataReader reader)
        {
            return new MovieTitle
            {
                Id = (int)reader["Id"],
                PersonId = (int)reader["PersonId"],
                Title = reader["Title"].ToString()
            };
        }

        public IEnumerable<MovieTitle> GetAll()
        {
            Command command = new Command("SELECT * FROM RealisedMovie");

            _Connection.Open();
            IEnumerable<MovieTitle> castings = _Connection.ExecuteReader(command, Converter).ToList();
            _Connection.Close();

            return castings;
        }

        public IEnumerable<MovieTitle> GetById(int Id)
        {
            Command command = new Command("SELECT * FROM RealisedMovie WHERE PersonId = @Id");
            command.AddParameter("Id", Id);

            _Connection.Open();
            IEnumerable<MovieTitle> castings = _Connection.ExecuteReader(command, Converter).ToList();
            _Connection.Close();

            return castings;
        }
    }
}
