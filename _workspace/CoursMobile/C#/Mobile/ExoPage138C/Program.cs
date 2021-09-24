using System;

namespace ExoPage138C
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

            if ((tenNumber % 97 == twoNumber) || ((tenNumber % 97 == 0) && (twoNumber == 97))) {
                Console.WriteLine("Votre code BBAN est correct, voici votre IBAN : ");

                string addTwo = twoLast + twoLast + 111400;
                long prefixe = long.Parse(addTwo);
                short ibCheck = (short)(98 - (prefixe % 97));

                Console.WriteLine($"BE{ibCheck}{bban}");

            }
            else Console.WriteLine("Votre code BBAN est incorrect !");
        }
    }
}
