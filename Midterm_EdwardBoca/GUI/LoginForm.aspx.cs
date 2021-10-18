using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Midterm_EdwardBoca.DAL;
//using Midterm_EdwardBoca.BLL;
using System.Windows;

namespace Midterm_EdwardBoca.GUI
{
    public partial class LoginForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin(object sender, EventArgs e)
        {
            SqlConnection connDB = UtilityDB.ConnectDB();

            SqlCommand cmd = new SqlCommand("select * from Users where UserName='" + txtUserId.Text + "' AND Password = '" + txtPassword.Text + "'", connDB);

            SqlDataReader dr = cmd.ExecuteReader();

            if ((dr.Read() == true))
            {
                dr.Close();
                SqlCommand cmd1 = new SqlCommand("select * from Employees where EmployeeId='" + txtUserId.Text + "' AND JobTitle = '" + "Coordinator" + "'", connDB);
                
                
                SqlDataReader dr1 = cmd1.ExecuteReader();
                if ((dr1.Read() == true))
                {
                    
                    Response.Redirect("CoordinatorForm.aspx");
                    
                }
                else
                {
                    
                    MessageBox.Show("Wrong username or password");
                }
                //ProjectAssignemt proAs = new ProjectAssignemt();
                //proAs.StudentNumber = Convert.ToInt32(txtUserId.Text);
                //SqlCommand cmd1 = new SqlCommand("select StudentNumber from Students where StudentNumber='" + txtUserId.Text + "'", connDB);
                //SqlDataReader dr1 = cmd1.ExecuteReader();

                // proAs.StudentNumber = Convert.ToInt32(dr1);

                // txtPassword.Text = Convert.ToString(proAs.StudentNumber);

                // txtPassword.Text = "fgouhwfouwhfq";


                // Session["UserName"] = proAs.StudentNumber;
                

                //StudentFormProjects open = new StudentFormProjects();
                //open.Show();
            }
        }
    }
}