using PKCK_Zad5.Model.Classes;
using PKCK_Zad5.ViewModel;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Windows;

namespace PKCK_Zad5
{
    /// <summary>
    /// Logika interakcji dla klasy AddTrainerWindow.xaml
    /// </summary>
    public partial class AddTrainerWindow : Window
    {
        public AddTrainerWindow(ObservableCollection<Trainer> trainers)
        {
            InitializeComponent();
            AddTrainerViewModel vm = new AddTrainerViewModel(trainers);
            DataContext = vm;
            vm.CloseAction = new System.Action(this.Close);
        }
    }
}
