<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="BTL_LapTrinhWeb.MyAccount" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>My Account</title>
    <link rel="stylesheet" type="text/css" href="~/Assets/css/MyAccount.css" /> 
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
                    <li><a href="<%= ResolveUrl("~/Sale.aspx") %>" class="menu_item">Sale</a></li>
                </ul>
            </nav>
        </header>
        <div class="banner_sale">
            <a>Free standard delivery on orders over $30</a>
        </div>
        
        <main class="main_content">
        <%--body--%>    
        <h1>My Account</h1>
        <div class="info">
            <div class="user-left">
                <p>Hello <asp:Label ID="lblUserName" runat="server" Text=""></asp:Label>,</p>
            </div>
            <div class="user-right">
                <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="logout-btn" OnClick="btnLogout_Click" />
            </div>
        </div>

        <div class="tabs">
            <asp:Button ID="btnUpdateTab" runat="server" Text="Update Information" CssClass="tab-button active" OnClick="btnUpdateTab_Click"/>
            <asp:Button ID="btnOrderTab" runat="server" Text="Order History" CssClass="tab-button" OnClick="btnOrderTab_Click" />
        </div>
        <%--Update information--%>
         <div id="updateInfor" runat="server" class="tab-content">
            <h3>Delivery</h3>

            <div class="form-group">
                <div class="label-row">
                    <label for="txtAddress1" class="form-label">Street Address Line 1</label>
                    <asp:Label ID="lblAddress1Error" runat="server" CssClass="Error" />
                </div>
                <asp:TextBox ID="txtAddress1" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <div class="label-row">
                    <label for="txtAddress2" class="form-label">Street Address Line 2</label>
                    <asp:Label ID="lblAddress2Error" runat="server" CssClass="Error" />
                </div>
                <asp:TextBox ID="txtAddress2" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <div class="label-row">
                    <label for="txtPostal" class="form-label">Postal Code</label>
                    <asp:Label ID="lblPostalError" runat="server" CssClass="Error" />
                </div>
                <asp:TextBox ID="txtPostal" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <div class="label-row">
                    <label for="txtCity" class="form-label">Town / City</label>
                    <asp:Label ID="lblCityError" runat="server" CssClass="Error" />
                </div>
                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <div class="label-row">
                    <label for="txtCountry" class="form-label">Country</label>
                    <asp:Label ID="lblCountryError" runat="server" CssClass="Error" />
                </div>
                <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control" />
            </div>
             <div class="update-row">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="update-button" OnClick="btnUpdate_Click" OnClientClick="return validateForm();"/>
                <asp:Label ID="lblUpdateMessage" runat="server" Text="Cập nhật thành công!" CssClass="update-message" Visible="false"></asp:Label>
            </div>
        </div>

        <!-- Order History -->
        <div id="orderHistory" runat="server" class="tab-content" visible="false">
            <div class="order-table-container">
                <asp:Label ID="lblNoOrders" runat="server" ForeColor="Gray" />
                <asp:GridView ID="gvOrder" runat="server" AutoGenerateColumns="False" CssClass="table" ShowHeaderWhenEmpty="true" EmptyDataText="Chưa có đơn nào được đặt">
                <Columns>
                    <asp:BoundField DataField="OrderNumber" HeaderText="Order-number" />
        
                    <asp:BoundField DataField="Date" HeaderText="Date" />
        
                    <asp:BoundField DataField="Items" HeaderText="Items" HtmlEncode="False" />
        
                    <asp:BoundField DataField="Total" HeaderText="Total" />
                </Columns>
                </asp:GridView>
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
    <script type="text/javascript">
        function validateForm() {
            var address1 = document.getElementById('<%= txtAddress1.ClientID %>').value.trim();
            var address2 = document.getElementById('<%= txtAddress2.ClientID %>').value.trim();
            var postal = document.getElementById('<%= txtPostal.ClientID %>').value.trim();
            var city = document.getElementById('<%= txtCity.ClientID %>').value.trim();
            var country = document.getElementById('<%= txtCountry.ClientID %>').value.trim();


            var lblAddress1Error = document.getElementById('<%= lblAddress1Error.ClientID %>');
            var lblAddress2Error = document.getElementById('<%= lblAddress2Error.ClientID %>');
            var lblPostalError = document.getElementById('<%= lblPostalError.ClientID %>');
            var lblCityError     = document.getElementById('<%= lblCityError.ClientID %>');
            var lblCountryError = document.getElementById('<%= lblCountryError.ClientID %>');

            lblAddress1Error.textContent = "";
            lblAddress2Error.textContent = "";
            lblPostalError.textContent = "";
            lblCityError.textContent = "";
            lblCountryError.textContent = "";

            var isValid = true;
            

            if (address1 === "") {
                lblAddress1Error.textContent = "Please enter Address Line 1.";
                isValid = false;
            }
            if (address2 === "") {
                lblAddress2Error.textContent = "Please enter Address Line 2.";
                isValid = false;
            }
            if (postal === "") {
                lblPostalError.textContent = "Please enter Postal Code.";
                isValid = false;
            }
            if (city === "") {
                lblCityError.textContent = "Please enter City.";
                isValid = false;
            }
            if (country === "") {
                lblCountryError.textContent = "Please enter Country.";
                isValid = false;
            }


            return isValid;

        }
    </script>
</body>
</html>

        <!-- Reviews -->