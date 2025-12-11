using BTL_LapTrinhWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LapTrinhWeb
{
    public partial class Checkout : System.Web.UI.Page
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
            {
                FillUserInfo();
                LoadCartItems();
            }
        }

        private void FillUserInfo()
        {
            if (Session["UserLoggedIn"] != null)
            {
                User currentUser = (User)Session["UserLoggedIn"];

                txtSurname.Text = currentUser.Surname ?? "";
                txtName.Text = currentUser.Name ?? "";
                txtEmail.Text = currentUser.Email ?? "";
                txtPhone.Text = currentUser.Phone ?? "";
                txtAddress1.Text = !string.IsNullOrEmpty(currentUser.Address1) ? currentUser.Address1 : "";
                txtAddress2.Text = !string.IsNullOrEmpty(currentUser.Address2) ? currentUser.Address2 : "";
                txtPostal.Text = !string.IsNullOrEmpty(currentUser.Postal) ? currentUser.Postal : "";
                txtCity.Text = !string.IsNullOrEmpty(currentUser.City) ? currentUser.City : "";
            }
        }

        private void LoadCartItems()
        {
            List<CartItem> cart = Session["ShoppingCart"] as List<CartItem>;

            if (cart != null && cart.Count > 0)
            {
                rptCheckoutItems.DataSource = cart;
                rptCheckoutItems.DataBind();

                UpdateTotals(cart);
            }
            else
            {
                rptCheckoutItems.DataSource = null;
                rptCheckoutItems.DataBind();

                lblEmptyCart.Text = "Your cart is empty!";
                lblEmptyCart.Visible = true;

                UpdateTotals(new List<CartItem>());
            }
        }
        public string GetPrice(object priceObj, object saleObj, object qtyObj)
        {
            decimal price = Convert.ToDecimal(priceObj);
            int sale = Convert.ToInt32(saleObj);
            int qty = Convert.ToInt32(qtyObj);

            decimal finalPrice = price * (1 - (decimal)sale / 100);
            decimal total = finalPrice * qty;

            return $"${total:F2}";
        }
        private void UpdateTotals(List<CartItem> cart)
        {
            decimal totalPurchase = cart.Sum(item => item.LineTotal);
            decimal delivery = 0;
            decimal grandTotal = totalPurchase + delivery;

            litTotalPurchase.Text = $"${totalPurchase:F2}";
            litDelivery.Text = (delivery == 0) ? "FREE" : $"${delivery:F2}";
            litGrandTotal.Text = $"${grandTotal:F2}";
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Cart.aspx");
        }
        protected void lnkSignIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LogIn.aspx");
        }
        protected void lnkMyAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MyAccount.aspx");
        }
        protected void lnkFavorites_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Favorites.aspx");
        }

        protected void lnkCart_Click(Object sender, EventArgs e)
        {
            Response.Redirect("~/Cart.aspx");
        }
        protected void search_button_Click(object sender, ImageClickEventArgs e) { }
        protected void SUBSCRIBE_btn_Click(Object sender, EventArgs e)
        {

        }
        // Hoài sửa ở đây
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            bool isValid = true;

 
            lblSurnameError.Text = lblNameError.Text = lblEmailError.Text = lblPhoneError.Text =
            lblAddress1Error.Text = lblCityError.Text = lblPostalError.Text =
            lblPaymentError.Text = lblAccountError.Text = "";


            if (string.IsNullOrWhiteSpace(txtSurname.Text))
            {
                lblSurnameError.Text = "Please enter your surname.";
                isValid = false;
            }
            if (string.IsNullOrWhiteSpace(txtName.Text))
            {
                lblNameError.Text = "Please enter your name.";
                isValid = false;
            }
            if (string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                lblEmailError.Text = "Please enter your email address.";
                isValid = false;
            }
            else if (!System.Text.RegularExpressions.Regex.IsMatch(txtEmail.Text, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                lblEmailError.Text = "Invalid email format.";
                isValid = false;
            }
            if (string.IsNullOrWhiteSpace(txtPhone.Text))
            {
                lblPhoneError.Text = "Please enter your phone number.";
                isValid = false;
            }
            if (string.IsNullOrWhiteSpace(txtAddress1.Text))
            {
                lblAddress1Error.Text = "Please enter your address.";
                isValid = false;
            }
            if (string.IsNullOrWhiteSpace(txtCity.Text))
            {
                lblCityError.Text = "Please enter your city.";
                isValid = false;
            }
            if (string.IsNullOrWhiteSpace(txtPostal.Text))
            {
                lblPostalError.Text = "Please enter your postal code.";
                isValid = false;
            }
            if (rblPaymentMethod.SelectedIndex == -1)
            {
                lblPaymentError.Text = "Please select a payment method.";
                isValid = false;
            }
            else if ((rblPaymentMethod.SelectedValue == "Bank" || rblPaymentMethod.SelectedValue == "Card")
            && !System.Text.RegularExpressions.Regex.IsMatch(txtAccount.Text.Trim(), @"^\d+$"))
            {
                lblAccountError.Text = "Account number must contain only digits.";
                isValid = false;
            }

            if (!isValid)
                return;

            List<CartItem> cart = Session["ShoppingCart"] as List<CartItem>;
            User currentUser = Session["UserLoggedIn"] as User;

            if (cart == null || cart.Count == 0 || currentUser == null)
            {
                Response.Redirect("~/Cart.aspx");
                return;
            }

            decimal grandTotal = cart.Sum(item => (item.Price * (1 - (decimal)item.Sale / 100)) * item.Quantity);

            string orderCode = "ORD-" + DateTime.Now.ToString("yyyyMMdd") + "-" + new Random().Next(1000, 9999);

            Order newOrder = new Order
            {
                OrderNumber = orderCode,
                Date = DateTime.Now,
                UserName = currentUser.Name,
                TotalAmount = grandTotal,
                PaymentMethod = rblPaymentMethod.SelectedValue,
                Address = txtAddress1.Text.Trim(),
                City = txtCity.Text.Trim(),
                Postal = txtPostal.Text.Trim(),
                Items = cart.Select(item => new CartItem
                {
                    ProductID = item.ProductID,
                    Name = item.Name,
                    Price = item.Price,
                    Sale = item.Sale,
                    Size = item.Size,
                    Quantity = item.Quantity,
                    ImageUrl = item.ImageUrl,
                }).ToList()
            };

            if (Application["OrderHistory"] == null)
                Application["OrderHistory"] = new List<Order>();

            lock (Application)
            {
                List<Order> orderHistory = Application["OrderHistory"] as List<Order>;
                if (orderHistory == null)
                    orderHistory = new List<Order>();

                orderHistory.Add(newOrder);
                Application["OrderHistory"] = orderHistory;
            }
            List<int> purchasedProducts = Session["PurchasedProducts"] as List<int> ?? new List<int>();

            foreach (var item in newOrder.Items)
            {
                if (!purchasedProducts.Contains(item.ProductID))
                    purchasedProducts.Add(item.ProductID);
            }

            Session["PurchasedProducts"] = purchasedProducts;
            Session["HasPurchased"] = true;
            Session["PurchasedUserName"] = currentUser.Name;
            Session.Remove("ShoppingCart");

            Session["LastOrderCode"] = orderCode;
            Session["HasPurchased"] = true;

            Response.Redirect("~/ThankYou.aspx");
        }
    }
}