using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Midterm_EdwardBoca.BLL;

namespace Midterm_EdwardBoca.DAL
{
    public class GroupsDB
    {



        public static List<Groups> listAllGroups()
        {


            List<Groups> groupList = new List<Groups>();
            SqlConnection con = UtilityDB.ConnectDB();

            try
            {
                SqlCommand cmdListRecord = new SqlCommand("select * from Groups", con);

                //SqlCommand cmd = new SqlCommand("select * from Students where StudentNumber='" + txtUserId.Text + "' AND Password = '" + txtPassword.Text + "'", connDB);
                SqlDataReader sqlreadRecord = cmdListRecord.ExecuteReader();

                Groups group;

                while (sqlreadRecord.Read())
                {
                    group = new Groups();
                    group.GroupNumber = Convert.ToInt32(sqlreadRecord["GroupNumber"]);
                    group.GroupName = sqlreadRecord["GroupName"].ToString();
                    

                    groupList.Add(group);


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


            return groupList;
        }
    }
}