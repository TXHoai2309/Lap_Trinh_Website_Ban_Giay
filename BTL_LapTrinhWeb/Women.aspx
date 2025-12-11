<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Women.aspx.cs" Inherits="BTL_LapTrinhWeb.Women" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Women's Shoes</title>
    <link rel="stylesheet" href="~/Assets/css/Products.css" />
</head>
<body>
    <form id="form1" runat="server">
        <header class="header_container">
            <div class="header_place">
                <div class="search_place">
                    <asp:TextBox ID="txtSearch" runat="server" placeholder="Search Products" CssClass="search_box" />
                    <asp:ImageButton ID="btnSearch" runat="server" ImageUrl="~/Assets/images/Chung/kinhlup.png" alt="Search Icon" OnClick="btnSearch_Click" CssClass="search_button" />
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
                    <li><a href='#' class="menu_item">Women</a></li>
                    <li><a href='<%= ResolveUrl("~/Kids.aspx") %>' class="menu_item">Kids</a></li>
                    <li><a href="<%= ResolveUrl("~/Sale.aspx") %>" class="menu_item">Sale</a></li>
                </ul>
            </nav>
        </header>
        <div class="banner_sale">
            <a>Free standard delivery on orders over $30</a>
        </div>
        <main class="product">
            <aside class="product_user_actions">
                <div class="change_page">
                    <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/Trangchu.aspx">Home</asp:HyperLink>
                    <a>> </a><a>Women</a>
                </div>
                <hr />
                <div class="shop_by_item">
                    <b>Shop by item</b>
                    <ul>
                        <li class="type_shoes">
                            <asp:LinkButton ID="btnAll" runat="server" Text="All" OnClick="btnCategory_Click" CommandArgument="All" /></li>
                        <li class="type_shoes">
                            <asp:LinkButton ID="btnSneakers" runat="server" Text="Sneakers" OnClick="btnCategory_Click" CommandArgument="Sneakers" /></li>
                        <li class="type_shoes">
                            <asp:LinkButton ID="btnBoots" runat="server" Text="Boots" OnClick="btnCategory_Click" CommandArgument="Boots" /></li>
                        <li class="type_shoes">
                            <asp:LinkButton ID="btnSports" runat="server" Text="Sports" OnClick="btnCategory_Click" CommandArgument="Sports" /></li>
                        <li class="type_shoes">
                            <asp:LinkButton ID="btnLifestyles" runat="server" Text="Lifestyles/Casual" OnClick="btnCategory_Click" CommandArgument="Lifestyles/Casual" /></li>
                    </ul>
                </div>
            </aside>
            <section class="product_container">
                <div class="sort_filter">
                    <div class="sort">
                        <b>Sort by</b>
                        <asp:DropDownList ID="ddlSort" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSortFilter_SelectedIndexChanged" CssClass="dropdown-style">
                            <asp:ListItem Value="default">Default</asp:ListItem>
                            <asp:ListItem Value="name_asc">Name: A - Z</asp:ListItem>
                            <asp:ListItem Value="name_desc">Name: Z - A</asp:ListItem>
                            <asp:ListItem Value="price_asc">Price: Low → High</asp:ListItem>
                            <asp:ListItem Value="price_desc">Price: High → Low</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="filter">
                        <b>Filter by Price</b>
                        <asp:DropDownList ID="ddlFilter" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSortFilter_SelectedIndexChanged" CssClass="dropdown-style">
                            <asp:ListItem Value="all">All Prices</asp:ListItem>
                            <asp:ListItem Value="lt100">Less than $100</asp:ListItem>
                            <asp:ListItem Value="100_500">$100 - $500</asp:ListItem>
                            <asp:ListItem Value="gt500">More than $500</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="product_frame">
                    <asp:Repeater ID="rptProducts" runat="server">
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
                                        <asp:ImageButton runat="server" CssClass="favorite_icon"
                                            CommandArgument='<%# Eval("ProductID") %>' OnClick="btnAddToFavorites_Click"
                                            ImageUrl='<%# IsFavorite(Eval("ProductID").ToString(), "Women") ? "~/Assets/images/Chung/icon_favorite_green.png" : "~/Assets/images/Chung/icon_favorite.png" %>' />
                                        <asp:LinkButton runat="server" CssClass="buy_now" Text="Buy Now" CommandArgument='<%# Eval("ProductID") %>' OnClick="btnBuyNow_Click" />
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
            </section>
        </main>
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
