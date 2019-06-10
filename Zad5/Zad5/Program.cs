using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zad5
{
    class Program
    {
        static void Main(string[] args)
        {
            Tablica_zadań root = Serialization.DeserializeFile("zad1.xml");
            Tools.AddNewEmployee(root, "jan", "pacaj", "aa", "11", "aa", "0");
            Tools.AddNewEmployee(root, "maciej", "tkacz", "aa", "11", "aa", "0", "U001");
            Serialization.SerializeToFile("test.xml", root);
        }
    }
}
