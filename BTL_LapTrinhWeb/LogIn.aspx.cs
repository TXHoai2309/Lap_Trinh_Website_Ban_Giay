using BTL_LapTrinhWeb.Models;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LapTrinhWeb
{
    public partial class LogIn : System.Web.UI.Page
    {
        public string RememberedUsername { get; set; } = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie rememberCookie = Request.Cookies["RememberMe"];
                if (rememberCookie != null)
                {
                    txtTenDangNhap.Text = rememberCookie.Value;
                    chkGhiNho.Checked = true;
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string username = txtTenDangNhap.Text.Trim();
            string password = txtMatKhau.Text.Trim();
            if (username.Equals("admin", StringComparison.OrdinalIgnoreCase) && password == "12345678")
            {
                Session["UserLoggedIn"] = new User { Username = "admin" };
                Response.Redirect("~/Admin.aspx");
                return;
            }
            List<User> userList = Application["dstk"] as List<User>;

            User foundUser = userList?.FirstOrDefault(u =>
                u.Username.Equals(username, StringComparison.OrdinalIgnoreCase) &&
                u.Password == password);

            if (foundUser != null)
            {

                if (chkGhiNho.Checked)
                {
                    HttpCookie rememberCookie = new HttpCookie("RememberMe", foundUser.Username)
                    {
                        Expires = DateTime.Now.AddDays(1)
                    };
                    Response.Cookies.Add(rememberCookie);
                }
                else
                {
                    if (Request.Cookies["RememberMe"] != null)
                    {
                        HttpCookie expiredCookie = new HttpCookie("RememberMe")
                        {
                            Expires = DateTime.Now.AddDays(-1)
                        };
                        Response.Cookies.Add(expiredCookie);
                    }
                }

                Session["UserLoggedIn"] = foundUser;

                Response.Redirect("Trangchu.aspx");
            }
            else
            {
                lblThongbao.Text = "The username or password is incorrect!";
                lblThongbao.Visible = true;
            }
        }


        protected void search_button_Click(object sender, ImageClickEventArgs e) { }
        protected void lnkSignIn_Click(object sender, EventArgs e) 
        {
            Response.Redirect("~/SignIn.aspx");
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