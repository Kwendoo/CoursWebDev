using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ToolBox.Database;
using DataAccessLayer.Interfaces;
using DataAccessLayer.Models;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace DataAccessLayer.Services
{
    public class CastingService : ICastingService
    {

        private string _connectionString;
        private Connection _Connection;

        public CastingService(IConfiguration config)
        {
            _connectionString = config.GetConnectionString("default");

            _Connection = new Connection(SqlClientFactory.Instance, _connectionString);
        }

        private Casting Converter(IDataReader reader)
        {
            return new Casting
            {
                Id = (int)reader["Id"],
                MovieId = (int)reader["MovieId"],
                PersonId = (int)reader["PersonId"],
                Role = reader["Role"].ToString()
            };
        }

        public IEnumerable<Casting> GetAll()
        {
            Command command = new Command("SELECT * FROM Casting");

            _Connection.Open();
            IEnumerable<Casting> castings = _Connection.ExecuteReader(command, Converter).ToList();
            _Connection.Close();

            return castings;
        }

        public IEnumerable<Casting> GetByMovieId(int Id)
        {
            Command command = new Command("SELECT * FROM Casting WHERE MovieId = @Id");
            command.AddParameter("Id", Id);

            _Connection.Open();
            IEnumerable<Casting> castings = _Connection.ExecuteReader(command, Converter).ToList();
            _Connection.Close();

            return castings;
        }
    }
}
