using BTL_LapTrinhWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LapTrinhWeb
{
    public partial class Blog2 : System.Web.UI.Page
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
        }
        protected void search_button_Click(object sender, ImageClickEventArgs e)
        {
            string searchTerm = txtSearch.Text.Trim().ToLower();

            switch (searchTerm)
            {
                case "men":
                    Response.Redirect(ResolveUrl("~/Men.aspx"));
                    break;
                case "women":
                    Response.Redirect(ResolveUrl("~/Women.aspx"));
                    break;
                case "kids":
                    Response.Redirect(ResolveUrl("~/Kids.aspx"));
                    break;
                case "sale":
                    Response.Redirect(ResolveUrl("~/Sale.aspx"));
                    break;
                default:
                    if (!string.IsNullOrEmpty(searchTerm))
                    {
                        Response.Redirect(ResolveUrl("~/Men.aspx?search=" + Server.UrlEncode(searchTerm)));
                    }
                    break;
            }
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

        protected void SUBSCRIBE_btn_Click(object sender, EventArgs e)
        {
        }
        protected void btnBackToHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Trangchu.aspx");
        }
    }
}