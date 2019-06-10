using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Zad5;

namespace ViewModel
{
    public class MainViewModel : BaseViewModel
    {
        public TablicaZadanVM TablicaVM { get; set; }

        DialogFileSupplier fileSupplier;

        public ICommand AddTaskCommand { get; }
        public ICommand AddUserCommand { get; }

        public ICommand LoadCommand { get; }
        public ICommand SaveCommand { get; }
        public ObservableCollection<BaseElementVM> Tree { get; set; }

        public event EventHandler AddTaskViewShowed;
        public event EventHandler AddEmpViewShowed;

        public MainViewModel()
        {
            Tree = new ObservableCollection<BaseElementVM>();
            TablicaVM = new TablicaZadanVM();
            fileSupplier = new DialogFileSupplier();
            AddTaskCommand = new RelayCommand(AddTask);
            AddUserCommand = new RelayCommand(AddUser);
            LoadCommand = new RelayCommand(Load);
            SaveCommand = new RelayCommand(Save);
            TreeViewLoaded();
        }

        private void AddUser()
        {
            AddEmpViewShowed?.Invoke(this, EventArgs.Empty);
        }

        private void Save()
        {
            var path = fileSupplier.GetFilePathToSave("XML file(.xml) | *.xml");
            Serialization.SerializeToFile(path, TablicaVM.TablicaZadan);
        }

        private void Load()
        {
            var path = fileSupplier.GetFilePathToLoad("XML file(.xml) | *.xml");
            var xml = Serialization.DeserializeFile(path);
            TablicaVM = new TablicaZadanVM(xml);
            TreeViewLoaded();
        }

        private void AddTask()
        {
            AddTaskViewShowed?.Invoke(this, EventArgs.Empty);
        }

        private void TreeViewLoaded()
        {
            if(Tree.Count == 1)
            {
                Tree.RemoveAt(0);
            }
            Tree.Add(TablicaVM);
        }


    }
}
