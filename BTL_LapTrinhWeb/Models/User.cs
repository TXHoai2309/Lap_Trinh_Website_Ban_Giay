using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL_LapTrinhWeb.Models
{
    public class User
    {
        public int Id { get; set; }
        public string Surname {  get; set; }
        public string Name { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string QueQuan { get; set; }
        private static int nextId = 1;

        public string Address1 { set; get; }
        public string Address2 { set; get; }
        public string Postal { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public User() {
            this.Id = nextId;
            nextId++;
        }
    }
}