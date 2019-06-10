/* 
 Licensed under the Apache License, Version 2.0

 http://www.apache.org/licenses/LICENSE-2.0
 */
using System;
using System.Xml.Serialization;
using System.Collections.Generic;
namespace Zad5
{
    [XmlRoot(ElementName = "zadanie")]
    public class Zadanie
    {
        [XmlElement(ElementName = "tytuł")]
        public string Tytuł { get; set; }
        [XmlElement(ElementName = "opis")]
        public string Opis { get; set; }
        [XmlElement(ElementName = "priorytet")]
        public string Priorytet { get; set; }
        [XmlAttribute(AttributeName = "id")]
        public string Id { get; set; }
        [XmlAttribute(AttributeName = "wykonawca")]
        public string Wykonawca { get; set; }
        [XmlElement(ElementName = "data_rozpoczęcia")]
        public Data_rozpoczęcia Data_rozpoczęcia { get; set; }
        [XmlElement(ElementName = "data_ukończenia")]
        public Data_ukończenia Data_ukończenia { get; set; }
    }

    [XmlRoot(ElementName = "tablica")]
    public class Tablica
    {
        [XmlElement(ElementName = "zadanie")]
        public List<Zadanie> Zadanie { get; set; }
        [XmlAttribute(AttributeName = "status")]
        public string Status { get; set; }
    }

    [XmlRoot(ElementName = "data_rozpoczęcia")]
    public class Data_rozpoczęcia
    {
        [XmlElement(ElementName = "data")]
        public string Data { get; set; }
    }

    [XmlRoot(ElementName = "data_ukończenia")]
    public class Data_ukończenia
    {
        [XmlElement(ElementName = "data")]
        public string Data { get; set; }
    }

    [XmlRoot(ElementName = "zadania")]
    public class Zadania
    {
        [XmlElement(ElementName = "tablica")]
        public List<Tablica> Tablica { get; set; }
    }

    [XmlRoot(ElementName = "użytkownik")]
    public class Użytkownik
    {
        [XmlElement(ElementName = "imię")]
        public string Imię { get; set; }
        [XmlElement(ElementName = "nazwisko")]
        public string Nazwisko { get; set; }
        [XmlElement(ElementName = "dział")]
        public string Dział { get; set; }
        [XmlElement(ElementName = "email")]
        public string Email { get; set; }
        [XmlAttribute(AttributeName = "id")]
        public string Id { get; set; }
        [XmlElement(ElementName = "nr_tel")]
        public string Nr_tel { get; set; }
        [XmlElement(ElementName = "pensja")]
        public string Pensja { get; set; }
    }

    [XmlRoot(ElementName = "użytkownicy")]
    public class Użytkownicy
    {
        [XmlElement(ElementName = "użytkownik")]
        public List<Użytkownik> Użytkownik { get; set; }
        [XmlAttribute(AttributeName = "nazwa")]
        public string Nazwa { get; set; }
    }

    [XmlRoot(ElementName = "ostatnia_modyfikacja")]
    public class Ostatnia_modyfikacja
    {
        [XmlElement(ElementName = "data")]
        public string Data { get; set; }
        [XmlAttribute(AttributeName = "autor")]
        public string Autor { get; set; }
    }

    [XmlRoot(ElementName = "autor")]
    public class Autor
    {
        [XmlElement(ElementName = "nr_indeksu")]
        public string Nr_indeksu { get; set; }
        [XmlElement(ElementName = "imię")]
        public string Imię { get; set; }
        [XmlElement(ElementName = "nazwisko")]
        public string Nazwisko { get; set; }
        [XmlAttribute(AttributeName = "id")]
        public string Id { get; set; }
    }

    [XmlRoot(ElementName = "autorzy")]
    public class Autorzy
    {
        [XmlElement(ElementName = "autor")]
        public List<Autor> Autor { get; set; }
    }

    [XmlRoot(ElementName = "stopka")]
    public class Stopka
    {
        [XmlElement(ElementName = "ostatnia_modyfikacja")]
        public Ostatnia_modyfikacja Ostatnia_modyfikacja { get; set; }
        [XmlElement(ElementName = "autorzy")]
        public Autorzy Autorzy { get; set; }
    }

    [XmlRoot(ElementName = "tablica_zadań")]
    public class Tablica_zadań
    {
        [XmlElement(ElementName = "zadania")]
        public Zadania Zadania { get; set; }
        [XmlElement(ElementName = "użytkownicy")]
        public Użytkownicy Użytkownicy { get; set; }
        [XmlElement(ElementName = "stopka")]
        public Stopka Stopka { get; set; }
    }

}
