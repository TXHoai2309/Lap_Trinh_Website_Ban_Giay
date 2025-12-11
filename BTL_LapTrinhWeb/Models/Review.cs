using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL_LapTrinhWeb.Models
{
    public class Review
    {
        public string Author { get; set; }
        public string Content { get; set; }
        public int Rating { get; set; }
        public int ReviewId { get; set; }
        public int ProductID { get; set; }
        public string DatePosted { get; set; }
        public bool CanEdit { get; set; }

    }
}