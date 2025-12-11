<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Trangchu.aspx.cs" Inherits="BTL_LapTrinhWeb.Trangchu" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="~/Assets/css/Trangchu.css" runat="server" />
    <title>IT Shoes</title>
</head>
<body>
    <form id="form1" runat="server">
        <header class="header_container">
            <div class="header_place">
                <div class="search_place">
                    <asp:TextBox ID="txtSearch" runat="server" placeholder="Search Products" CssClass="search_box" />
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

        <main>
            <div class="banner_sale">
                <a>Free standard delivery on orders over $30</a>
            </div>
            
            <section class="hero">
                <h4>NEW COLLECTION</h4>
                <h1>READY FOR SHOPPING</h1>
                <asp:Button ID="btnShopNowHero" CssClass="shop_button" runat="server" Text="SHOP NOW" OnClick="btnShopNowHero_Click" />
            </section>

            <section class="section">
                <div class="collection">
                    <div class="collection-img">
                        <img src='<%= ResolveUrl("~/Assets/images/Trangchu/sneakers_collection.png") %>' alt="Sneakers Collection" />
                    </div>
                    <div class="collection-text">
                        <h2>Men's Sneakers Collection</h2>
                        <p>Keep things comfy and trendy</p>
                        <asp:Button ID="btnShopSneakers" CssClass="shop_button" runat="server" Text="SHOP NOW" OnClick="btnShopNowSneaker_Click" />
                    </div>
                </div>
            </section>
            
            <section class="wholefamily">
                <h2>Shoes for the whole family</h2>
                <div class="shoes_whole_family">
                    <div class="item">
                        <img src='<%= ResolveUrl("~/Assets/images/Trangchu/women_shoes.png") %>' alt="Women Shoes" />
                        <asp:Button ID="btnWomen" CssClass="shop_button" runat="server" Text="WOMEN" OnClick="btnCategoryWomen_Click" CommandArgument="Women" />
                    </div>
                    <div class="item">
                        <img src='<%= ResolveUrl("~/Assets/images/Trangchu/men_shoes.png") %>' alt="Men Shoes" />
                        <asp:Button ID="btnMen" CssClass="shop_button" runat="server" Text="MEN" OnClick="btnCategoryMen_Click" CommandArgument="Men" />
                    </div>
                    <div class="item">
                        <img src='<%= ResolveUrl("~/Assets/images/Trangchu/kid_shoes.png") %>' alt="Kids Shoes" />
                        <asp:Button ID="btnKids" CssClass="shop_button" runat="server" Text="KIDS" OnClick="btnCategoryKids_Click" CommandArgument="Kids" />
                    </div>
                </div>
            </section>
            <%-- Thay đổi ở đây nha Hoài --%>
            <section class="section">
                <h2>Our Best Sellers</h2>
                <asp:Repeater ID="rptBestSellers" runat="server">
                    <HeaderTemplate>
                        <div class="products">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="product">
                            <asp:HyperLink runat="server" NavigateUrl='<%# Eval("ProductUrl") %>'>
                                 <img src='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>' alt='<%# Eval("Name") %>'>
                            </asp:HyperLink>
                            <p>
                                <asp:HyperLink runat="server" NavigateUrl='<%# Eval("ProductUrl") %>' CssClass="product-name-link">
                                     <%# Eval("Name") %>
                                </asp:HyperLink>
                            </p>
                            <p>$<%# Eval("Price", "{0:F2}") %></p>
                         </div>
                    </ItemTemplate>
                    <FooterTemplate>
                         </div>
                    </FooterTemplate>
                </asp:Repeater>
            </section>
            <%-- Tao bỏ Accessories rồi và đổi ảnh ở đây --%>
            <section class="final-sale">
                <h2>FINAL SALE</h2>
                <p>Up to 50% discount</p>
                <asp:Button ID="btnShopFinalSale" CssClass="shop_button" runat="server" Text="SHOP NOW" OnClick="btnShopNowSale_Click" />
            </section>
            <%-- Đổi nền ở đây --%>
            <section class="section-blog">
                <h2>Articles and Blogs</h2>
                <asp:Repeater ID="rptArticles" runat="server">
                    <HeaderTemplate>
                        <div class="articles">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="article">
                            <img src='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>' alt='<%# Eval("Title") %>'>
                            <div class="article-content">
                                <p class="title"><%# Eval("Title") %></p>
                                <asp:HyperLink NavigateUrl='<%# Eval("ArticleUrl") %>' runat="server">Read the story →</asp:HyperLink>
                            </div>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>
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