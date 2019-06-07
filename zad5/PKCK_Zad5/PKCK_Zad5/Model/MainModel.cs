using PKCK_Zad5.Model.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PKCK_Zad5.Model
{
    class MainModel
    {
        public Pokedex Data { get; set; }

        public MainModel()
        {
            Data = new Pokedex();
        }
    }
}
