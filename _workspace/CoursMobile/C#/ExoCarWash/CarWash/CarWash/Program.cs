using System;

namespace CarWash
{
    //delegate void ();
    class Program
    {
        static void Main(string[] args)
        {
            // Insatnciations
            CarWash car = new CarWash();

            // Création de la nouvelle voiture
            car.Traiter(new Voiture("1-TBC-173"));

        }
    }
}
