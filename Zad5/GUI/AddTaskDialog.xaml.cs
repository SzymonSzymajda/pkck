using System.Windows;
using ViewModel;

namespace GUI
{
    /// <summary>
    /// Logika interakcji dla klasy AddTaskDialog.xaml
    /// </summary>
    public partial class AddTaskDialog : Window
    {
        public AddTaskDialog(DialogViewModel viewModel)
        {
            InitializeComponent();
            DataContext = viewModel;
        }
    }
}
