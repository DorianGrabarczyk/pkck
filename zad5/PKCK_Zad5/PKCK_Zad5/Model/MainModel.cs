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
using System.Xml.Xsl;
using System.Diagnostics;
using System.Xml.Schema;

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
                //using(XmlWriter writer = XmlWriter.Create(saveFileDialog.FileName, new XmlWriterSettings { Indent = true}))
                //{
                //    dataContractSerializer.WriteObject(writer, Data);
                //}

                using(TextWriter writer = new StreamWriter(saveFileDialog.FileName))
                {
                    XmlSerializer serializer = new XmlSerializer(typeof(Pokedex));
                    serializer.Serialize(writer, Data);
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
                using(TextReader reader = new StreamReader(openFileDialog.FileName))
                {
                    XmlSerializer deserializer = new XmlSerializer(typeof(Pokedex));

                    Pokedex obj = (Pokedex)deserializer.Deserialize(reader);
                    Data = obj;
                }
            }
        }

        public void TransformToXHTML()
        {
            XslCompiledTransform transform = new XslCompiledTransform();

            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.ShowDialog();

            var xsltString = File.ReadAllText(openFileDialog.FileName);

            OpenFileDialog openFileDialog2 = new OpenFileDialog();
            openFileDialog2.ShowDialog();

            var inputXml = File.ReadAllText(openFileDialog2.FileName);

            using (XmlReader reader = XmlReader.Create(new StringReader(xsltString)))
            {
                transform.Load(reader);
            }

            StringWriter results = new StringWriter();
            using(XmlReader reader = XmlReader.Create(new StringReader(inputXml)))
            {
                transform.Transform(reader, null, results);
            }

            SaveFileDialog saveFileDialog = new SaveFileDialog();
            saveFileDialog.ShowDialog();

            using (StreamWriter file = new StreamWriter(saveFileDialog.FileName))
            {
                file.Write(results.ToString());
            }
        }

        static void CheckValidity(string fileName)
        {
            try
            {
                XmlReaderSettings settings = new XmlReaderSettings();
                settings.Schemas.Add("zam", "../../../Data/schema.xsd");
                settings.ValidationType = ValidationType.Schema;

                using (XmlReader reader = XmlReader.Create(fileName, settings))
                {
                    XmlDocument document = new XmlDocument();
                    document.Load(reader);
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
                throw new Exception(ex.Message);
            }
        }
    }
}
