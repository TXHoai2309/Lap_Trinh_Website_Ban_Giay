<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Favorites.aspx.cs" Inherits="BTL_LapTrinhWeb.Favorites" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>My Favorites</title>
    <link rel="stylesheet" href="~/Assets/css/Products.css" />
    <link href="~/Assets/css/Favorites.css" rel="stylesheet" />
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

        <div class="favorites-container">
            <div class="breadcrumb">
                <asp:HyperLink runat="server" NavigateUrl="~/Trangchu.aspx">Home</asp:HyperLink>
                > My Favorites
            </div>

            <h1 class="favorites-header">My Favorites</h1>

            <asp:Panel ID="pnlEmptyFavorites" runat="server" Visible="false" CssClass="empty-favorites">
                <h2>You have no favorite items yet.</h2>
                <asp:HyperLink ID="lnkContinueShopping" runat="server" NavigateUrl="~/Trangchu.aspx" CssClass="btn-shopping">
                    Continue Shopping
                </asp:HyperLink>
            </asp:Panel>

            <asp:Repeater ID="rptFavorites" runat="server">
                <HeaderTemplate>
                    <ul class="product_list">
                </HeaderTemplate>
                <ItemTemplate>
                    <li>
                        <div class="favorite_item">
                            <div>
                                <div class="product_img_container">
                                    <%# (int)Eval("Sale") > 0 ? $"<div class='sale-ribbon'>-{(int)Eval("Sale")}%</div>" : "" %>
                                    <asp:Image runat="server" ImageUrl='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>' />
                                </div>
                                <div class="product_info">
                                    <asp:HyperLink runat="server" CssClass="product_name" Text='<%# Eval("Name") %>'></asp:HyperLink>
                                    <%# GetPriceDisplay(Container.DataItem) %>
                                </div>
                            </div>
                            <div class="favorite_actions">
                                <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CssClass="btn btn-add-to-cart" OnClick="btnAddToCart_Click" CommandArgument='<%# Eval("uniqueId") %>' />
                                <asp:LinkButton ID="btnRemove" runat="server" Text="Remove" CssClass="btn btn-remove" OnClick="btnRemoveFavorite_Click" CommandArgument='<%# Eval("uniqueId") %>' />
                            </div>
                        </div>
                    </li>
                </ItemTemplate>
                <FooterTemplate>
                    </ul>
                </FooterTemplate>
            </asp:Repeater>
        </div>
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
</body>
</html>
