using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zad5
{
    class Tools
    {
        public static void AddNewTask(Tablica_zadań root, string wyk, string tyt, string opis, string prior, string id = "-1")
        {
            int maxid = 0;
            if(id.Equals("-1"))
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
                foreach (var t in root.Zadania.Tablica)
                {
                    foreach (var z in t.Zadanie)
                    {
                        if (z.Id.Equals(id))
                        {
                            return;
                        }
                    }
                }
            }
            
            Zadanie nowe = new Zadanie
            {
                Id = id,
                Wykonawca = wyk,
                Tytuł = tyt,
                Opis = opis,
                Priorytet = prior
            };
            foreach(var u in root.Użytkownicy.Użytkownik)
            {
                if (u.Id.Equals(nowe.Wykonawca))
                {
                    root.Zadania.Tablica.Where(x => x.Status.Equals("otwarte")).First().Zadanie.Add(nowe); 
                }
            }
        }

        public static void AddNewEmployee(Tablica_zadań root, string imie, string nazwisko, string dzial, string nrtel, string email, string pensja, string id = "-1")
        {
            int maxid = 0;
            if(id.Equals("-1"))
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
                foreach (var u in root.Użytkownicy.Użytkownik)
                {
                    if (u.Id.Equals(id))
                    {
                        return;
                    }
                }
            }
            
            Użytkownik nowy = new Użytkownik
            {
                Id = id,
                Imię = imie,
                Nazwisko = nazwisko,
                Dział = dzial,
                Nr_tel = nrtel,
                Email = email,
                Pensja = pensja
            };
            root.Użytkownicy.Użytkownik.Add(nowy);
        }
    }
}
