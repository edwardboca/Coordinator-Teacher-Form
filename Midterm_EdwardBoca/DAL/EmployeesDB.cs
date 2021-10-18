using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using Midterm_EdwardBoca.BLL;

namespace Midterm_EdwardBoca.DAL
{
    public class EmployeesDB
    {





        public static List<Employees> listAllEmployees()
        {


            List<Employees> empList = new List<Employees>();
            SqlConnection con = UtilityDB.ConnectDB();

            try
            {
                SqlCommand cmdListRecord = new SqlCommand("select * from Employees WHERE JobTitle='Teacher'", con);

                //SqlCommand cmd = new SqlCommand("select * from Students where StudentNumber='" + txtUserId.Text + "' AND Password = '" + txtPassword.Text + "'", connDB);
                SqlDataReader sqlreadRecord = cmdListRecord.ExecuteReader();

                Employees emp;

                while (sqlreadRecord.Read())
                {
                    emp = new Employees();
                    emp.Employeeid = Convert.ToInt32(sqlreadRecord["EmployeeId"]);
                    emp.FirstName = sqlreadRecord["FirstName"].ToString();
                    emp.LastName = sqlreadRecord["LastName"].ToString();
                    emp.Email = sqlreadRecord["Email"].ToString();
                    emp.JobTitle = sqlreadRecord["JobTitle"].ToString();
                    empList.Add(emp);

                   
    }


            }
            catch (SqlException ex)
            {

                throw ex;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }


            return empList;

        }

    }
}
