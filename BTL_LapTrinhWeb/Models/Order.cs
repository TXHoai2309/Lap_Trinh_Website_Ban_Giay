using BTL_LapTrinhWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL_LapTrinhWeb
{
    public class Order
    {
        public string OrderNumber { get; set; }
        public DateTime Date { get; set; }
        public string UserName { get; set; } // Dùng để lọc đơn hàng
        public decimal TotalAmount { get; set; }
        public List<CartItem> Items { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string Postal { get; set; }
        public string PaymentMethod { get; set; }
    }
}