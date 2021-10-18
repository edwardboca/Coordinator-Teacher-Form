using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Midterm_EdwardBoca.DAL;

namespace Midterm_EdwardBoca.BLL
{
    public class Employees
    {
        public int Employeeid { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string JobTitle { get; set; }


        public List<Employees> listAllEmployees()
        {
            return EmployeesDB.listAllEmployees();

        }
    }
}