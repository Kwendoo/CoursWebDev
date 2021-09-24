using System;
using System.Data.SqlClient;

namespace CallProcStock
{
    public struct Student
    {
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public DateTime BirthDate { get; set; }
        public int YearResult { get; set; }
        public int SectionId { get; set; }

        public Student(string _LastName, string _FirstName, DateTime _BirthDate, int _YearResult, int _SectionId)
        {
            LastName = _LastName;
            FirstName = _FirstName;
            BirthDate = _BirthDate;
            YearResult = _YearResult;
            SectionId = _SectionId;
        }
    }

    class Program
    {
        static void Main(string[] args)
        {

            Student sfabio = new Student("Fibonaci", "FabioRella", new DateTime(1985, 05, 11), 16, 1010);
            using (SqlConnection connection = new SqlConnection())
            {
                connection.ConnectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=ADO;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

                using (SqlCommand cmd = connection.CreateCommand())
                {
                    // Façon 1 appel par Exec
                        //cmd.CommandText = "exec AddStudent @FirstName=@_FirstName, @LastName=@_LastName, @BirthDate=@_BirthDate, @YearResult=@_YearResult, @SectionId=@_SectionId ;";

                        //cmd.Parameters.AddWithValue("_FirstName", sfabio.FirstName);
                        //cmd.Parameters.AddWithValue("_LastName", sfabio.LastName);
                        //cmd.Parameters.AddWithValue("_BirthDate", $"{sfabio.BirthDate.Month}-{sfabio.BirthDate.Day}-{sfabio.BirthDate.Year}");
                        //cmd.Parameters.AddWithValue("_YearResult", sfabio.YearResult);
                        //cmd.Parameters.AddWithValue("_SectionId", sfabio.SectionId);

                    // par le command type

                        cmd.CommandText = "AddStudent";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;


                        cmd.Parameters.AddWithValue("FirstName", sfabio.FirstName);
                        cmd.Parameters.AddWithValue("LastName", sfabio.LastName);
                        cmd.Parameters.AddWithValue("BirthDate", $"{sfabio.BirthDate.Month}-{sfabio.BirthDate.Day}-{sfabio.BirthDate.Year}");
                        cmd.Parameters.AddWithValue("YearResult", sfabio.YearResult);
                        cmd.Parameters.AddWithValue("SectionId", sfabio.SectionId);


                    connection.Open();
                    int InsertedID = (int)cmd.ExecuteScalar();
                    connection.Close();

                    Console.WriteLine(InsertedID);

                }
            }
        }
    }
}
