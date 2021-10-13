using System;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Xamarin1.Services;
using Xamarin1.Views;

namespace Xamarin1
{
    public partial class App : Application
    {

        public App()
        {
            InitializeComponent();

            DependencyService.Register<MockDataStore>();
            MainPage = new AppShell();
        }

        protected override void OnStart()
        {
        }

        protected override void OnSleep()
        {
        }

        protected override void OnResume()
        {
        }
    }
}
