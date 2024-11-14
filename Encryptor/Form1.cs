using Language.Discovery.Repository;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Encryptor
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            using (Entities context = new Entities())
            {
                var query = (from u in context.Users
                             select u).ToList();
                progressBar1.Maximum = query.Count();
                progressBar1.Step = 1;
                foreach(var item in query)
                {
                    progressBar1.PerformStep();
                    Console.WriteLine(item.UserName);
                    if (!String.IsNullOrEmpty(item.Password))
                    {
                        string password = new Security().Encrypt(item.Password, "{50D1C6FC-EEB9-4168-B3A8-0D625663259E}");
                        item.Password = password;

                    }
                    Application.DoEvents();
                }
                context.SaveChanges();
                MessageBox.Show("Finish");
            }
        }
    }
}
