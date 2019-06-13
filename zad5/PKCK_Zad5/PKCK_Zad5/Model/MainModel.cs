using Microsoft.Win32;
using PKCK_Zad5.Model.Classes;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;
using System.Runtime.Serialization;
using System.Xml;

namespace PKCK_Zad5.Model
{
    class MainModel
    {
        public Pokedex Data { get; set; }

        private readonly DataContractSerializer dataContractSerializer = new DataContractSerializer(typeof(Pokedex), new DataContractSerializerSettings { PreserveObjectReferences = true });

        public MainModel()
        {
            Data = new Pokedex();
        }

        public void Serialize()
        {
            SaveFileDialog saveFileDialog = new SaveFileDialog
            {
                Filter = "xml files |*.xml"
            };

            saveFileDialog.ShowDialog();

            if (saveFileDialog.FileName != null && saveFileDialog.FileName != "")
            {
                using(XmlWriter writer = XmlWriter.Create(saveFileDialog.FileName, new XmlWriterSettings { Indent = true}))
                {
                    dataContractSerializer.WriteObject(writer, Data);
                }
            }
        }

        public void Deserialize()
        {
            OpenFileDialog openFileDialog = new OpenFileDialog
            {
                Filter = "xml files |*.xml"
            };

            openFileDialog.ShowDialog();

            if (openFileDialog.FileName != null && openFileDialog.FileName != "")
            {
                using(XmlDictionaryReader reader = XmlDictionaryReader.CreateTextReader(new FileStream(openFileDialog.FileName, FileMode.Open), new XmlDictionaryReaderQuotas()))
                {
                    Data = (Pokedex)dataContractSerializer.ReadObject(reader);
                }
            }
        }
    }
}
