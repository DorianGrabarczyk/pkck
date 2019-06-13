using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PKCK_Zad5.Model.Classes;
using PKCK_Zad5.Model;
using System.ComponentModel;
using System.Windows.Input;
using System.Collections.ObjectModel;

namespace PKCK_Zad5.ViewModel
{
    class MainViewModel : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        public MainModel Model { get; set; }

        public ObservableCollection<Trainer> TrainerList { get; set; }
        public ObservableCollection<Pokemon> PokemonList { get; set; }

        private int selectedTrainer;
        private string trainerName;
        private string trainerSurname;
        private string trainerAge;
        private string trainerGender;
        private string trainerRegion;
        private string trainerHometown;
        private string trainerClass;

        private int selectedPokemon;
        private string pokemonName;
        private string pokemonType;
        private string pokemonStats;
        private string pokemonEvolutions;


        public int SelectedTrainer
        {
            get
            {
                return selectedTrainer;
            }
            set
            {
                selectedTrainer = value;

                if(selectedTrainer >= 0 && selectedTrainer < TrainerList.Count)
                {
                    TrainerName = TrainerList[selectedTrainer].Tname;
                    TrainerSurname = TrainerList[selectedTrainer].Surname;
                    TrainerAge = TrainerList[selectedTrainer].Age.ToString();
                    TrainerGender = TrainerList[selectedTrainer].Gender;
                    TrainerRegion = TrainerList[selectedTrainer].Region;
                    TrainerHometown = TrainerList[selectedTrainer].Hometown;
                    TrainerClass = TrainerList[selectedTrainer].Class;
                }
            }
        }
        public string TrainerName
        {
            get
            {
                return trainerName;
            }
            set
            {
                trainerName = value;
                OnPropertyChanged("TrainerName");
            }
        }
        public string TrainerSurname
        {
            get
            {
                return trainerSurname;
            }
            set
            {
                trainerSurname = value;
                OnPropertyChanged("TrainerSurname");
            }
        }
        public string TrainerAge
        {
            get
            {
                return trainerAge;
            }
            set
            {
                trainerAge = value;
                OnPropertyChanged("TrainerAge");
            }
        }
        public string TrainerGender
        {
            get
            {
                return trainerGender;
            }
            set
            {
                trainerGender = value;
                OnPropertyChanged("TrainerGender");
            }
        }
        public string TrainerRegion
        {
            get
            {
                return trainerRegion;
            }
            set
            {
                trainerRegion = value;
                OnPropertyChanged("TrainerRegion");
            }
        }
        public string TrainerHometown
        {
            get
            {
                return trainerHometown;
            }
            set
            {
                trainerHometown = value;
                OnPropertyChanged("TrainerHometown");
            }
        }
        public string TrainerClass
        {
            get
            {
                return trainerClass;
            }
            set
            {
                trainerClass = value;
                OnPropertyChanged("TrainerClass");
            }
        }

        public int SelectedPokemon
        {
            get
            {
                return selectedPokemon;
            }
            set
            {
                selectedPokemon = value;

                if (selectedPokemon >= 0 && selectedPokemon < PokemonList.Count)
                {
                    PokemonName = PokemonList[selectedPokemon].Name;
                    PokemonType = PokemonList[selectedPokemon].Type;
                    PokemonStats = PokemonList[selectedPokemon].Stats.ToString();
                    PokemonEvolutions = PokemonList[selectedPokemon].EvolutionsToString();
                }
            }
        }
        public string PokemonName
        {
            get
            {
                return pokemonName;
            }
            set
            {
                pokemonName = value;
                OnPropertyChanged("PokemonName");
            }
        }
        public string PokemonType
        {
            get
            {
                return pokemonType;
            }
            set
            {
                pokemonType = value;
                OnPropertyChanged("PokemonType");
            }
        }
        public string PokemonStats
        {
            get
            {
                return pokemonStats;
            }
            set
            {
                pokemonStats = value;
                OnPropertyChanged("PokemonStats");
            }
        }
        public string PokemonEvolutions
        {
            get
            {
                return pokemonEvolutions;
            }
            set
            {
                pokemonEvolutions = value;
                OnPropertyChanged("PokemonEvolutions");
            }
        }

        public ICommand TrainerAddButton { get; }
        public ICommand PokemonAddButton { get; }
        public ICommand TrainerDeleteButton { get; }
        public ICommand PokemonDeleteButton { get; }
        public ICommand PokedexSerializeButton { get; }
        public ICommand PokedexDeserializeButton { get; }

        public MainViewModel()
        {
            Model = new MainModel();

            this.Bind();

            TrainerAddButton = new RelayCommand(AddTrainer);
            PokemonAddButton = new RelayCommand(AddPokemon);
            TrainerDeleteButton = new RelayCommand(DeleteTrainer);
            PokemonDeleteButton = new RelayCommand(DeletePokemon);
            PokedexSerializeButton = new RelayCommand(SerializePokedex);
            PokedexDeserializeButton = new RelayCommand(DeserializePokedex);
        }

        private void Bind()
        {
            PokemonList = Model.Data.Pokemons;
            TrainerList = Model.Data.Trainers;

            if (PokemonList.Count >= 1) SelectedPokemon = 0;
            if (TrainerList.Count >= 1) SelectedTrainer = 0;

            OnPropertyChanged("TrainerList");
            OnPropertyChanged("PokemonList");
        }

        public void AddTrainer()
        {
            AddTrainerWindow addTrainerWindow = new AddTrainerWindow(TrainerList);
            addTrainerWindow.ShowDialog();
            OnPropertyChanged("TrainerList");
            if(TrainerList.Count >= 1)
            {
                SelectedTrainer = TrainerList.Count-1;
            } 
        }

        public void AddPokemon()
        {
            AddPokemonWindow addPokemonWindow = new AddPokemonWindow(PokemonList);
            addPokemonWindow.ShowDialog();
            OnPropertyChanged("TrainerList");
            if (PokemonList.Count >= 1)
            {
                SelectedPokemon = PokemonList.Count-1;
            }
        }

        public void DeleteTrainer()
        {
            if (selectedTrainer >= 0 && selectedTrainer < TrainerList.Count)
            {
                TrainerList.RemoveAt(selectedTrainer);
                OnPropertyChanged("TrainerList");
            }
        }

        public void DeletePokemon()
        {
            if(selectedPokemon >= 0 && selectedPokemon < PokemonList.Count)
            {
                PokemonList.RemoveAt(selectedPokemon);
                OnPropertyChanged("PokemonList");
            }
        }

        public void SerializePokedex()
        {
            Model.Serialize();
        }

        public void DeserializePokedex()
        {
            Model.Deserialize();
            this.Bind();
        }

        protected void OnPropertyChanged(string name)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
        }
    }
}
