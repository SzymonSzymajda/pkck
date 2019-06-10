using System.IO;
using System.Xml.Serialization;

namespace Zad5
{
    public static class Serialization
    {
        public static Tablica_zadań DeserializeFile(string filename)
        {
            XmlSerializer serializer = new XmlSerializer(typeof(Tablica_zadań));

            using (Stream reader = new FileStream(filename, FileMode.Open))
            {
                return (Tablica_zadań)serializer.Deserialize(reader);
            }
        }

        public static void SerializeToFile(string filename, Tablica_zadań root)
        {
            XmlSerializer serializer = new XmlSerializer(typeof(Tablica_zadań));
            TextWriter writer = new StreamWriter(filename);

            serializer.Serialize(writer, root);
            writer.Close();
        }
    }
}
