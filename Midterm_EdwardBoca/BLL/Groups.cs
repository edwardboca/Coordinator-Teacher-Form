using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Midterm_EdwardBoca.DAL;

namespace Midterm_EdwardBoca.BLL
{
    public class Groups
    {
        public int GroupNumber { get; set; }
        public string GroupName { get; set; }



        public List<Groups> listAllGroups()
        {
            return GroupsDB.listAllGroups();

        }
    }
}