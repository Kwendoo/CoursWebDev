using System;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using XamarinDemo.Services;

namespace XamarinDemo
{
    public partial class App : Application
    {
        public App()
        {
            DependencyService.RegisterSingleton<ContactService>(new ContactService());

            InitializeComponent();

            MainPage = new TabbedPage1();
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
