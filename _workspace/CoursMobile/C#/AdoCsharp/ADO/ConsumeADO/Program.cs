using System;
using System.Data;
using System.Data.SqlClient;

namespace ConsumeADO
{
    class Program
    {
        static void Main(string[] args)
        {
            //string ConnectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=ADO;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

            //SqlConnection connection = new SqlConnection();
            //connection.ConnectionString = ConnectionString;
            //connection.Open();
            //Console.WriteLine(connection.State);
            //connection.Close();

            using(SqlConnection connection = new SqlConnection())
            {
                connection.ConnectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=ADO;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

                using (SqlCommand cmd = connection.CreateCommand()) 
                {
                    // cmd -> executeScalar

                    //cmd.CommandText = "SELECT TOP 1 LastName FROM Student";
                    //connection.Open();

                    //string LastName = (string)cmd.ExecuteScalar(); //Execute scalar ne renvoie qu'un résultat rien d'autre

                    //connection.Close();

                    //Console.WriteLine(LastName);

                    //--------------------------------------------------------------------------------

                    //cmd -> SqlDataReader

                    //cmd.CommandText = "SELECT * FROM Student";
                    //connection.Open();

                    //using(SqlDataReader reader = cmd.ExecuteReader())
                    //{
                    //    while (reader.Read())
                    //    {
                    //        Console.WriteLine($"L'étudiant : {reader["LastName"]} {reader["FirstName"]}" + 
                    //                        $" de la section {reader["SectionId"]} à eu {reader["YearResult"]} comme moyenne de l'année");
                    //    }
                    //}

                    //connection.Close();

                    //---------------------------------------------------------------------------------

                    //cmd -> DataSet

                    //cmd.CommandText = "SELECT * FROM Section";

                    //SqlDataAdapter da = new SqlDataAdapter();
                    //da.SelectCommand = cmd;
                    //DataSet ds = new DataSet();
                    //da.Fill(ds);

                    //cmd.CommandText = "SELECT * FROM Student";
                    //da.SelectCommand = cmd;
                    //da.Fill(ds);

                    //if (ds.Tables.Count > 0)
                    //{
                    //    foreach (DataRow dr in ds.Tables[0].Rows)
                    //    {
                    //        Console.WriteLine($"L'étudiant : {dr["LastName"]} {dr["FirstName"]}" +
                    //                        $" de la section {dr["SectionId"]} à eu {dr["YearResult"]} comme moyenne de l'année");

                    //    }
                    //}

                    // ----------------------------------------------------------------------------------

                }
            }
        }
    }
}
