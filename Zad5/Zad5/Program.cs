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
            Tools.AddNewTask(root, "U001", "aa", "aa", "1");
            Tools.AddNewTask(root, "U001", "bb", "bb", "1", "zad18");
            Tools.AddNewTask(root, "asd", "cc", "cc", "1");
            Serialization.SerializeToFile("test.xml", root);
        }
    }
}
