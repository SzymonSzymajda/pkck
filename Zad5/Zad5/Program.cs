﻿using System;
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
            Tools.AddNewTask(root);
            Tools.AddNewEmployee(root);
            Serialization.SerializeToFile("test.xml", root);
        }
    }
}
