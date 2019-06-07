using PKCK_Zad5.Model.Classes;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace PKCK_Zad5.ViewModel
{
    class AddPokemonViewModel : INotifyPropertyChanged
    {
        public ObservableCollection<Pokemon> PokemonList { get; set; }
        public ObservableCollection<Pokemon> PokemonEvolutionList { get; set; }

        public event PropertyChangedEventHandler PropertyChanged;

        public string PokemonName { get; set; }
        public string PokemonType { get; set; }
        public string PokemonHP { get; set; }
        public string PokemonATK { get; set; }
        public string PokemonDEF { get; set; }
        public int SelectedPokemon { get; set; }
        public int SelectedEvolution { get; set; }

        public Action CloseWindow { get; set; } 
        public ICommand PokemonAddEvolutionButton { get; }
        public ICommand PokemonDeleteEvolutionButton { get; }
        public ICommand PokemonAddButton { get; }

        public AddPokemonViewModel(ObservableCollection<Pokemon> _pokemons)
        {
            PokemonList = _pokemons;
            PokemonEvolutionList = new ObservableCollection<Pokemon>();

            PokemonAddEvolutionButton = new RelayCommand(AddEvolution);
            PokemonDeleteEvolutionButton = new RelayCommand(DeleteEvolution);
            PokemonAddButton = new RelayCommand(AddPokemon);
        }

        public void AddEvolution()
        {
            try
            {
                if (SelectedPokemon < 0 || SelectedPokemon > PokemonList.Count - 1) throw new Exception("Nie wybrano żadnej ewolucji.");
                else
                {
                    PokemonEvolutionList.Add(PokemonList[SelectedPokemon]);
                    OnPropertyChanged("PokemonEvolutionList");
                }
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString());
            }
        }

        public void DeleteEvolution()
        {
            try
            {
                if (SelectedEvolution < 0 || SelectedEvolution > PokemonEvolutionList.Count - 1) throw new Exception("Index wybranej ewolucji jest poza zakresem.");
                else
                {
                    PokemonEvolutionList.RemoveAt(SelectedEvolution);
                    OnPropertyChanged("PokemonEvolutionList");
                }
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString());
            }
        }

        public void AddPokemon()
        {
            try
            {
                PokemonList.Add(new Pokemon(PokemonName, PokemonType,
                    new Statistics(Int32.Parse(PokemonHP), Int32.Parse(PokemonATK), Int32.Parse(PokemonDEF)),
                    PokemonEvolutionList));
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString());
            }
            this.CloseWindow();
        }

        protected void OnPropertyChanged(string name)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
        }
    }
}
