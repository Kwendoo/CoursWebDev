using System;
using System.Data.SqlClient;

namespace OrderDML
{
    class Program
    {
        static void Main(string[] args)
        {
            string ConnectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=ADO;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

            using(SqlConnection c = new SqlConnection())
            {
                c.ConnectionString = ConnectionString;
                using(SqlCommand cmd = c.CreateCommand())
                {
                    //cmd.CommandText = "INSERT INTO TestDML (Nom) VALUES ('Antoine')";

                    //c.Open();
                    //int rows = cmd.ExecuteNonQuery();
                    //c.Close();

                    cmd.CommandText = "INSERT INTO TestDML (Nom) OUTPUT INSERTED.ID VALUES ('Antoine')";

                    c.Open();
                    int idInserted = (int)cmd.ExecuteScalar();
                    c.Close();

                    Console.WriteLine(idInserted);
                }
            }
        }
    }
}
