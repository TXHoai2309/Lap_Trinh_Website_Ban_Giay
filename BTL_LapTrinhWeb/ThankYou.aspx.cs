using BTL_LapTrinhWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

namespace BTL_LapTrinhWeb
{
    public partial class ThankYou : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserLoggedIn"] != null)
            {
                User currentUser = (User)Session["UserLoggedIn"];
                lnkSignIn.Text = currentUser.Name;
                lnkSignIn.Click -= lnkSignIn_Click;
                lnkSignIn.Click += lnkMyAccount_Click;
            }
            if (!IsPostBack)
                LoadOrderInfo();
        }

        private void LoadOrderInfo()
        {
            string orderCode = Session["LastOrderCode"] as string;
            User currentUser = Session["UserLoggedIn"] as User;

            if (string.IsNullOrEmpty(orderCode) || currentUser == null)
            {
                Response.Redirect("~/TrangChu.aspx");
                return;
            }

            List<Order> orderHistory = Application["OrderHistory"] as List<Order>;
            Order lastOrder = orderHistory?.LastOrDefault(o => o.OrderNumber == orderCode && o.UserName == currentUser.Name);

            if (lastOrder == null)
            {
                lblOrderCode.Text = "N/A";
                lblPayment.Text = "N/A";
                lblGrandTotal.Text = "$0.00";
                return;
            }

            lblOrderCode.Text = lastOrder.OrderNumber;
            lblFullName.Text = currentUser.Name;
            lblEmail.Text = currentUser.Email;
            lblPhone.Text = currentUser.Phone;
            lblAddress.Text = lastOrder.Address;
            lblCity.Text = lastOrder.City;
            lblPostal.Text = lastOrder.Postal;

            lblPayment.Text = lastOrder.PaymentMethod;

            rptOrderItems.DataSource = lastOrder.Items;
            rptOrderItems.DataBind();
            lblGrandTotal.Text = $"${lastOrder.TotalAmount:F2}";
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Trangchu.aspx");
        }
        protected void search_button_Click(object sender, ImageClickEventArgs e) { }
        protected void lnkSignIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SignIn.aspx");
        }
        protected void lnkMyAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MyAccount.aspx");
        }
        protected void lnkFavorites_Click(object sender, EventArgs e)
        {
            if (Session["UserLoggedIn"] != null)
            {
                Response.Redirect("~/Favorites.aspx");
            }
            else
            {
                Response.Redirect("~/LogIn.aspx");
            }
        }
        protected void lnkCart_Click(object sender, EventArgs e)
        {
            if (Session["UserLoggedIn"] != null)
            {
                Response.Redirect("~/Cart.aspx");
            }
            else
            {
                Response.Redirect("~/LogIn.aspx");
            }
        }
        protected void SUBSCRIBE_btn_Click(object sender, EventArgs e) { }
    }
}
