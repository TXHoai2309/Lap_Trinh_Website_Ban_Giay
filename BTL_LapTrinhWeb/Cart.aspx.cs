using BTL_LapTrinhWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LapTrinhWeb
{
    public partial class Cart : System.Web.UI.Page
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
                LoadCart();
            }
        }

        private void LoadCart()
        {
            List<CartItem> cart = Session["ShoppingCart"] as List<CartItem>;

            if (cart != null && cart.Count > 0)
            {
                rptCartItems.DataSource = cart;
                rptCartItems.DataBind();
                pnlEmptyCart.Visible = false;
                UpdateTotals(cart);
            }
            else
            {
                rptCartItems.DataSource = null;
                rptCartItems.DataBind();
                pnlEmptyCart.Visible = true;
                UpdateTotals(new List<CartItem>());
            }
        }

        private void UpdateTotals(List<CartItem> cart)
        {
            decimal totalPurchase = cart.Sum(item => item.LineTotal);
            decimal delivery = 0;
            decimal grandTotal = totalPurchase + delivery;

            litTotalPurchase.Text = string.Format("${0:F2}", totalPurchase);
            litDelivery.Text = (delivery == 0) ? "FREE" : string.Format("${0:F2}", delivery);
            litGrandTotal.Text = string.Format("${0:F2}", grandTotal);

            btnSecureCheckout.Enabled = (cart.Count > 0);
        }
        protected void rptCartItems_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                CartItem currentItem = (CartItem)e.Item.DataItem;
                Literal litSaleInfo = (Literal)e.Item.FindControl("litSaleInfo");
                if (currentItem.Sale > 0)
                {
                    litSaleInfo.Text = $"<p class='sale-info'>Sale: -{currentItem.Sale}%</p>";
                    litSaleInfo.Visible = true;
                }
                else
                {
                    litSaleInfo.Visible = false;
                }
            }
        }
        protected void rptCartItems_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                string productNumber = e.CommandArgument.ToString();

                List<CartItem> cart = Session["ShoppingCart"] as List<CartItem>;
                if (cart != null)
                {
                    CartItem itemToRemove = cart.Find(ci => ci.ProductNumber == productNumber);
                    if (itemToRemove != null)
                    {
                        cart.Remove(itemToRemove);
                    }
                    Session["ShoppingCart"] = cart;
                    LoadCart();
                }
            }
        }
        protected void search_button_Click(object sender, ImageClickEventArgs e) {}
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
        protected void lnkCart_Click(object sender, EventArgs e) 
        {
            Response.Redirect("~/Cart.aspx");
        }
        protected void SUBSCRIBE_btn_Click(object sender, EventArgs e) {}
        protected void btnSecureCheckout_Click(object sender, EventArgs e) 
        {
            Response.Redirect("~/Checkout.aspx");
        }
        protected void btnContinueShopping_Click(object sender, EventArgs e) { Response.Redirect("~/Trangchu.aspx"); }
    }
}