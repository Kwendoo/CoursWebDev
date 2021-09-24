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

            Student s1 = new Student("Jaquie", "Rounio", new DateTime(1993, 06, 23), 14, 1010);

            string ConnectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=ADO;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

            using (SqlConnection c = new SqlConnection())
            {
                c.ConnectionString = ConnectionString;
                using (SqlCommand cmd = c.CreateCommand())
                {

                    //cmd.CommandText = $"INSERT INTO Student" +
                    //                $" (LastName, FirstName, BirthDate, YearResult, SectionId) " +
                    //                $"OUTPUT INSERTED.ID " +
                    //                $"VALUES ('{s1.LastName}', '{s1.FirstName}', " +
                    //                $"'{s1.BirthDate.Month}-{s1.BirthDate.Day}-{s1.BirthDate.Year}', " +
                    //                $"'{s1.YearResult}', '{s1.SectionId}')";
                    //"INSERT INTO Student (LastName, FirstName, BirthDate, YearResult, SectionId) OUTPUT INSERTED.ID VALUES ('Lagna', 'Antonio', '23-06-33 00:00:00', '14',

                    // Version avec parametres
                    cmd.CommandText = $"INSERT INTO Student" +
                                    $" (LastName, FirstName, BirthDate, YearResult, SectionId) " +
                                    $"OUTPUT INSERTED.ID " +
                                    $"VALUES (@FirstName, @LastName, @BirthDate, @YearResult, @SectionId)";
                    SqlParameter _FirstName = new SqlParameter()
                    {
                        ParameterName = "FirstName",
                        Value = s1.FirstName
                    };

                    cmd.Parameters.Add(_FirstName);

                    // Plus simple mais ne fonctionne pas sur tout les DB, SQL server OK
                    cmd.Parameters.AddWithValue("LastName", s1.LastName);
                    cmd.Parameters.AddWithValue("MounthDate", s1.BirthDate.Month);
                    cmd.Parameters.AddWithValue("BirthDate", $"{s1.BirthDate.Month}-{s1.BirthDate.Day}-{s1.BirthDate.Year}");
                    cmd.Parameters.AddWithValue("YearResult", s1.YearResult);
                    cmd.Parameters.AddWithValue("SectionId", s1.SectionId);


                    c.Open();

                    int idInserted = (int)cmd.ExecuteScalar();

                    c.Close();

                    Console.WriteLine(idInserted);
                }
            }
        }
    }
}
