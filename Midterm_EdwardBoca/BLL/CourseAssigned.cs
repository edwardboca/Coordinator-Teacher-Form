using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Midterm_EdwardBoca.DAL;

namespace Midterm_EdwardBoca.BLL
{
    public class CourseAssigned
    {

        public int EmployeeId { get; set; }
        public string CourseCode { get; set; }
        public int GroupNumber { get; set; }
        public string AssignedDate { get; set; }

        public List<CourseAssigned> listAllCoursesAssigned()
        {


            return CourseAssignedDB.listAllCoursesAssigned();
        }

        public void AsssignCourse(CourseAssigned courseAs)
        {

            CourseAssignedDB.AssignCourse(courseAs);
        }


        
    }
}