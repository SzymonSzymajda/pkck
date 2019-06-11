using System.Windows;
using ViewModel;

namespace GUI
{
    public partial class MainWindow : Window
    {

        public MainWindow()
        {
            InitializeComponent();
            var viewModel = new MainViewModel();
            viewModel.AddTaskViewShowed += (s, e) => new AddTaskDialog(new DialogViewModel(viewModel.TablicaVM, viewModel.UpdateTreeCommand)).Show();
            viewModel.AddEmpViewShowed += (s, e) => new AddEmployeeDialog(new DialogViewModel(viewModel.TablicaVM, viewModel.UpdateTreeCommand)).Show();
            DataContext = viewModel;

        }
    }
}
