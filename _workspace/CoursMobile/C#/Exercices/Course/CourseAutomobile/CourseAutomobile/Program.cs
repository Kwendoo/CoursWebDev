using CourseAutomobile.Model;
using System;
using System.Collections.Generic;

namespace CourseAutomobile
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Bienvenue a la Course de voiture !");

            Dictionary<Voiture, double> results = new Dictionary<Voiture, double>();
            Circuit spa = new Circuit(25.65, 6);

            List<Voiture> voitures = VoitureAlaLigne(10);
            Console.WriteLine("10 Coureurs sur la piste !");
            Console.WriteLine("Lancement de la course !");

            RunTrack(ref voitures, ref spa);

            GetResult(ref voitures, ref results);

            Winner winner = SelectWinner(ref results);

            Console.WriteLine("Le gagnant est la voiture: " + winner.Number + " avec un temps de: " + String.Format("{0:0.##}", winner.TotalTime) + " Seconde(s) !");
        }

        public static void RunTrack(ref List<Voiture> voitures, ref Circuit spa)
        {
            Console.WriteLine("Course en cours...");

            for (int i = 0; i < spa.RecupTour(); i++)
            {
                foreach (Voiture v in voitures)
                {
                    v.TpsTotalAdd(spa.RecupDist());
                }
            }
            Console.WriteLine("Course terminée !");
        }

        public static void GetResult(ref List<Voiture> voitures, ref Dictionary<Voiture, double> results)
        {
            foreach (Voiture v in voitures)
            {
                results.Add(v, v.RecupTotalVitesse());
            }
        }
        public static List<Voiture> VoitureAlaLigne(int amount)
        {
            Console.WriteLine("Enregistrement des voitures...");
            int Num = 0;
            List<Voiture> cars = new List<Voiture>();
            Random r = new Random();
            for (int i = 0; i < amount; i++)
            {
                double vMin = r.Next(30, 100);
                double vMax = r.Next(110, 250);
                cars.Add(new Voiture(Num++, vMax, vMin));
            }
            return cars;
        }

        public static Winner SelectWinner(ref Dictionary<Voiture, double> results)
        {
            Console.WriteLine("Calcul des résultats...");
            Winner winner = new Winner();
            foreach (KeyValuePair<Voiture, double> list in results)
            {
                if (winner.Number == 0)
                {
                    winner.Number = list.Key.RecupNumVoiture();
                    winner.TotalTime = list.Value;
                }
                else if (winner.TotalTime < list.Value)
                {
                    winner.Number = list.Key.RecupNumVoiture();
                    winner.TotalTime = list.Value;
                }
            }
            return winner;
        }

        public struct Winner
        {
            public int Number;
            public double TotalTime;
        }
    }
}
