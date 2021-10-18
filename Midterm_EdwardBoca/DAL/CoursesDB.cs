using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Midterm_EdwardBoca.BLL;


namespace Midterm_EdwardBoca.DAL
{
    public class CoursesDB
    {

        public static Courses GetCourses(string courseCode)
        {
            Courses course = new Courses();
            //your code here
            course.CourseCode = courseCode;

            //testing
            SqlConnection con1 = UtilityDB.ConnectDB();
            //("select * from Students where StudentNumber='" + txtUserId.Text + "' AND Password = '" + txtPassword.Text + "'", connDB);
            SqlCommand cmdListRecord = new SqlCommand("select * from Courses where CourseCode='" + courseCode + "'", con1);
            SqlDataReader sqlreadRecord = cmdListRecord.ExecuteReader();



            while (sqlreadRecord.Read())
            {
                //proj = new Project();
                course.CourseCode = sqlreadRecord["CourseCode"].ToString();
                course.CourseTitle = sqlreadRecord["CourseTitle"].ToString();
                course.CourseDuration =Convert.ToInt32( sqlreadRecord["Duration"]);
                //projList.Add(proj);




            }
            return course;
        }




        public static List<Courses> listAllCourses()
        {


            List<Courses> courseList = new List<Courses>();
            SqlConnection con = UtilityDB.ConnectDB();

            try
            {
                SqlCommand cmdListRecord = new SqlCommand("select * from Courses", con);

                //SqlCommand cmd = new SqlCommand("select * from Students where StudentNumber='" + txtUserId.Text + "' AND Password = '" + txtPassword.Text + "'", connDB);
                SqlDataReader sqlreadRecord = cmdListRecord.ExecuteReader();

                Courses course;

                while (sqlreadRecord.Read())
                {
                    course = new Courses();
                    course.CourseCode = sqlreadRecord["CourseCode"].ToString();
                    course.CourseTitle = sqlreadRecord["CourseTitle"].ToString();
                    course.CourseDuration = Convert.ToInt32(sqlreadRecord["Duration"]);

                    courseList.Add(course);


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


            return courseList;
        }
    }
}