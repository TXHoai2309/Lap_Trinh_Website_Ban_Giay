using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL_LapTrinhWeb.Models
{
    public class CartItem
    {
        public int ProductID { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int Sale { get; set; }
        public string ProductNumber { get; set; }
        public int Size { get; set; }
        public int Quantity { get; set; }
        public string ImageUrl { get; set; }

        public decimal FinalPrice
        {
            get
            {
                if (Sale > 0)
                {
                    return Price * (1 - (decimal)Sale / 100);
                }
                return Price;
            }
        }
        public decimal LineTotal => FinalPrice * Quantity;
    }
}