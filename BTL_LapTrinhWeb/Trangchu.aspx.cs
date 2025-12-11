using BTL_LapTrinhWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LapTrinhWeb
{
    public partial class Trangchu : System.Web.UI.Page
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
                BindBestSellers();
                BindArticles();
            }
        }

        private void BindBestSellers()
        {
            var menProducts = (List<Products>)Application["MenProductList"];
            if (menProducts == null || !menProducts.Any())
            {
                return;
            }

            var bestSellersList = menProducts.OrderByDescending(p => p.Price).Take(4).ToList();

            rptBestSellers.DataSource = bestSellersList;
            rptBestSellers.DataBind();
        }

        private void BindArticles()
        {
            var articleList = new List<Article>
            {
                new Article { Title = "The Air Jordan 1 Retro Low OG SP Fragment x Travis Scott", ImageUrl = "Assets/images/Trangchu/blog_img1.png", ArticleUrl = "~/Blog1.aspx" },
                new Article { Title = "Puma LaMelo Ball MB.04 Lo “Alien Skin”", ImageUrl = "Assets/images/Trangchu/blog_img2.png", ArticleUrl = "~/Blog2.aspx" },
                new Article { Title = "Air Jordan 4 Retro Off-White “Sail”: When Luxury Meets Streetwear Perfection", ImageUrl = "Assets/images/Trangchu/blog_img3.png", ArticleUrl = "~/Blog3.aspx" }
            };

            rptArticles.DataSource = articleList;
            rptArticles.DataBind();
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
        protected void lnkMyAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MyAccount.aspx");
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
        protected void btnShopNowHero_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Men.aspx");
        }
        protected void btnShopNowSneaker_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Men.aspx?category=Sneakers");
        }
        protected void btnShopNowSale_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Sale.aspx");
        }
        protected void btnCategoryWomen_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Women.aspx");
        }
        protected void btnCategoryMen_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Men.aspx");
        }
        protected void btnCategoryKids_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Kids.aspx");
        }
        protected void SUBSCRIBE_btn_Click(object sender, EventArgs e) { }
    }
    public class Article
    {
        public string Title { get; set; }
        public string ImageUrl { get; set; }
        public string ArticleUrl { get; set; }
    }
}