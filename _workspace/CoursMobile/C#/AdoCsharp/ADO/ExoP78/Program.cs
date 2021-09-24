using System;
using System.Data;
using System.Data.SqlClient;

namespace ExoP78
{
    class Program
    {
        static void Main(string[] args)
        {


            using (SqlConnection connection = new SqlConnection())
            {
                connection.ConnectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=ADO;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

                using (SqlCommand cmd = connection.CreateCommand())
                {

                    connection.Open();

                    // Exo page 78A

                    Console.WriteLine($"--------------------------------------------------------------------");
                    Console.WriteLine($"--------------------------------------------------------------------");
                    Console.WriteLine($"-------------------------Exo page 78 A------------------------------");
                    Console.WriteLine($"--------------------------------------------------------------------");
                    Console.WriteLine($"--------------------------------------------------------------------");

                    cmd.CommandText = "SELECT Id AS ID, LastName AS Nom, FirstName AS Prenom FROM V_Student";

                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    if (ds.Tables.Count > 0)
                    {
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            Console.WriteLine($"L'étudiant n°{dr["ID"]} {dr["Nom"]} {dr["Prenom"]} est présent dans la table V_Student");
                        }
                    }

                    

                    // Exo page 78B

                    Console.WriteLine($"--------------------------------------------------------------------");
                    Console.WriteLine($"--------------------------------------------------------------------");
                    Console.WriteLine($"-------------------------Exo page 78 B------------------------------");
                    Console.WriteLine($"--------------------------------------------------------------------");
                    Console.WriteLine($"--------------------------------------------------------------------");

                    cmd.CommandText = "SELECT Id AS ID, SectionNAme AS Nom FROM Section";

                    SqlDataAdapter da3 = new SqlDataAdapter();
                    da3.SelectCommand = cmd;
                    DataSet ds3 = new DataSet();
                    da3.Fill(ds3);

                    if (ds3.Tables.Count > 0)
                    {
                        foreach (DataRow dr3 in ds3.Tables[0].Rows)
                        {
                            Console.WriteLine($"La section n°{dr3["ID"]} porte le nom {dr3["Nom"]}");
                        }
                    }

                    // Exo page 78C

                    Console.WriteLine($"--------------------------------------------------------------------");
                    Console.WriteLine($"--------------------------------------------------------------------");
                    Console.WriteLine($"-------------------------Exo page 78 C------------------------------");
                    Console.WriteLine($"--------------------------------------------------------------------");
                    Console.WriteLine($"--------------------------------------------------------------------");

                    //cmd.CommandText = "SELECT FirstName, YearResult FROM Student";

                    //SqlDataAdapter da2 = new SqlDataAdapter();
                    //da2.SelectCommand = cmd;
                    //DataSet ds2 = new DataSet();
                    //da2.Fill(ds2);

                    //if (ds2.Tables.Count > 0)
                    //{
                    //    foreach (DataRow dr2 in ds2.Tables[0].Rows)
                    //    {
                    //        Console.WriteLine($"L'étudiant {dr2["FirstName"]} à une moyenne de {dr2["YearResult"]}");
                    //    }
                    //}

                    cmd.CommandText = "SELECT AVG(YearResult) AS Moyenne FROM Student";
                    int moyenne = (int)cmd.ExecuteScalar();

                    Console.WriteLine($"Moyenne des students : {moyenne}");

                    connection.Close();
                }
            }

        }
    }
}
