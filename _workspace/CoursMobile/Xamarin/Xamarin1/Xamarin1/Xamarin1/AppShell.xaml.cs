using System;
using System.Collections.Generic;
using Xamarin.Forms;
using Xamarin1.ViewModels;
using Xamarin1.Views;

namespace Xamarin1
{
    public partial class AppShell : Xamarin.Forms.Shell
    {
        public AppShell()
        {
            InitializeComponent();
            Routing.RegisterRoute(nameof(ItemDetailPage), typeof(ItemDetailPage));
            Routing.RegisterRoute(nameof(NewItemPage), typeof(NewItemPage));
        }

    }
}
