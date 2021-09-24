using System;
using System.Data.SqlClient;

namespace ExoP86
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

            Student sfabio = new Student("Gioe", "Fabio", new DateTime(1985, 05, 11), 16, 1010);

            string ConnectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=ADO;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

            using (SqlConnection c = new SqlConnection())
            {
                c.ConnectionString = ConnectionString;
                using (SqlCommand cmd = c.CreateCommand())
                {


                    cmd.CommandText = $"INSERT INTO Student" +
                                    $" (LastName, FirstName, BirthDate, YearResult, SectionId) " +
                                    $"OUTPUT INSERTED.ID " +
                                    $"VALUES (@LastName, @FirstName, @BirthDate, @YearResult, @SectionId)";

                    cmd.Parameters.AddWithValue("LastName", sfabio.LastName);
                    cmd.Parameters.AddWithValue("FirstName", sfabio.FirstName);
                    cmd.Parameters.AddWithValue("BirthDate", $"{sfabio.BirthDate.Month}-{sfabio.BirthDate.Day}-{sfabio.BirthDate.Year}");
                    cmd.Parameters.AddWithValue("YearResult", sfabio.YearResult);
                    cmd.Parameters.AddWithValue("SectionId", sfabio.SectionId);
                    
                    c.Open();

                    int InsertedId = (int)cmd.ExecuteScalar();

                    c.Close();

                    Console.WriteLine(InsertedId);
                }
            }
        }
    }
}
