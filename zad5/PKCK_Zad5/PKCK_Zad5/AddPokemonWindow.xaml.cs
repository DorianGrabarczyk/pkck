using PKCK_Zad5.Model.Classes;
using PKCK_Zad5.ViewModel;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace PKCK_Zad5
{
    /// <summary>
    /// Logika interakcji dla klasy AddPokemonWindow.xaml
    /// </summary>
    public partial class AddPokemonWindow : Window
    {
        public AddPokemonWindow(ObservableCollection<Pokemon> _pokemons)
        {
            InitializeComponent();
            AddPokemonViewModel vm = new AddPokemonViewModel(_pokemons);
            DataContext = vm;
            vm.CloseWindow = new System.Action(this.Close);
        }
    }
}
