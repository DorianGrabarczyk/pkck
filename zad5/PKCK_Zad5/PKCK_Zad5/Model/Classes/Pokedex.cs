using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PKCK_Zad5.Model.Classes
{
    class Pokedex
    {
        public List<Trainer> Trainers { get; set; }
        public List<Pokemon> Pokemons { get; set; }

        public Pokedex()
        {
            Trainers = new List<Trainer>();
            Pokemons = new List<Pokemon>();
        }
    }
}
