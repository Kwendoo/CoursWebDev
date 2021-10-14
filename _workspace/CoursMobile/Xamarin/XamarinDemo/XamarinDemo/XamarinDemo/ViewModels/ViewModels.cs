using System;
using System.Collections.Generic;
using System.Text;
using Xamarin.Forms;
using XamarinDemo.MVVMTools;

namespace XamarinDemo.ViewModels
{
    public class ProfilViewModels : ViewModelBase
    {
        private string _nom;

        public string Nom
        {
            get { return _nom; }
            set { SetValue(ref _nom, value); }
        }

        private string _email;

        public string Email
        {
            get { return _email; }
            set { SetValue(ref _email, value); }
        }

        private string _info;

        public string Info
        {
            get { return _info; }
            set { SetValue(ref _info, value); }
        }

        private string _tel;

        public string Tel
        {
            get { return _tel; }
            set { SetValue(ref _tel, value); }
        }

        private string _gsm;

        public string GSM
        {
            get { return _gsm; }
            set { SetValue(ref _gsm, value); }
        }


        public ProfilViewModels()
        {
            Nom = "Lagna Antoine";
            GSM = "0474/639060";
            Tel = "071/334013";
            Email = "antoine.lagna@gmail.com";
            Info = "Des infos supplémentaires";
        }

        private Command _changeValueCommand;

        public Command ChangeValueCommand
        {
            get { return _changeValueCommand = _changeValueCommand ?? new Command(ChangeValue); }
        }

        private void ChangeValue()
        {
            Nom = "Arthur Pendragon";
            Info = "Roi des bouseux";
        }

    }
}
