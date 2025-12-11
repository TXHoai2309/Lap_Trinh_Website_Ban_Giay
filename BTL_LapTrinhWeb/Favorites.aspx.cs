using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using BTL_LapTrinhWeb.Models;

namespace BTL_LapTrinhWeb
{
    public partial class Favorites : System.Web.UI.Page
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
                BindFavoriteProducts();
            }
        }

        private void BindFavoriteProducts()
        {
            List<string> favoriteIds = Session["Favorites"] as List<string>;
            if (favoriteIds == null || favoriteIds.Count == 0)
            {
                pnlEmptyFavorites.Visible = true; 
                rptFavorites.Visible = false;
                return;
            }


            pnlEmptyFavorites.Visible = false;
            rptFavorites.Visible = true;

            var allProducts = (List<Products>)Application["AllProducts"];
            var favoriteProductsList = new List<object>();

            foreach (string uniqueId in favoriteIds)
            {
                string[] parts = uniqueId.Split('-');
                string category = parts[0];
                int id = Convert.ToInt32(parts[1]);

                Products foundProduct = allProducts.FirstOrDefault(p => p.ProductID == id && p.Gender == category);

                if (foundProduct != null)
                {

                    favoriteProductsList.Add(new
                    {
                        foundProduct.ProductID,
                        foundProduct.Name,
                        foundProduct.Price,
                        foundProduct.ImageUrl,
                        foundProduct.Sale,
                        foundProduct.ProductUrl,
                        uniqueId = uniqueId 
                    });
                }
            }

            rptFavorites.DataSource = favoriteProductsList;
            rptFavorites.DataBind();
        }

        public string GetPriceDisplay(object dataItem)
        {
            decimal price = (decimal)DataBinder.Eval(dataItem, "Price");
            int sale = (int)DataBinder.Eval(dataItem, "Sale");

            if (sale > 0)
            {
                decimal newPrice = price * (1 - (decimal)sale / 100);
                string oldPriceHtml = $"<span class='old-price'>${price:F2}</span>";
                string newPriceHtml = $"<span class='new-price'>${newPrice:F2}</span>";
                return $"<div class='price-container'>{oldPriceHtml} {newPriceHtml}</div>";
            }
            else
            {
                return $"<div class='product_price'>${price:F2}</div>";
            }
        }

        protected void btnRemoveFavorite_Click(object sender, EventArgs e)
        {
            string uniqueIdToRemove = ((LinkButton)sender).CommandArgument;
            List<string> favorites = Session["Favorites"] as List<string>;

            if (favorites != null)
            {
                favorites.Remove(uniqueIdToRemove);
                Session["Favorites"] = favorites;
            }

            BindFavoriteProducts();
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {

            string uniqueId = ((Button)sender).CommandArgument;

            string[] parts = uniqueId.Split('-');
            string category = parts[0];
            int id = Convert.ToInt32(parts[1]);

            var allProducts = (List<Products>)Application["AllProducts"];
            Products foundProduct = allProducts.FirstOrDefault(p => p.ProductID == id && p.Gender == category);

            if (foundProduct != null)
            {
                Response.Redirect(ResolveUrl(foundProduct.ProductUrl));
            }
        }


        protected void search_button_Click(object sender, EventArgs e)
        {
            
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
        }

        protected void lnkCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Cart.aspx");
        }

        protected void SUBSCRIBE_btn_Click(object sender, EventArgs e)
        {
        }
    }
}