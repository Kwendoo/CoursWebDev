namespace Carwarsh
{
    public class Carwash
    {
        CarwashDelegate cd = null;

        public Carwash()
        {
            // Fonction anonyme
            cd += delegate (Voiture v)
            {
                System.Console.WriteLine($"Je prépare la voiture : {v.Plaque}");
            };

            // Instruction Lambda
            cd += (Voiture v) =>
            {
                System.Console.WriteLine($"Je lave la voiture : {v.Plaque}");
            };

            // Expression Lambda
            cd += (Voiture v) => System.Console.WriteLine($"Je sèche la voiture : {v.Plaque}");
            cd += (Voiture v) => System.Console.WriteLine($"Je finalise la voiture : {v.Plaque}");
        }

        public void Traiter(Voiture v)
        {
            if (cd is not null) cd(v);
        }
    }
}