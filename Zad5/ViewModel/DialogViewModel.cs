using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Zad5;

namespace ViewModel
{
    public class DialogViewModel : BaseViewModel
    {
        private Tablica_zadań root;

        public string TaskEmployee { get; set; }
        public string TaskName { get; set; }
        public string TaskDesc { get; set; }
        public string TaskPriority { get; set; }
        public string TaskId { get; set; }
        public ICommand AddTaskCommand { get; }


        public string EmpName { get; set; }
        public string EmpSurname { get; set; }
        public string EmpDepartment { get; set; }
        public string EmpPhone { get; set; }
        public string EmpEmail { get; set; }
        public string EmpSalary { get; set; }
        public string EmpId { get; set; }
        public ICommand AddEmployeeCommand { get; }

        public string Message { get; set; }

        public DialogViewModel(TablicaZadanVM rootModel)
        {
            root = rootModel.TablicaZadan;
            TaskId = "auto";
            EmpId = "auto";
            AddTaskCommand = new RelayCommand(AddTask);
            AddEmployeeCommand = new RelayCommand(AddEmployee);
        }

        public void AddTask()
        {
            try
            {
                Tools.AddNewTask(root, TaskEmployee, TaskName, TaskDesc, TaskPriority, TaskId);
                Message = "Task added";
            }
            catch(IdNotFoundException e)
            {
                Message = e.Message;
            }
            RaisePropertyChanged(nameof(Message));
        }

        public void AddEmployee()
        {
            Tools.AddNewEmployee(root, EmpName, EmpSurname, EmpDepartment, EmpPhone, EmpEmail, EmpSalary, EmpId);
            Message = "User added";
            RaisePropertyChanged(nameof(Message));
        }
    }
}
