using BTL_LapTrinhWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace BTL_LapTrinhWeb
{
    public partial class Product_Detail : System.Web.UI.Page
    {
        private Products currentProduct;
        private List<Review> AllReviews
        {
            get
            {
                if (Application["AllReviews"] == null)
                    Application["AllReviews"] = new List<Review>();
                return (List<Review>)Application["AllReviews"];
            }
            set
            {
                Application["AllReviews"] = value;
            }
        }

        private int NextReviewId
        {
            get
            {
                if (Application["NextReviewId"] == null)
                    Application["NextReviewId"] = 1;
                return (int)Application["NextReviewId"];
            }
            set
            {
                Application["NextReviewId"] = value;
            }
        }

        private int editingReviewId
        {
            get
            {
                return (int)(Session["EditingReviewId"] ?? -1);
            }
            set
            {
                Session["EditingReviewId"] = value;
            }
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

            int id = 1;
            int.TryParse(Request.QueryString["id"], out id);

            List<Products> allProducts = Application["AllProducts"] as List<Products>;

            currentProduct = allProducts?.Find(p => p.ProductID == id);

            if (currentProduct != null)
            {
                if (!IsPostBack)
                {
                    product_name.InnerText = currentProduct.Name;
                    if (currentProduct.Sale > 0)
                    {
                        decimal newPrice = currentProduct.Price * (1 - (decimal)currentProduct.Sale / 100);
                        product_sale_percent.InnerText = $"-{currentProduct.Sale}%";
                        product_sale_percent.Visible = true;
                        string oldPriceHtml = $"<span class='old-price'>${currentProduct.Price:F2}</span>";
                        string newPriceHtml = $"<span class='new-price'>${newPrice:F2}</span>";
                        product_price.InnerHtml = $"<div class='price-container'>{oldPriceHtml} {newPriceHtml}</div>";
                    }
                    else
                    {
                        product_price.InnerHtml = $"<span class='new-price'>${currentProduct.Price:F2}</span>";
                    }
                    main_image.Src = ResolveUrl(currentProduct.ImageUrl.Replace("~", ""));

                    imgThumbnailMain.Src = ResolveUrl(currentProduct.ImageUrl ?? "");
                    imgThumbnailMain.Visible = !string.IsNullOrEmpty(currentProduct.ImageUrl);
                    imgThumbnailMain.Attributes["class"] = "thumbnail_image active-thumbnail";

                    imgThumbnailBack.Src = ResolveUrl(currentProduct.ImageBack ?? "");
                    imgThumbnailBack.Visible = !string.IsNullOrEmpty(currentProduct.ImageBack);
                    imgThumbnailBack.Attributes["class"] = "thumbnail_image";

                    imgThumbnailLeft.Src = ResolveUrl(currentProduct.ImageLeft ?? "");
                    imgThumbnailLeft.Visible = !string.IsNullOrEmpty(currentProduct.ImageLeft);
                    imgThumbnailLeft.Attributes["class"] = "thumbnail_image";

                    imgThumbnailTop.Src = ResolveUrl(currentProduct.ImageTop ?? "");
                    imgThumbnailTop.Visible = !string.IsNullOrEmpty(currentProduct.ImageTop);
                    imgThumbnailTop.Attributes["class"] = "thumbnail_image";

                    imgThumbnailUnder.Src = ResolveUrl(currentProduct.ImageUnder ?? "");
                    imgThumbnailUnder.Visible = !string.IsNullOrEmpty(currentProduct.ImageUnder);
                    imgThumbnailUnder.Attributes["class"] = "thumbnail_image";

                    review_product_name.InnerText = currentProduct.Name;
                    product_description.InnerText = currentProduct.Description;

                    List<Review> reviews = currentProduct.Reviews ?? new List<Review>();
                    rptReviews.DataSource = reviews;
                    rptReviews.DataBind();
                    lblReviewCount.Text = reviews.Count.ToString();
                    if (reviews.Count > 0)
                    {
                        double avgRating = reviews.Average(r => r.Rating);
                        rating_value.InnerText = $"{avgRating:0.0} / 5";
                    }
                    else
                    {
                        rating_value.InnerText = "0 / 5";
                    }
                    string type = currentProduct.Gender.ToLower();
                    string typeText = type == "men" ? "Men" : type == "women" ? "Women" : "Kids";
                    string typePage = type == "men" ? "Men.aspx" :
                                      type == "women" ? "Women.aspx" :
                                      "Kids.aspx";
                    litBreadcrumb.Text = $@"<a href='{ResolveUrl("~/Trangchu.aspx")}'>Home</a> <a>> </a> <a href='{ResolveUrl("~/" + typePage)}'>{typeText}</a> <a>> </a> <a class='breadcrumb_current'>{currentProduct.Name}</a>";
                    BindSimilarProducts();
                    CheckUserPermission();
                    LoadReviews();
                }

                bool isFav = IsFavorite(currentProduct.ProductID.ToString(), currentProduct.Gender);
                btnFavoriteIcon.ImageUrl = isFav ? "~/Assets/images/Chung/icon_favorite_green.png" : "~/Assets/images/Chung/icon_favorite.png";
                btnFavoriteIcon.CommandArgument = currentProduct.ProductID.ToString();
            }
            else if (!IsPostBack)
            {
                product_name.InnerText = "Product not found";
                product_price.InnerHtml = "";
            }
        }
        protected void BindSimilarProducts()
        {
            List<Products> allProducts = Application["AllProducts"] as List<Products>;
            if (allProducts == null || currentProduct == null) return;

            List<Products> similarProducts = allProducts
                .Where(p => p.Category == currentProduct.Category && p.ProductID != currentProduct.ProductID && p.Gender == currentProduct.Gender)
                .ToList();

            rptSimilarProducts.DataSource = similarProducts;
            rptSimilarProducts.DataBind();
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
                return $"<div class='price-container'><span class='new-price'>${product.Price:F2}</span></div>";
            }
        }
        public bool IsFavorite(string productId, string category)
        {
            string uniqueProductId = $"{category}-{productId}";
            List<string> favorites = Session["Favorites"] as List<string>;
            if (favorites == null) return false;
            return favorites.Contains(uniqueProductId);
        }
        private bool TryAddToCart()
        {
            lblSizeError.Text = "";
            lblQuantityError.Text = "";
            lblAddToBagMessage.Visible = false;

            if (Session["UserLoggedIn"] == null)
            {
                lblAddToBagMessage.Text = "Please log in to add items to your cart!";
                lblAddToBagMessage.CssClass = "error-message";
                lblAddToBagMessage.Visible = true;
                return false;
            }

            if (string.IsNullOrEmpty(ddlSize.SelectedValue))
            {
                lblSizeError.Text = "Please select a size!";
                return false;
            }

            int quantity;
            if (!int.TryParse(txtQuantity.Text, out quantity) || quantity <= 0)
            {
                lblQuantityError.Text = "Quantity must be greater than 0!";
                return false;
            }
            int size = int.Parse(ddlSize.SelectedValue);
            List<CartItem> cart = Session["ShoppingCart"] as List<CartItem> ?? new List<CartItem>();
            CartItem existingItem = cart.Find(item => item.ProductID == currentProduct.ProductID && item.Size == size);

            if (existingItem != null)
            {
                existingItem.Quantity += quantity;
            }
            else
            {
                cart.Add(new CartItem
                {
                    ProductID = currentProduct.ProductID,
                    Name = currentProduct.Name,
                    Price = currentProduct.Price,
                    Sale = currentProduct.Sale,
                    ProductNumber = currentProduct.ProductID.ToString(),
                    Size = size,
                    Quantity = quantity,
                    ImageUrl = currentProduct.ImageUrl
                });
            }

            Session["ShoppingCart"] = cart;

            lblAddToBagMessage.Text = "Added to cart successfully!";
            lblAddToBagMessage.CssClass = "success-message";
            lblAddToBagMessage.Visible = true;
            return true;
        }

        protected void btnAddToFavorites_Click(object sender, EventArgs e)
        {
            string productId = ((ImageButton)sender).CommandArgument;

            string productCategory = currentProduct.Gender;

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

            Response.Redirect(Request.RawUrl);
        }

        protected void BuyAndCheckOut_Click(object sender, EventArgs e)
        {
            if (TryAddToCart())
            {
                Response.Redirect("~/Checkout.aspx");
            }
        }

        protected void AddToBag_Click(object sender, EventArgs e)
        {
            TryAddToCart();
        }
        protected void search_button_Click(object sender, EventArgs e) { }
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
        protected void lnkMyAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MyAccount.aspx");
        }

        void CheckUserPermission()
        {
            var user = Session["UserLoggedIn"] as User;

            if (UserHasBoughtProduct(user))
            {
                pnlAddReview.Visible = true;
                lblFormTitle.Text = "Write a Review";
                lblNoReview.Visible = false;
            }
            else
            {
                pnlAddReview.Visible = false;
                lblNoReview.Visible = true;

                if (user == null)
                    lblNoReview.Text = "Please log in to write a review.";
                else
                    lblNoReview.Text = "You can only review products you have purchased.";
            }
        }

        bool UserHasBoughtProduct(User user)
        {
            if (user == null) return false;

            List<Order> orderHistory = Application["OrderHistory"] as List<Order>;
            if (orderHistory == null || orderHistory.Count == 0)
                return false;

            int productId = 0;
            int.TryParse(Request.QueryString["id"], out productId);

            bool hasBought = orderHistory.Any(o =>
                o.UserName.Equals(user.Name, StringComparison.OrdinalIgnoreCase)
                && o.Items.Any(i => i.ProductID == productId)
            );

            return hasBought;
        }

        void LoadReviews()
        {
            int productId = int.Parse(Request.QueryString["id"]);
            var user = Session["UserLoggedIn"] as User;

            var productReviews = AllReviews.Where(r => r.ProductID == productId).ToList();

            // ✅ Gán quyền sửa/xóa chỉ cho người viết comment đó
            foreach (var r in productReviews)
                r.CanEdit = user != null && r.Author == user.Username;

            rptReviews.DataSource = productReviews;
            rptReviews.DataBind();

            lblNoReview.Visible = productReviews.Count == 0;
        }
        protected void btnSubmitReview_Click(object sender, EventArgs e)
        {
            var user = Session["UserLoggedIn"] as User;
            if (user == null) return;

            if (!UserHasBoughtProduct(user))
            {
                lblNoReview.Text = "You can only review this product if you have purchased it.";
                lblNoReview.Visible = true;
                return;
            }


            bool hasPurchased = Session["HasPurchased"] != null && (bool)Session["HasPurchased"];
            if (!hasPurchased)
            {
                lblNoReview.Text = "You must purchase a product before leaving a review.";
                lblNoReview.Visible = true;
                return;
            }


            int productId = int.Parse(Request.QueryString["id"]);
            var reviews = AllReviews;

            int rating = 1;
            int.TryParse(ddlRating.SelectedValue, out rating);

            if (editingReviewId == -1)
            {
                reviews.Add(new Review
                {
                    ReviewId = NextReviewId++,
                    ProductID = productId,
                    Author = user.Username,
                    Rating = rating,
                    Content = txtReview.Text.Trim(),
                    DatePosted = DateTime.Now.ToString("dd/MM/yyyy HH:mm")
                });
                Application["NextReviewId"] = NextReviewId;
            }
            else
            {
                var existing = reviews.FirstOrDefault(r => r.ReviewId == editingReviewId);
                if (existing != null && existing.Author == user.Username)
                {
                    existing.Rating = rating;
                    existing.Content = txtReview.Text.Trim();
                    existing.DatePosted = DateTime.Now.ToString("dd/MM/yyyy HH:mm (edited)");
                }

                editingReviewId = -1;
                btnCancelEdit.Visible = false;
                btnSubmitReview.Text = "Submit Review";
                lblFormTitle.Text = "Write a Review";
            }

            AllReviews = reviews;
            txtReview.Text = "";
            ddlRating.SelectedIndex = 0;
            LoadReviews();
        }



        protected void rptReviews_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            var user = Session["UserLoggedIn"] as User;
            var reviews = AllReviews;

            if (e.CommandName == "DeleteReview")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                var r = reviews.FirstOrDefault(x => x.ReviewId == id);
                if (r != null && user != null && r.Author == user.Username)
                    reviews.Remove(r);

                AllReviews = reviews;
                LoadReviews();
            }
            else if (e.CommandName == "EditReview")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                var r = AllReviews.FirstOrDefault(x => x.ReviewId == id);

                if (r != null && user != null && r.Author == user.Username)
                {
                    editingReviewId = id;
                    pnlAddReview.Visible = true;
                    ddlRating.SelectedValue = r.Rating.ToString();
                    txtReview.Text = r.Content;
                    btnSubmitReview.Text = "Update Review";
                    btnCancelEdit.Visible = true;
                    lblFormTitle.Text = "Edit Your Review";
                }
            }
        }

        protected void btnCancelEdit_Click(object sender, EventArgs e)
        {
            editingReviewId = -1;
            txtReview.Text = "";
            ddlRating.ClearSelection();
            btnSubmitReview.Text = "Submit Review";
            btnCancelEdit.Visible = false;
            lblFormTitle.Text = "Write a Review";
        }


    }
}