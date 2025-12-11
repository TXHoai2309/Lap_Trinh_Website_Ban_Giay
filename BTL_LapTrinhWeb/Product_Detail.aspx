<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product_Detail.aspx.cs" Inherits="BTL_LapTrinhWeb.Product_Detail" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Product detail</title>
    <link rel="stylesheet" href="~/Assets/css/Productdetail.css" />
</head>
<body>
    <form id="form1" runat="server">
        <header class="header_container">
            <div class="header_place">
                <div class="search_place">
                    <asp:TextBox ID="search_box" runat="server" placeholder="Search Products" CssClass="search_box" />
                    <asp:ImageButton ID="search_button" runat="server" ImageUrl="~/Assets/images/Chung/kinhlup.png" alt="Search Icon" OnClick="search_button_Click" CssClass="search_button" />
                </div>
                <a href="Trangchu.aspx" class="logo_place">
                    <b id="first_logo">IT</b><b id="last_logo"> Shoes</b>
                </a>
                <div class="user_actions">
                    <div class="account">
                        <asp:Image ID="imgAccount" runat="server" ImageUrl="~/Assets/images/Chung/account.png" alt="Account Icon" />
                        <asp:LinkButton ID="lnkSignIn" runat="server" Text="Sign in" OnClick="lnkSignIn_Click" />
                    </div>
                    <div class="favorites">
                        <asp:Image ID="imgFavorites" runat="server" ImageUrl="~/Assets/images/Chung/icon_favorite.png" alt="Favorites Icon" />
                        <asp:LinkButton ID="lnkFavorites" runat="server" Text="Favorites" OnClick="lnkFavorites_Click" />
                    </div>
                    <div class="cart">
                        <asp:Image ID="imgCart" runat="server" ImageUrl="~/Assets/images/Chung/giohang.png" alt="Cart Icon" />
                        <asp:LinkButton ID="lnkCart" runat="server" Text="Cart" OnClick="lnkCart_Click" />
                    </div>
                </div>
            </div>
            <nav class="menu">
                <ul id="menu_list">
                    <li><a href='<%= ResolveUrl("~/Men.aspx") %>' class="menu_item">Men</a></li>
                    <li><a href='<%= ResolveUrl("~/Women.aspx") %>' class="menu_item">Women</a></li>
                    <li><a href='<%= ResolveUrl("~/Kids.aspx") %>' class="menu_item">Kids</a></li>
                    <li><a href='<%= ResolveUrl("~/Sale.aspx") %>' class="menu_item">Sale</a></li>
                </ul>
            </nav>
        </header>
        <div class="banner_sale">
            <a>Free standard delivery on orders over $30</a>
        </div>
        <div class="change_page">
            <asp:Literal ID="litBreadcrumb" runat="server"></asp:Literal>
        </div>
        <div class="Detail_container">

            <div class="image_main">

                <div class="main_image_wrapper">
                    <asp:ImageButton ID="btnFavoriteIcon" runat="server" CssClass="favorite_icon" OnClick="btnAddToFavorites_Click" />
                    <img id="main_image" runat="server" alt="Product Image" class="main_image" />
                </div>

                <div class="thumbnail_container">
                    <img id="imgThumbnailMain" runat="server" alt="Product Main View" />
                    <img id="imgThumbnailBack" runat="server" alt="Product Back View" />
                    <img id="imgThumbnailLeft" runat="server" alt="Product Left View" />
                    <img id="imgThumbnailTop" runat="server" alt="Product Top View" />
                    <img id="imgThumbnailUnder" runat="server" alt="Product Under View" />
                </div>
            </div>
            <div class="product_info">
                <h2 id="product_name" runat="server" class="product_name"></h2>
                <p id="product_sale_percent" runat="server" class="sale_percent_detail" visible="false"></p>
                <p id="product_price" runat="server" class="product_price"></p>
                <p class="product_rating">
                    <span class="star">★</span>
                    <span id="rating_value" runat="server"></span>
                    <a href="#reviews">Reviews (<asp:Label ID="lblReviewCount" runat="server" />)</a>
                </p>

                <div class="size_selection">
                    <label for="size">Size:</label>
                    <asp:DropDownList ID="ddlSize" runat="server">
                        <asp:ListItem Text="Choose your size" Value="" />
                        <asp:ListItem Text="36" Value="36" />
                        <asp:ListItem Text="37" Value="37" />
                        <asp:ListItem Text="38" Value="38" />
                        <asp:ListItem Text="39" Value="39" />
                        <asp:ListItem Text="40" Value="40" />
                        <asp:ListItem Text="41" Value="41" />
                        <asp:ListItem Text="42" Value="42" />
                        <asp:ListItem Text="43" Value="43" />
                        <asp:ListItem Text="44" Value="44" />
                    </asp:DropDownList>
                    <asp:Label ID="lblSizeError" runat="server" CssClass="error-label" ForeColor="Red"></asp:Label>
                </div>
                <div class="quantity_selection">
                    <label for="quantity">Quantity:</label>
                    <asp:TextBox ID="txtQuantity" runat="server" Text="1" />
                    <asp:Label ID="lblQuantityError" runat="server" CssClass="error-label" ForeColor="Red"></asp:Label>
                </div>
                <div class="button_group">
                    <asp:Button ID="btnBuyAndCheckOut" runat="server" Text="BUY AND CHECK OUT" CssClass="buy_and_Check_Out_button" OnClick="BuyAndCheckOut_Click" />
                    <asp:Button ID="btnAddToBag" runat="server" Text="ADD TO BAG" CssClass="add_to_bag_button" OnClick="AddToBag_Click" />
                </div>
                <asp:Label ID="lblAddToBagMessage" runat="server" CssClass="success-message" Visible="false"></asp:Label>
            </div>
        </div>
        <div class="product_description_container">
            <h4>Description</h4>
            <p id="product_description" runat="server" class="product_description_text"></p>
        </div>
        <div class="similar_products_container">
            <h3>You Might Also Like</h3>
            <div class="product_frame">
                <asp:Repeater ID="rptSimilarProducts" runat="server">
                    <HeaderTemplate>
                        <ul class="product_list">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li data-category='<%# Eval("Category") %>'>
                            <div class="product_item">
                                <div class="product_top">
                                    <%# (int)Eval("Sale") > 0 ? $"<div class='sale-ribbon'>-{(int)Eval("Sale")}%</div>" : "" %>
                                    <asp:HyperLink runat="server" CssClass="product_img" NavigateUrl='<%# Eval("ProductUrl") %>'>
                                                <asp:Image runat="server" ImageUrl='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>' AlternateText='<%# Eval("Name") %>' />
                                    </asp:HyperLink>
                                    <asp:ImageButton runat="server" CssClass="favorite_icon_similar"
                                        CommandArgument='<%# Eval("ProductID") %>' OnClick="btnAddToFavorites_Click"
                                        ImageUrl='<%# IsFavorite(Eval("ProductID").ToString(), Eval("Gender").ToString()) ? "~/Assets/images/Chung/icon_favorite_green.png" : "~/Assets/images/Chung/icon_favorite.png" %>' />
                                </div>
                                <div class="product_info">
                                    <asp:HyperLink runat="server" CssClass="product_name" NavigateUrl='<%# Eval("ProductUrl") %>' Text='<%# Eval("Name") %>'></asp:HyperLink><br />
                                    <%# GetPriceDisplay(Container.DataItem) %>
                                </div>
                            </div>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
        <!-- Hoài sưả -->
        <!-- ======================= PHẦN REVIEW ======================= -->
        <section class="product-reviews-section" id="reviews">
            <h2 class="review-title">Customer Reviews for 
        <span id="review_product_name" runat="server" class="review-product-name"></span>
            </h2>
            <hr class="divider" />

            <!-- ===== FORM THÊM/SỬA BÌNH LUẬN ===== -->
            <asp:Panel ID="pnlAddReview" runat="server" Visible="false" CssClass="review-form">
                <h3 class="form-header">
                    <asp:Label ID="lblFormTitle" runat="server" Text="Write a Review" />
                </h3>

                <!-- Chọn số sao -->
                <div class="form-group">
                    <label class="label-rating">Your Rating:</label>
                    <asp:DropDownList ID="ddlRating" runat="server" CssClass="rating-dropdown">
                        <asp:ListItem Text="Select rating" Value="0" />
                        <asp:ListItem Text="★☆☆☆☆ (1)" Value="1" />
                        <asp:ListItem Text="★★☆☆☆ (2)" Value="2" />
                        <asp:ListItem Text="★★★☆☆ (3)" Value="3" />
                        <asp:ListItem Text="★★★★☆ (4)" Value="4" />
                        <asp:ListItem Text="★★★★★ (5)" Value="5" />
                    </asp:DropDownList>
                </div>

                <!-- Nội dung bình luận -->
                <div class="form-group">
                    <label class="label-comment">Your Comment:</label><br />
                    <asp:TextBox ID="txtReview" runat="server" TextMode="MultiLine"
                        CssClass="review-textbox" Rows="4" Columns="60"></asp:TextBox>
                </div>

                <div class="form-actions">
                    <asp:Button ID="btnSubmitReview" runat="server" Text="Submit Review"
                        CssClass="btn btn-primary" OnClick="btnSubmitReview_Click" />
                    <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel"
                        CssClass="btn btn-secondary" Visible="false" OnClick="btnCancelEdit_Click" />
                </div>
            </asp:Panel>

            <hr class="divider" />

            <!-- ===== DANH SÁCH REVIEW ===== -->
            <asp:Label ID="lblNoReview" runat="server"
                Text="No reviews yet. Be the first to share your thoughts!"
                Visible="false" CssClass="no-review"></asp:Label>

            <asp:Repeater ID="rptReviews" runat="server" OnItemCommand="rptReviews_ItemCommand">
                <HeaderTemplate>
                    <div class="review-list">
                </HeaderTemplate>

                <ItemTemplate>
                    <div class="review-card">
                        <div class="review-avatar">
                            <img src="/Assets/images/Chung/user_avatar.png" alt="User" />
                        </div>

                        <div class="review-body">
                            <div class="review-header">
                                <span class="review-author"><%# Eval("Author") %></span>
                                <span class="review-rating" style="color: #f9ca24;">
                                    <%# new string('★', Convert.ToInt32(Eval("Rating"))) %>
                                </span>
                            </div>

                            <p class="review-content"><%# Eval("Content") %></p>
                            <div class="review-footer">
                                <span class="review-date"><%# Eval("DatePosted") %></span>

                                <!-- Chỉ người viết mới thấy -->
                                <asp:Panel ID="pnlActions" runat="server"
                                    Visible='<%# (bool)Eval("CanEdit") %>'
                                    CssClass="review-actions">
                                    <asp:LinkButton ID="btnEdit" runat="server"
                                        CommandName="EditReview"
                                        CommandArgument='<%# Eval("ReviewId") %>'
                                        CssClass="action-btn edit">Edit</asp:LinkButton>

                                    <asp:LinkButton ID="btnDelete" runat="server"
                                        CommandName="DeleteReview"
                                        CommandArgument='<%# Eval("ReviewId") %>'
                                        CssClass="action-btn delete"
                                        OnClientClick="return confirm('Are you sure to delete this review?');">
                                Delete
                                    </asp:LinkButton>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>

                <FooterTemplate></div></FooterTemplate>
            </asp:Repeater>
        </section>
        <!-- =================== HẾT PHẦN REVIEW =================== -->



        <footer class="footer_container">
            <div class="shop_menu">
                <p><b>SHOP</b></p>
                <p><a href='<%= ResolveUrl("~/Trangchu.aspx") %>' class="menu_item">Home</a></p>
                <p><a href='<%= ResolveUrl("~/Women.aspx") %>' class="menu_item">Women</a></p>
                <p><a href='<%= ResolveUrl("~/Men.aspx") %>' class="menu_item">Men</a></p>
                <p><a href='<%= ResolveUrl("~/Kids.aspx") %>' class="menu_item">Kids</a></p>
                <p><a href='<%= ResolveUrl("~/Sale.aspx") %>' class="menu_item">Sale</a></p>
            </div>
            <div class="custom_service_menu">
                <p><b>CUSTOM SERVICE</b></p>
                <p><a href="#" class="menu_item">FAQ</a></p>
                <p><a href="#" class="menu_item">Contact Us</a></p>
                <p><a href="#" class="menu_item">My Account</a></p>
            </div>
            <div class="other_menu">
                <p><b>OTHERS</b></p>
                <p><a href="#" class="menu_item">Articles</a></p>
            </div>
            <div class="icon_menu_container">
                <div class="icon_menu">
                    <img src='<%= ResolveUrl("~/Assets/images/Chung/facebook.png") %>' alt="Facebook" />
                    <img src='<%= ResolveUrl("~/Assets/images/Chung/X.png") %>' alt="Twitter" />
                    <img src='<%= ResolveUrl("~/Assets/images/Chung/insta.png") %>' alt="Instagram" />
                    <img id="youtube" src='<%= ResolveUrl("~/Assets/images/Chung/youtube.png") %>' alt="Youtube" />
                </div>
                <div class="text">
                    <p><b>SUBSCRIBE TO OUR NEWSLETTER</b></p>
                    <p>Get 10% discount on your next order!</p>
                </div>
                <div>
                    <asp:TextBox ID="email_input" runat="server" placeholder="Email" CssClass="email_input" TextMode="Email"></asp:TextBox>
                    <asp:Button ID="SUBSCRIBE_btn" runat="server" Text="SUBSCRIBE" CssClass="SUBSCRIBE_btn" OnClick="SUBSCRIBE_btn_Click" />
                </div>
            </div>
        </footer>
    </form>
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {

            const mainImage = document.getElementById('<%= main_image.ClientID %>');

            const thumbnails = document.querySelectorAll('.thumbnail_image');

            thumbnails.forEach(function (thumbnail) {
                thumbnail.addEventListener('click', function () {

                    mainImage.src = this.src;

                    thumbnails.forEach(t => t.classList.remove('active-thumbnail'));

                    this.classList.add('active-thumbnail');
                });
            });
        });
        function showToast(message) {
            var toast = document.getElementById("toast");
            toast.textContent = message;
            toast.classList.add("show");
            setTimeout(function () {
                toast.classList.remove("show");
            }, 3000);
        }
    </script>
</body>
</html>
