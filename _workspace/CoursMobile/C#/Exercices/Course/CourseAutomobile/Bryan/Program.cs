using System;
using System.Collections.Generic;
using System.Threading;

namespace Course_de_Voiture
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Bienvenue a la Course de voiture !");
            Thread.Sleep(new TimeSpan(0, 0, 2));
            Dictionary<Voiture, double> results = new Dictionary<Voiture, double>();
            Circuit spa = new Circuit(25.65, 6);
            List<Voiture> voitures = generateCars(10);
            Thread.Sleep(new TimeSpan(0, 0, 2));
            Console.WriteLine("Lancement de la course!");
            Thread.Sleep(new TimeSpan(0, 0, 2));
            RunTrack(ref voitures, ref spa);
            Thread.Sleep(new TimeSpan(0, 0, 2));
            GetResult(ref voitures, ref results);
            Winner winner = SelectWinner(ref results);
            Thread.Sleep(new TimeSpan(0, 0, 2));
            Console.WriteLine("Le gagnant est la voiture: " + winner.Number + " avec un temps de: " + String.Format("{0:0.##}", winner.TotalTime) + " Seconde(s) !");
        }

        public static void RunTrack(ref List<Voiture> voitures, ref Circuit spa)
        {
            Console.WriteLine("Course en cours...");
            Thread.Sleep(new TimeSpan(0, 0, 5));
            for (int i = 0; i < spa.getTours(); i++)
            {
                foreach (Voiture v in voitures)
                {
                    v.runOnce(spa.getDistance());
                }
            }
            Console.WriteLine("Course terminée !");
        }

        public static void GetResult(ref List<Voiture> voitures, ref Dictionary<Voiture, double> results)
        {
            foreach (Voiture v in voitures)
            {
                results.Add(v, v.getTotalAsDouble());
            }
        }
        public static List<Voiture> generateCars(int amount)
        {
            Console.WriteLine("Enregistrement des voitures...");
            int carNumber = 0;
            List<Voiture> cars = new List<Voiture>();
            Random r = new Random();
            for(int i = 0; i < amount; i++)
            {
                double vitesseMin = r.Next(30, 110);
                double vitesseMax = r.Next(110, 250);
                cars.Add(new Voiture(carNumber++, vitesseMin, vitesseMax));
            }
            return cars;
        }

        public static Winner SelectWinner(ref Dictionary<Voiture, double> results)
        {
            Console.WriteLine("Calcul des résultats...");
            Winner winner = new Winner();
            foreach (KeyValuePair<Voiture, double> list in results)
            {
                if(winner.Number == 0)
                {
                    winner.Number = list.Key.getCarNumber();
                    winner.TotalTime = list.Value;
                }
                else if(winner.TotalTime < list.Value)
                {
                    winner.Number = list.Key.getCarNumber();
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
