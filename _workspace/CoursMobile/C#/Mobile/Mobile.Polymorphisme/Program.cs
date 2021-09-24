using System;

namespace Mobile.Polymorphisme
{
    class Program
    {
        static void Main(string[] args)
        {
            Vehicule vehicule = new Vehicule();
            Vehicule vc = new VoitureDeCourse(); // Casting implicite
            Vehicule bateau = new Bateau();
            object o = new Bateau();             // Casting implicite

            Vehicule b = (Bateau)o;              // Casting explicite

            vehicule.SeDeplacer();
            Console.WriteLine();
            vc.SeDeplacer();
            Console.WriteLine();
            bateau.SeDeplacer();
            Console.WriteLine();
            b.SeDeplacer();
        }
    }

    class Vehicule
    {
        public virtual void SeDeplacer()
        {
            Console.Write("Je me déplace ..."); ;
        }
    }

    class Voiture : Vehicule
    {
        public override void SeDeplacer()
        {
            base.SeDeplacer();
            Console.Write("En voiture");
        }
    }

    class Bateau : Vehicule
    {
        public override void SeDeplacer()
        {
            base.SeDeplacer();
            Console.Write("En bateau");
        }
    }

    class VoitureDeCourse : Vehicule
    {
        public override void SeDeplacer()
        {
            base.SeDeplacer();
            Console.Write("En voiture de course");
        }
    }
}
