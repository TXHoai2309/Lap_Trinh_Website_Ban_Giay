using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL_LapTrinhWeb.Models
{
    public class Products
    {
        public int ProductID { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string ImageUrl { get; set; }
        public string Category { get; set; }
        public string ProductUrl { get; set; }
        public string Gender { get; set; }
        public int Sale { get; set; }
        public string Description { get; set; }
        public string ImageBack { get; set; }
        public string ImageLeft { get; set; }
        public string ImageTop { get; set; }
        public string ImageUnder { get; set; }
        public List<Review> Reviews { get; set; }
        public Products() { }
    }
}