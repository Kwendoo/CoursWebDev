using System;

namespace ExoPage192A
{
    class Program
    {
        static void Main(string[] args)
        {
            Celcius c1;
            c1.Temperature = 12D;

            // (12°C × 9/5) + 32 = 53,6°F

            Console.WriteLine(c1.ToFahrenheit());
            Console.WriteLine(c1.ToFahrenheit(new Celcius() { Temperature = 12D }));
            Console.WriteLine(c1.ToFahrenheit(12D));


            Fahrenheit f1;
            f1.Temperature = 53.6D;

            // (53,6°F − 32) × 5/9 = 12°C

            Console.WriteLine(f1.ToCelcius());
            Console.WriteLine(f1.ToCelcius(new Fahrenheit() { Temperature = 53.6D }));
            Console.WriteLine(f1.ToCelcius(53.6D));

        }

        struct Celcius
        {
            public double Temperature;

            public double ToFahrenheit()
            {
                return (Temperature * 9 / 5) + 32;
            }

            public double ToFahrenheit(Celcius celcius)
            {
                // return (celcius.Temperature * 9 / 5) + 32;
                return celcius.ToFahrenheit();
            }

            public double ToFahrenheit(double temp)
            {
                return (temp * 9 / 5) + 32;
            }
        }

        struct Fahrenheit
        {
            public double Temperature;

            public double ToCelcius()
            {
                return (Temperature - 32) * 5 / 9;
            }

            public double ToCelcius(Fahrenheit fahrenheit)
            {
                return fahrenheit.ToCelcius();
            }

            public double ToCelcius(double temp)
            {
                return (temp - 32) * 5 / 9;
            }
        }
    }
}
