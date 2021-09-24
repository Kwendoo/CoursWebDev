using System;

namespace Mobile.Converssion
{
    class Program
    {
        static void Main(string[] args)
        {
            //Conertir vers string
            int a = 3;
            bool b = true;
            float c = 3.4F;

            string d = a.ToString();

            Console.WriteLine(d);

            //string vers valeur

            Console.Clear();

            //--CONVERT--
            string s1 = "12";

            int n1 = Convert.ToInt32(s1);

            Console.WriteLine("{0} : {1}", n1, n1.GetType());

            //--Parse--
            string s2 = "true";

            bool booleen = bool.Parse(s2);

            Console.WriteLine("{0} : {1}", booleen, booleen.GetType());

            //--TryParse--
            string s3 = "2,4";

            double number;

            bool isSuccess = double.TryParse(s3, out number);

            Console.WriteLine("{0} {1} {2}", s3, number, isSuccess);

            //Boxing et UnBoxing





        }
    }
}
