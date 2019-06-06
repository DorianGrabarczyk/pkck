using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PKCK_Zad5.Model.Classes
{
    class Pokemon
    {
        public string Name { get; set; }
        public string Type { get; set; }
        public Statistics Stats { get; set; }
        public List<Pokemon> Evolutions { get; set; }

        public Pokemon(string _name, string _type, Statistics _stats, List<Pokemon> _evolutions = null)
        {
            if(_evolutions == null)
            {
                Evolutions = new List<Pokemon>();
            }
            else
            {
                Evolutions = _evolutions;
            }

            Name = _name;
            Type = _type;
            Stats = _stats;
        }

        public override string ToString()
        {
            return Name;
        }

        public string EvolutionsToString()
        {
            if (Evolutions.Count == 0)
            {
                return "BRAK EWOLUCJI";
            }
            else
            {
                StringBuilder sb = new StringBuilder();

                for(int i = 0; i < Evolutions.Count; i++)
                {
                    if(i > 0)
                    {
                        sb.Append(", ");
                    }
                    sb.Append(" " + Evolutions[i].ToString());
                }
                return sb.ToString();
            }
        }
    }
}
