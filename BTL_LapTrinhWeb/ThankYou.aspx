<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThankYou.aspx.cs" Inherits="BTL_LapTrinhWeb.ThankYou" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Order Confirmation</title>
    <link rel="stylesheet" href="~/Assets/css/ThankYou.css" />
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
        <div class="thankyou-container">
            <h2>🎉 Thank You for Your Order!</h2>
            <p>Your order has been successfully placed. Below are your order details:</p>

            <div class="order-details">
                <h3>Customer Information</h3>
                <p><b>Order Code:</b>
                    <asp:Label ID="lblOrderCode" runat="server" /></p>
                <p><b>Full Name:</b>
                    <asp:Label ID="lblFullName" runat="server" /></p>
                <p><b>Email:</b>
                    <asp:Label ID="lblEmail" runat="server" /></p>
                <p><b>Phone:</b>
                    <asp:Label ID="lblPhone" runat="server" /></p>
                <p><b>Address:</b>
                    <asp:Label ID="lblAddress" runat="server" /></p>
                <p><b>City:</b>
                    <asp:Label ID="lblCity" runat="server" /></p>
                <p><b>Postal Code:</b>
                    <asp:Label ID="lblPostal" runat="server" /></p>
                <p><b>Payment Method:</b>
                    <asp:Label ID="lblPayment" runat="server" /></p>


                <h3>Order Summary</h3>
                <asp:Repeater ID="rptOrderItems" runat="server">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <th>Product</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Total</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("Name") %></td>
                            <td><%# Eval("Quantity") %></td>
                            <td>$<%# Eval("Price", "{0:F2}") %></td>
                            <td>$<%# Eval("LineTotal", "{0:F2}") %></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>


                <h3 class="grand-total">Grand Total: 
                    <asp:Label ID="lblGrandTotal" runat="server" CssClass="highlight"></asp:Label>
                </h3>
            </div>

            <div class="btn-group">
                <asp:Button ID="btnHome" runat="server" Text="🏠 Back to Home" CssClass="btn-home" OnClick="btnHome_Click" />
            </div>
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
