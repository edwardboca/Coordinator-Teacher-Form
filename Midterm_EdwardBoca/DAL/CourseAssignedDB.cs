using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Midterm_EdwardBoca.BLL;

namespace Midterm_EdwardBoca.DAL
{
    public class CourseAssignedDB
    {



        public static List<CourseAssigned> listAllCoursesAssigned()
        {


            List<CourseAssigned> courseAssignedList = new List<CourseAssigned>();
            SqlConnection con = UtilityDB.ConnectDB();

            try
            {
                SqlCommand cmdListRecord = new SqlCommand("select * from CourseAssignments", con);
                SqlDataReader sqlreadRecord = cmdListRecord.ExecuteReader();

                CourseAssigned courseAssigned;

                while (sqlreadRecord.Read())
                {
                    courseAssigned = new CourseAssigned();

                    courseAssigned.EmployeeId = Convert.ToInt32(sqlreadRecord["EmployeeId"]);
                    courseAssigned.CourseCode = sqlreadRecord["CourseCode"].ToString();
                   
                    courseAssigned.GroupNumber = Convert.ToInt32(sqlreadRecord["GroupNumber"]);
                    courseAssigned.AssignedDate = sqlreadRecord["AssignedDate"].ToString();

                    courseAssignedList.Add(courseAssigned);


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


            return courseAssignedList;

        }

        public static void AssignCourse(CourseAssigned courseAs)
        {
            SqlConnection cnnDB = UtilityDB.ConnectDB();
            SqlCommand cmdInsert = new SqlCommand();


            cmdInsert.CommandText = "INSERT INTO CourseAssignments (EmployeeId,CourseCode,GroupNumber,AssignedDate)" +
                                        "VALUES(@EmployeeId,@CourseCode,@GroupNumber,@AssignedDate)";
            cmdInsert.Parameters.AddWithValue("@EmployeeId", courseAs.EmployeeId);
            cmdInsert.Parameters.AddWithValue("@CourseCode", courseAs.CourseCode);
            cmdInsert.Parameters.AddWithValue("@GroupNumber", courseAs.GroupNumber);
            cmdInsert.Parameters.AddWithValue("@AssignedDate", courseAs.AssignedDate);

            cmdInsert.Connection = cnnDB;
            cmdInsert.ExecuteNonQuery();
            cnnDB.Close();
            cnnDB.Dispose();



        }


    }
    }
