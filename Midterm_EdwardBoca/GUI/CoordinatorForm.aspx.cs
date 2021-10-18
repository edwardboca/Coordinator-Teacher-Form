using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Midterm_EdwardBoca.BLL;
using Midterm_EdwardBoca.DAL;
//using System.Windows.Forms;
using System.Data.SqlClient;
using System.Windows;

namespace Midterm_EdwardBoca.GUI
{
    public partial class CoordinatorForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(Page.IsPostBack))
            {
                Employees emp = new Employees();
                List<Employees> empList = emp.listAllEmployees();
                foreach (Employees em in empList)
                {

                    dpdSelectTeacher.Items.Add(em.Employeeid + ", " + em.FirstName + ", " + em.LastName);
                }


                Courses course = new Courses();
                List<Courses> courseList = course.listAllCourses();
                foreach (Courses c in courseList)
                {

                    dpdSelectCourse.Items.Add(c.CourseCode + ", " + c.CourseTitle + ", " + c.CourseDuration);
                }

                Groups group = new Groups();
                List<Groups> groupList = group.listAllGroups();
                foreach (Groups g in groupList)
                {

                    dpdSelectGroup.Items.Add(g.GroupNumber + ", " + g.GroupName);
                }
                

            }
        }



        protected void btnListAllAssignCourses_Click(object sender, EventArgs e)
        {

        }

        protected void btnAssignCourse_Click(object sender, EventArgs e)
        {
            string inpute = dpdSelectTeacher.SelectedValue;
            String[] field = inpute.Split(',');
            int id = Convert.ToInt32(field[0]);

            //  string date = tbDate.Text;

            string inpute2 = dpdSelectCourse.SelectedValue;
            String[] field2 = inpute2.Split(',');
            string code = field2[0];


            string inpute3 = dpdSelectGroup.SelectedValue;
            String[] field3 = inpute3.Split(',');
            string group = field3[0];

            //MessageBox.Show(code);
            //MessageBox.Show(group);
            
            // MessageBox.Show(group);
            //MessageBox.Show(code);
            CourseAssigned courseAs = new CourseAssigned();
            List<CourseAssigned> listPA = courseAs.listAllCoursesAssigned();
            int counter = 0;

            
            foreach (CourseAssigned pa in listPA)
            {
                if ((code == pa.CourseCode) && (group == Convert.ToString( pa.GroupNumber)))                
                {
                    MessageBox.Show("This course has already been assigned to this group", "Already assigned");
                    return;
                }
            }
            

            foreach (CourseAssigned pa in listPA)
            {
                

                if ((id == pa.EmployeeId))
                {
                    counter++;
                    if (counter >= 4)
                    {
                        counter = 0;
                        MessageBox.Show("You have exceeded 4 courses for this teacher. That is the limit!");
                        return;
                    }
                }

            }
            /*
                    protected void btnListCourses_Click(object sender, EventArgs e)
                    {

                    }
                    */
            courseAs.EmployeeId = id;
            courseAs.CourseCode = code;
            courseAs.GroupNumber = Convert.ToInt32(group);
            courseAs.AssignedDate = CalendarAssignedDate.SelectedDate.ToString();
            //proAs.SubmittedDate = " ";  
            courseAs.AsssignCourse(courseAs);
            MessageBox.Show("course Assigned");
        }

        protected void btnListCourses_Click(object sender, EventArgs e)
        {
            string inpute = dpdSelectTeacher.SelectedValue;
            String[] field = inpute.Split(',');
            int id = Convert.ToInt32(field[0]);

            CourseAssigned courseAs = new CourseAssigned();
            List<CourseAssigned> listPA = courseAs.listAllCoursesAssigned();
            Courses course;
            List<Courses> listC_Assigned = new List<Courses>();
            foreach (CourseAssigned pa in listPA)
            {
                if (id == pa.EmployeeId)
                {
                    // MessageBox.Show(pa.ProjectCode + "," + pa.AssignedDate);
                    course = new Courses();
                    course = course.GetCourses(pa.CourseCode);



                    //prj.ProjectTitle = "dwadaw";
                    listC_Assigned.Add(course);

                }

            }

            GridViewListInfo.DataSource = listC_Assigned;
            GridViewListInfo.DataBind();
        }
    }
}