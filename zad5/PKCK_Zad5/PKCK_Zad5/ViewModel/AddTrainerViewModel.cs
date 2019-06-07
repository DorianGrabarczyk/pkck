using PKCK_Zad5.Model.Classes;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Windows;
using System.Windows.Input;

namespace PKCK_Zad5.ViewModel
{
    class AddTrainerViewModel : INotifyPropertyChanged
    {
        public ObservableCollection<Trainer> Trainers { get; set; }

        public event PropertyChangedEventHandler PropertyChanged;

        public string TrainerName { get; set; }
        public string TrainerSurname { get; set; }
        public string TrainerAge { get; set; }
        public string TrainerGender { get; set; }
        public string TrainerRegion { get; set; }
        public string TrainerHometown { get; set; }
        public string TrainerClass { get; set; }

        public Action CloseAction { get; set; }
        public ICommand TrainerAddButton { get; }

        public AddTrainerViewModel(ObservableCollection<Trainer> _trainers)
        {
            Trainers = _trainers;
            TrainerAddButton = new RelayCommand(AddTrainer);
        }

        public void AddTrainer()
        {
            try
            {
                Trainers.Add(new Trainer(TrainerName, TrainerSurname, System.Int32.Parse(TrainerAge), TrainerGender, TrainerRegion, TrainerHometown, TrainerClass));
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString());
            }
            this.CloseAction();
        }

        protected void OnPropertyChanged(string name)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
        }
    }
}
