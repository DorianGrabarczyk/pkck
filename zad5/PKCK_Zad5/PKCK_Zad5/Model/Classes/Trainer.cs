using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PKCK_Zad5.Model.Classes
{
    public class Trainer
    {
        public string Tname { get; set; }
        public string Surname { get; set; }
        public int Age { get; set; }
        public string Gender { get; set; }
        public string Region { get; set; }
        public string Hometown { get; set; }
        public string Class { get; set; }

        public Trainer(string _tname, string _surname, int _age, string _gender, string _region, string _hometown, string _class)
        {
            Tname = _tname;
            Surname = _surname;
            Age = _age;
            Gender = _gender;
            Region = _region;
            Hometown = _hometown;
            Class = _class;
        }

        public Trainer() { }

        public override string ToString()
        {
            return Tname + " " + Surname;
        }
    }
}
