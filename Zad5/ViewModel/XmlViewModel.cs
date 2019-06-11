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
        public override void Expand()
        {
            Children.Add(new ElementVM("ID", Zadanie.Id));
            Children.Add(new ElementVM("Opis", Zadanie.Opis));
            Children.Add(new ElementVM("Priorytet", Zadanie.Priorytet));
            Children.Add(new ElementVM("ID wykonawcy", Zadanie.Wykonawca));
            Children.Add(new ElementVM("Opis", Zadanie.Opis));
            if (Zadanie.Data_rozpoczęcia != null)
            {
                Children.Add(new ElementVM("Data rozpoczęcia", Zadanie.Data_rozpoczęcia.Data));
            }
            if (Zadanie.Data_ukończenia != null)
            {
                Children.Add(new ElementVM("Data ukończenia", Zadanie.Data_ukończenia.Data));
            }
        }

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

    public class ElementVM : BaseElementVM
    {

        public override void Expand()
        {
        }

        public ElementVM(string name, string value)
        {
            IsExpanded = true;
            RaisePropertyChanged(nameof(IsExpanded));
            Name = name + ": " + value;
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

        internal void Rebuild()
        {
            Children.Clear();
            Expand();
            IsExpanded = true;
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
            Children.Add(new ElementVM("ID", Uzytkownik.Id));
            Children.Add(new ElementVM("Dział", Uzytkownik.Dział));
            if (Uzytkownik.Email != null)
            {
                Children.Add(new ElementVM("Email", Uzytkownik.Email));
            }
            if (Uzytkownik.Nr_tel != null)
            {
                Children.Add(new ElementVM("Nr tel", Uzytkownik.Nr_tel));
            }
            if (Uzytkownik.Pensja != null)
            {
                Children.Add(new ElementVM("Pensja", Uzytkownik.Pensja));
            }
        }

        public override string ToString()
        {
            return Name;
        }
    }
}
