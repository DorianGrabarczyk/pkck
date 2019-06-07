using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PKCK_Zad5.Model.Classes
{
    public class Statistics
    {
        public int HP { get; set; }
        public int ATK { get; set; }
        public int DEF { get; set; }

        public Statistics(int _hp, int _atk, int _def)
        {
            HP = _hp;
            ATK = _atk;
            DEF = _def;
        }

        public override string ToString()
        {
            return "HP: " + HP + ", ATK: " + ATK + ", DEF: " + DEF;
        }
    }
}
