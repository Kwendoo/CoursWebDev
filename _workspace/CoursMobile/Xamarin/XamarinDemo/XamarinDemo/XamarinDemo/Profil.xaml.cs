using System;
using XamarinDemo.ViewModels;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;


namespace XamarinDemo
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Profil : ContentPage
    {
        public Profil()
        {

            BindingContext = new ProfilViewModels();
            InitializeComponent();
        }

        private void click(object sender, EventArgs e)
        {

        }
    }
}