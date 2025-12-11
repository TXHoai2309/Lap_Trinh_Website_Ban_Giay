using BTL_LapTrinhWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LapTrinhWeb
{
    public partial class Sale : System.Web.UI.Page
    {
        private string CurrentSubCategory
        {
            get { return ViewState["CurrentSubCategory"] as string ?? "All"; }
            set { ViewState["CurrentSubCategory"] = value; }
        }

        private string CurrentSearchTerm
        {
            get { return ViewState["CurrentSearchTerm"] as string ?? ""; }
            set { ViewState["CurrentSearchTerm"] = value; }
        }

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
                if (Request.QueryString["search"] != null)
                {
                    string searchTerm = Request.QueryString["search"].ToString();
                    CurrentSearchTerm = searchTerm;
                    txtSearch.Text = searchTerm;
                }
                BindProductData(CurrentSubCategory, ddlSort.SelectedValue, ddlFilter.SelectedValue, CurrentSearchTerm);
            }
        }

        protected void btnSearch_Click(object sender, ImageClickEventArgs e)
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
                    CurrentSearchTerm = txtSearch.Text.Trim();
                    ddlSort.SelectedIndex = 0;
                    ddlFilter.SelectedIndex = 0;
                    BindProductData(CurrentSubCategory, ddlSort.SelectedValue, ddlFilter.SelectedValue, CurrentSearchTerm);
                    break;
            }
        }

        private void BindProductData(string subCategory, string sortOption, string filterOption, string searchTerm)
        {
            List<Products> allProducts = (List<Products>)Application["AllProducts"];
            if (allProducts == null) return;

            IEnumerable<Products> processedProducts = allProducts.Where(p => p.Sale > 0);

            if (!string.IsNullOrEmpty(searchTerm))
            {
                string lowerSearchTerm = searchTerm.ToLower();
                processedProducts = processedProducts.Where(p =>
                    p.Name.ToLower().Contains(lowerSearchTerm) ||
                    p.Category.ToLower().Contains(lowerSearchTerm) ||
                    p.Gender.ToLower().Contains(lowerSearchTerm)
                );
            }

            if (subCategory != "All")
            {
                processedProducts = processedProducts.Where(p => p.Category == subCategory);
            }

            switch (filterOption)
            {
                case "lt100":
                    processedProducts = processedProducts.Where(p => (p.Price * (1 - (decimal)p.Sale / 100)) < 100);
                    break;
                case "100_500":
                    processedProducts = processedProducts.Where(p => {
                        decimal newPrice = p.Price * (1 - (decimal)p.Sale / 100);
                        return newPrice >= 100 && newPrice <= 500;
                    });
                    break;
                case "gt500":
                    processedProducts = processedProducts.Where(p => (p.Price * (1 - (decimal)p.Sale / 100)) > 500);
                    break;
            }

            switch (sortOption)
            {
                case "name_asc":
                    processedProducts = processedProducts.OrderBy(p => p.Name);
                    break;
                case "name_desc":
                    processedProducts = processedProducts.OrderByDescending(p => p.Name);
                    break;
                case "price_asc":
                    processedProducts = processedProducts.OrderBy(p => p.Price * (1 - (decimal)p.Sale / 100));
                    break;
                case "price_desc":
                    processedProducts = processedProducts.OrderByDescending(p => p.Price * (1 - (decimal)p.Sale / 100));
                    break;
            }

            rptProducts.DataSource = processedProducts.ToList();
            rptProducts.DataBind();
        }

        protected void ddlSortFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindProductData(CurrentSubCategory, ddlSort.SelectedValue, ddlFilter.SelectedValue, CurrentSearchTerm);
        }

        protected void btnCategory_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            CurrentSubCategory = btn.CommandArgument;

            CurrentSearchTerm = "";
            txtSearch.Text = "";
            ddlSort.SelectedIndex = 0;
            ddlFilter.SelectedIndex = 0;

            BindProductData(CurrentSubCategory, ddlSort.SelectedValue, ddlFilter.SelectedValue, CurrentSearchTerm);
        }

        public string GetPriceDisplay(object dataItem)
        {
            var product = (Products)dataItem;
            if (product.Sale > 0)
            {
                decimal newPrice = product.Price * (1 - (decimal)product.Sale / 100);
                string oldPriceHtml = $"<span class='old-price'>${product.Price:F2}</span>";
                string newPriceHtml = $"<span class='new-price'>${newPrice:F2}</span>";
                return $"<div class='price-container'>{oldPriceHtml} {newPriceHtml}</div>";
            }
            else
            {
                return $"<div class='product_price'>${product.Price:F2}</div>";
            }
        }
        protected void btnAddToFavorites_Click(object sender, ImageClickEventArgs e)
        {
            string commandArgument = ((ImageButton)sender).CommandArgument;
            string[] parts = commandArgument.Split(',');
            string productId = parts[0];
            string productCategory = parts[1];

            string uniqueProductId = $"{productCategory}-{productId}";
            List<string> favorites = Session["Favorites"] as List<string>;
            if (favorites == null)
            {
                favorites = new List<string>();
            }

            if (favorites.Contains(uniqueProductId))
            {
                favorites.Remove(uniqueProductId);
            }
            else
            {
                favorites.Add(uniqueProductId);
            }

            Session["Favorites"] = favorites;

            BindProductData(CurrentSubCategory, ddlSort.SelectedValue, ddlFilter.SelectedValue, CurrentSearchTerm);
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
        protected void btnBuyNow_Click(object sender, EventArgs e) 
        {
            string productId = ((LinkButton)sender).CommandArgument;
            Response.Redirect($"~/Product_Detail.aspx?id={productId}");
        }
        protected void SUBSCRIBE_btn_Click(object sender, EventArgs e) { /* Xử lý đăng ký nhận tin */ }
        public bool IsFavorite(string productId, string category)
        {
            string uniqueProductId = $"{category}-{productId}";
            List<string> favorites = Session["Favorites"] as List<string>;
            if (favorites == null) return false;
            return favorites.Contains(uniqueProductId);
        }
    }
}