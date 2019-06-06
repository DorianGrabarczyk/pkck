using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PKCK_Zad5.Model.Classes;
using PKCK_Zad5.Model;
using System.ComponentModel;
using System.Windows.Input;

namespace PKCK_Zad5.ViewModel
{
    class ViewModel : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;
        private readonly Model.Model model = new Model.Model();

        public List<Trainer> TrainerList { get; set; }
        public List<Pokemon> PokemonList { get; set; }

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

                TrainerName = TrainerList[selectedTrainer].Tname;
                TrainerSurname = TrainerList[selectedTrainer].Surname;
                TrainerAge = TrainerList[selectedTrainer].Age.ToString();
                TrainerGender = TrainerList[selectedTrainer].Gender;
                TrainerRegion = TrainerList[selectedTrainer].Region;
                TrainerHometown = TrainerList[selectedTrainer].Hometown;
                TrainerClass = TrainerList[selectedTrainer].Class;
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

                PokemonName = PokemonList[selectedPokemon].Name;
                PokemonType = PokemonList[selectedPokemon].Type;
                PokemonStats = PokemonList[selectedPokemon].Stats.ToString();
                PokemonEvolutions = PokemonList[selectedPokemon].EvolutionsToString();
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

        ICommand TrainerAddButton { get; }


        public ViewModel()
        {
            TrainerList = new List<Trainer>();
            PokemonList = new List<Pokemon>();

            TrainerAddButton = new RelayCommand(AddTrainer);
        }

        public void AddTrainer()
        {

        }

        protected void OnPropertyChanged(string name)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null)
            {
                handler(this, new PropertyChangedEventArgs(name));
            }
        }
    }
}
