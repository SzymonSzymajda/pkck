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
        TablicaZadanVM TablicaVM { get; set; }

        DialogFileSupplier fileSupplier;

        public ICommand AddElementCommand { get; }
        public ICommand LoadCommand { get; }
        public ICommand SaveCommand { get; }
        public ObservableCollection<BaseElementVM> Tree { get; set; }

        public MainViewModel()
        {
            Tree = new ObservableCollection<BaseElementVM>();
            TablicaVM = new TablicaZadanVM();
            fileSupplier = new DialogFileSupplier();
            AddElementCommand = new RelayCommand(AddElement);
            LoadCommand = new RelayCommand(Load);
            SaveCommand = new RelayCommand(Save);
            TreeViewLoaded();
        }

        private void Save()
        {
            var path = fileSupplier.GetFilePathToLoad();
            Serialization.SerializeToFile(path, TablicaVM.TablicaZadan);
        }

        private void Load()
        {
            var path = fileSupplier.GetFilePathToLoad();
            var xml = Serialization.DeserializeFile(path);
            TablicaVM = new TablicaZadanVM(xml);
            TreeViewLoaded();
        }

        private void AddElement()
        {
            throw new NotImplementedException();
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
