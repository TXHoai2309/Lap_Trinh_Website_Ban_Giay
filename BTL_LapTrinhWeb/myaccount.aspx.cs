
using BTL_LapTrinhWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LapTrinhWeb
{
    public partial class MyAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserLoggedIn"] != null)
            {
                User currentUser = (User)Session["UserLoggedIn"];
                lblUserName.Text = currentUser.Name;
                lnkSignIn.Text = currentUser.Name;
                lnkSignIn.Click -= lnkSignIn_Click;
                lnkSignIn.Click += lnkMyAccount_Click;
            }

            if (!IsPostBack && Session["UserLoggedIn"] != null)
            {
                List<User> listUser = Application["dstk"] as List<User>;
                User loggedUser = Session["UserLoggedIn"] as User;

                if (listUser != null && loggedUser != null)
                {
                    User currentUser = listUser.FirstOrDefault(u => u.Id == loggedUser.Id);
                    if (currentUser != null)
                    {
                        txtAddress1.Text = currentUser.Address1;
                        txtAddress2.Text = currentUser.Address2;
                        txtPostal.Text = currentUser.Postal;
                        txtCity.Text = currentUser.City;
                        txtCountry.Text = currentUser.Country;
                    }
                }
            }

        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            lblUpdateMessage.Visible = false;
            lblAddress1Error.Text = lblAddress2Error.Text = lblPostalError.Text = lblCityError.Text = lblCountryError.Text = "";
            bool isValid = true;

            if (string.IsNullOrWhiteSpace(txtAddress1.Text))
            {
                lblAddress1Error.Text = "Please enter address 1!";
                isValid = false;
            }
            if (string.IsNullOrWhiteSpace(txtAddress2.Text))
            {
                lblAddress2Error.Text = "Please enter address 2!";
                isValid = false;
            }
            if (string.IsNullOrWhiteSpace(txtPostal.Text))
            {
                lblPostalError.Text = "Please enter the postal code!";
                isValid = false;
            }
            if (string.IsNullOrWhiteSpace(txtCity.Text))
            {
                lblCityError.Text = "Please enter the city!";
                isValid = false;
            }
            if (string.IsNullOrWhiteSpace(txtCountry.Text))
            {
                lblCountryError.Text = "Please enter the country!";
                isValid = false;
            }

            if (!isValid) return;


            List<User> listUser = Application["dstk"] as List<User>;
            if (listUser == null)
            {
                lblAddress1Error.Text = "User data not found in the Application.";
                return;
            }

            User loggedUser = Session["UserLoggedIn"] as User;
            if (loggedUser == null)
            {
                lblAddress1Error.Text = "Your session has expired, please log in again!";
                return;
            }

            User currentUser = listUser.FirstOrDefault(u => u.Id == loggedUser.Id);
            if (currentUser != null)
            {
                currentUser.Address1 = txtAddress1.Text.Trim();
                currentUser.Address2 = txtAddress2.Text.Trim();
                currentUser.Postal = txtPostal.Text.Trim();
                currentUser.City = txtCity.Text.Trim();
                currentUser.Country = txtCountry.Text.Trim();

                lblUpdateMessage.Text = "Update successful!";
                lblUpdateMessage.Visible = true;

                // 🔹 Cập nhật user trong danh sách
                int index = listUser.FindIndex(u => u.Id == currentUser.Id);
                if (index != -1)
                {
                    listUser[index] = currentUser;
                }

                Application["dstk"] = listUser;


                Session["UserLoggedIn"] = currentUser;


            }
        }

        protected void btnUpdateTab_Click(object sender, EventArgs e)
        {
            btnUpdateTab.CssClass = "tab-button active";
            btnOrderTab.CssClass = "tab-button";

            updateInfor.Visible = true;
            orderHistory.Visible = false;
        }
        private void LoadOrderHistory()
        {
            User loggedUser = Session["UserLoggedIn"] as User;
            if (loggedUser == null) return;

            List<Order> userOrders = new List<Order>();
            lock (Application)
            {
                List<Order> globalOrderHistory = Application["OrderHistory"] as List<Order>;
                if (globalOrderHistory != null)
                {
                    userOrders = globalOrderHistory
                        .Where(o => o.UserName == loggedUser.Name)
                        .OrderByDescending(o => o.Date)
                        .ToList();
                }
            }

            if (userOrders.Count > 0)
            {
                var dataToBind = userOrders.Select(order => new
                {
                    OrderNumber = order.OrderNumber,
                    Date = order.Date.ToString("dd/MM/yyyy HH:mm"),
                    Items = string.Join("<br/>",
                        order.Items.Select(i => $"{i.Name} (x{i.Quantity})")),
                    Total = string.Format("${0:F2}", order.TotalAmount)
                }).ToList();
                gvOrder.DataSource = dataToBind;
                gvOrder.DataBind();
                gvOrder.Visible = true;
            }
            else
            {
                gvOrder.Visible = false;
            }
        }
        protected void btnOrderTab_Click(object sender, EventArgs e)
        {
            btnUpdateTab.CssClass = "tab-button";
            btnOrderTab.CssClass = "tab-button active";

            updateInfor.Visible = false;
            orderHistory.Visible = true;
            LoadOrderHistory();
        }
        protected void SUBSCRIBE_btn_Click(object sender, EventArgs e)
        {
            // Code xử lý đăng ký nhận tin
        }
        protected void search_button_Click(object sender, EventArgs e)
        {
            // Code xử lý đăng ký nhận tin
        }
        protected void btnSearch_Click(object sender, ImageClickEventArgs e)
        {
            // Code xử lý tìm kiếm
        }

        protected void lnkSignIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LogIn.aspx");
        }

        protected void lnkFavorites_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Favorites.aspx");
        }

        protected void lnkCart_Click(object sender, EventArgs e)
        {
            // Code chuyển hướng đến trang giỏ hàng
        }

        protected void lnkMyAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MyAccount.aspx");
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Trangchu.aspx");
        }
    }
}