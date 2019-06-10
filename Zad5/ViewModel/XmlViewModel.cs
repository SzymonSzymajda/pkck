using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zad5;

namespace ViewModel
{
    public class ZadanieVM : BaseElementVM
    {
        public Zadanie Zadanie { get; set; }
        public override void Expand(){}

        public ZadanieVM(Zadanie zadanie)
        {
            Zadanie = zadanie;
            Name = zadanie.Tytuł;
        }

        public override string ToString()
        {
            return Name;
        }
    }

    public class TablicaVM : BaseElementVM
    {
        public Tablica Tablica { get; set; }

        public override void Expand() {
            if(Tablica.Zadanie != null)
            {
                Add(Tablica.Zadanie, (z) => new ZadanieVM(z));
            }
        }

        public TablicaVM(Tablica tablica)
        {
            Tablica = tablica;
            Name = tablica.Status;
        }

        public override string ToString()
        {
            return Name;
        }
    }

    public class ZadaniaVM : BaseElementVM
    {
        public Zadania Zadania{ get; set; }
        public override void Expand()
        {
            if(Zadania.Tablica != null)
            {
                Add(Zadania.Tablica, (t) => new TablicaVM(t));
            }
        }

        public ZadaniaVM(Zadania zadania)
        {
            Zadania = zadania;
            Name = "Zadania";
        }

        public override string ToString()
        {
            return Name;
        }
    }

    public class TablicaZadanVM : BaseElementVM
    {
        public Tablica_zadań TablicaZadan{ get; set; }
        public override void Expand()
        {
            if(TablicaZadan?.Zadania != null)
            {
                Children.Add(new ZadaniaVM(TablicaZadan.Zadania));
                Children.Add(new UzytkownicyVM(TablicaZadan.Użytkownicy));
            }
        }

        public TablicaZadanVM(Tablica_zadań tablicaZadan) : this()
        {
            TablicaZadan = tablicaZadan;
        }

        public TablicaZadanVM()
        {
            Name = "Tablica zadan";
        }

        public override string ToString()
        {
            return Name;
        }
    }

    public class UzytkownicyVM : BaseElementVM
    {
        public Użytkownicy Użytkownicy { get; set; }
        public override void Expand()
        {
            Add(Użytkownicy.Użytkownik, (u) => new UzytkownikVM(u));
        }

        public UzytkownicyVM(Użytkownicy użytkownicy)
        {
            Użytkownicy = użytkownicy;
            Name = użytkownicy.Nazwa;
        }

        public override string ToString()
        {
            return Name;
        }
    }

    public class UzytkownikVM : BaseElementVM
    {
        private Użytkownik Uzytkownik;

        public UzytkownikVM(Użytkownik uzytkownik)
        {
            Uzytkownik = uzytkownik;
            Name = uzytkownik.Imię + " " + uzytkownik.Nazwisko;
        }

        public override void Expand()
        {
        }

        public override string ToString()
        {
            return Name;
        }
    }
}
