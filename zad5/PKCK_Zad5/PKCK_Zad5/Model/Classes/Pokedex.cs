using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PKCK_Zad5.Model.Classes
{
    class Pokedex
    {
        public ObservableCollection<Trainer> Trainers { get; set; }
        public ObservableCollection<Pokemon> Pokemons { get; set; }

        public Pokedex()
        {
            Trainers = new ObservableCollection<Trainer>();
            Pokemons = new ObservableCollection<Pokemon>();
        }
    }
}
