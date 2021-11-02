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
    public class PersonService : IPersonService
    {
        private string _connectionString;
        private Connection _Connection;

        public PersonService(IConfiguration config)
        {
            _connectionString = config.GetConnectionString("default");

            _Connection = new Connection(SqlClientFactory.Instance, _connectionString);
        }

        private Person Converter(IDataReader reader)
        {
            return new Person
            {
                Id = (int)reader["Id"],
                LastName = reader["LastName"].ToString(),
                FirstName = reader["FirstName"].ToString(),
                PictureUrl = reader["PictureUrl"].ToString()
            };
        }

        public IEnumerable<Person> GetAll()
        {
            Command command = new Command("SELECT * FROM Person");

            _Connection.Open();
            IEnumerable<Person> castings = _Connection.ExecuteReader(command, Converter).ToList();
            _Connection.Close();

            return castings;
        }

        public Person GetById(int Id)
        {
            Command command = new Command("SELECT * FROM Person WHERE Id = @Id");
            command.AddParameter("Id", Id);

            _Connection.Open();
            Person castings = _Connection.ExecuteReader(command, Converter).SingleOrDefault();
            _Connection.Close();

            return castings;
        }
    }
}
