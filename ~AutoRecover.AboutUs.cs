using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks; 
using System.Windows.Forms;
using System.Speech.Recognition;
Data Source = DESKTOP - BE11L2E\FARAZ;Initial Catalog = practise; Integrated Security = TrueData Source=DESKTOP-BE11L2E\FARAZ;Initial Catalog = practise; Integrated Security = TrueData Source=DESKTOP-BE11L2E\FARAZ;Initial Catalog = practise; Integrated Security = True
using System.Speech.Synthesis;
using System.IO;
using System;
namespace frameworks
{
    public partial class AboutUs : MetroFramework.Forms.MetroForm
    {        
        public AboutUs()
        {
            InitializeComponent();
        }

        private void AboutUs_Load(object sender, EventArgs e)
        {            
            string files = File.ReadAllText("C:/Users/Haroon Traders/Desktop/about.txt");            
            richTextBox1.Text = files;            
        }        
        }       
    }
