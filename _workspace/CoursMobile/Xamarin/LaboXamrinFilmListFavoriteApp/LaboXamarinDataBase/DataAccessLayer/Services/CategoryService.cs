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
    public class CategoryService : ICategoryService
    {
        private string _connectionString;
        private Connection _Connection;

        public CategoryService(IConfiguration config)
        {
            _connectionString = config.GetConnectionString("default");

            _Connection = new Connection(SqlClientFactory.Instance, _connectionString);
        }

        private Category Converter(IDataReader reader)
        {
            return new Category
            {
                Id = (int)reader["Id"],
                Nom = reader["Nom"].ToString(),
            };
        }

        public IEnumerable<Category> GetAll()
        {
            Command command = new Command("SELECT * FROM Category");

            _Connection.Open();
            IEnumerable<Category> categories = _Connection.ExecuteReader(command, Converter).ToList();
            _Connection.Close();

            return categories;
        }

        public Category GetById(int Id)
        {
            Command command = new Command("SELECT * FROM Category WHERE Id = @Id");
            command.AddParameter("Id", Id);

            _Connection.Open();
            Category category = _Connection.ExecuteReader(command, Converter).SingleOrDefault();
            _Connection.Close();

            return category;
        }
    }
}
