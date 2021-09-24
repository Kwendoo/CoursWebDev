using System;

namespace ExoPage138B
{
    class Program
    {
        static void Main(string[] args)
        {

            Console.WriteLine("Veuillez introduire votre code BBAN sans tiret : ");
            string bban = Console.ReadLine();

            string tenFirst = bban.Substring(0, 10);
            string twoLast = bban.Substring(10, 2);

            long tenNumber = long.Parse(tenFirst);
            short twoNumber = short.Parse(twoLast);

            if ((tenNumber % 97 == twoNumber) || ((tenNumber % 97 == 0) && (twoNumber == 97))) Console.WriteLine("OK");
            else Console.WriteLine("KO");
        }
    }
}
