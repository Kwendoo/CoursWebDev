using System.ComponentModel;
using Xamarin.Forms;
using Xamarin1.ViewModels;

namespace Xamarin1.Views
{
    public partial class ItemDetailPage : ContentPage
    {
        public ItemDetailPage()
        {
            InitializeComponent();
            BindingContext = new ItemDetailViewModel();
        }
    }
}