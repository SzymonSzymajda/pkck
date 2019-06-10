using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zad5
{
    class Tools
    {
        public static void AddNewTask(Tablica_zadań root)
        {
            Console.WriteLine("Dodawanie zadania\nPodaj ID wykonawcy, tytuł, opis, priorytet");
            Console.WriteLine("Czy chcesz podać własne ID? Y/N");
            string podaj = Console.ReadLine();
            string id = "";
            int maxid = 0;
            if (podaj.Equals("Y") || podaj.Equals("y"))
            {
                id = Console.ReadLine();
                foreach (var t in root.Zadania.Tablica)
                {
                    foreach (var z in t.Zadanie)
                    {
                        if (z.Id.Equals(id))
                        {
                            Console.WriteLine("Nie ma takiego numeru");
                            return;
                        }                            
                    }
                }
            }
            else if(podaj.Equals("N") || podaj.Equals("n"))
            {
                foreach (var t in root.Zadania.Tablica)
                {
                    foreach (var z in t.Zadanie)
                    {
                        if (maxid < int.Parse(z.Id.Substring(3)))
                            maxid = int.Parse(z.Id.Substring(3));
                    }
                }
                ++maxid;
                id = "zad" + maxid;
            }
            else
            {
                Console.WriteLine("Nie ma takiego numeru");
                return;
            }
            
            Zadanie nowe = new Zadanie
            {
                Id = id,
                Wykonawca = Console.ReadLine(),
                Tytuł = Console.ReadLine(),
                Opis = Console.ReadLine(),
                Priorytet = Console.ReadLine()
            };
            foreach(var u in root.Użytkownicy.Użytkownik)
            {
                if (u.Id.Equals(nowe.Wykonawca))
                {
                    root.Zadania.Tablica.Where(x => x.Status.Equals("otwarte")).First().Zadanie.Add(nowe); 
                }
            }
            Console.WriteLine("Nie ma takiego numeru");
        }

        public static void AddNewEmployee(Tablica_zadań root)
        {
            Console.WriteLine("Dodawanie pracownika\nPodaj imię, nazwisko, dział, nr tel, email, pensje");
            Console.WriteLine("Czy chcesz podać własne ID? Y/N");
            string podaj = Console.ReadLine();
            string id = "";
            int maxid = 0;
            if (podaj.Equals("Y") || podaj.Equals("y"))
            {
                id = Console.ReadLine();
                foreach (var u in root.Użytkownicy.Użytkownik)
                {
                    if (u.Id.Equals(id))
                    {
                        Console.WriteLine("Nie ma takiego numeru");
                        return;
                    }
                }
            }
            else if(podaj.Equals("N") || podaj.Equals("n"))
            {
                foreach (var u in root.Użytkownicy.Użytkownik)
                {
                    if (maxid < int.Parse(u.Id.Substring(1)))
                    {
                        maxid = int.Parse(u.Id.Substring(1));
                    }
                }
                ++maxid;
                id = "U00" + maxid;
            }
            else
            {
                Console.WriteLine("Nie ma takiego numeru");
                return;
            }
            
            Użytkownik nowy = new Użytkownik
            {
                Id = id,
                Imię = Console.ReadLine(),
                Nazwisko = Console.ReadLine(),
                Dział = Console.ReadLine(),
                Nr_tel = Console.ReadLine(),
                Email = Console.ReadLine(),
                Pensja = Console.ReadLine()
            };
            root.Użytkownicy.Użytkownik.Add(nowy);
        }
    }
}
