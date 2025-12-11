<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="BTL_LapTrinhWeb.Cart" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="~/Assets/css/Cart.css" runat="server" />
    
    <title>Shopping Bag</title>
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
        <div class="banner_sale">
            <a>Free standard delivery on orders over $30</a>
        </div>
        <main class="cart-container">
            <h1>SHOPPING BAG</h1>

            <div class="cart-layout">
                <div class="cart-items-column">
                    <div class="cart-header">
                        <span>Product Info</span>
                        <span>Subtotal</span>
                    </div>

                    <asp:Repeater ID="rptCartItems" runat="server" OnItemCommand="rptCartItems_ItemCommand" OnItemDataBound="rptCartItems_ItemDataBound">
                        <ItemTemplate>
                            <div class="cart-item">
                                <div class="product-main">
                                    <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>' />
                                    <div class="product-info">
                                        <h4><%# Eval("Name") %></h4>
                                        
                                        <p>Price: $<%# Eval("Price", "{0:F2}") %></p>
                                        <asp:Literal ID="litSaleInfo" runat="server" Visible="false" />
                                        <p>ProductID: <%# Eval("ProductNumber") %></p>
                                        <p>Quantity: <%# Eval("Quantity") %></p>
                                        <p>Size: <%# Eval("Size") %></p>
                                        
                                    </div>
                                </div>
                                <div class="product-subtotal">
                                    <span>$<%# Eval("LineTotal", "{0:F2}") %></span>
                                    
                                    <asp:ImageButton ID="btnDelete" runat="server" 
                                        ImageUrl="~/Assets/images/Chung/icon_delete.png" 
                                        alt="Delete" 
                                        CssClass="delete-button" 
                                        CommandName="Delete" 
                                        CommandArgument='<%# Eval("ProductNumber") %>' />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    
                    <asp:Panel ID="pnlEmptyCart" runat="server" Visible="false" CssClass="empty-cart-message">
                        <p>Your shopping bag is empty.</p>
                        <asp:Button ID="btnContinueShopping" runat="server" Text="Continue Shopping" CssClass="shop-button" OnClick="btnContinueShopping_Click" />
                    </asp:Panel>

                </div>

                <div class="cart-summary-column">
                    <div class="summary-box">
                        <div class="summary-line">
                            <span>Total Purchase</span>
                            <asp:Literal ID="litTotalPurchase" runat="server" Text="$ 0.00" />
                        </div>
                        <div class="summary-line">
                            <span>Delivery</span>
                            <asp:Literal ID="litDelivery" runat="server" Text="FREE" />
                        </div>
                        <hr />
                        <div class="summary-line grand-total">
                            <span>Grand Total</span>
                            <asp:Literal ID="litGrandTotal" runat="server" Text="$ 0.00" />
                        </div>

                        <asp:Button ID="btnSecureCheckout" runat="server" Text="SECURE CHECKOUT" CssClass="checkout-button" OnClick="btnSecureCheckout_Click" />
                        
                    </div>
                </div>

            </div>
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