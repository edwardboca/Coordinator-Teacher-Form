using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Midterm_EdwardBoca.DAL;

namespace Midterm_EdwardBoca.BLL
{
    public class Courses
    {
        public string CourseCode { get; set; }
        public string CourseTitle { get; set; }
        public int CourseDuration { get; set; }

        public List<Courses> listAllCourses()
        {
            return CoursesDB.listAllCourses();

        }
        public Courses GetCourses(string courseCode)
        {
            return CoursesDB.GetCourses(courseCode);
        }
    }
}