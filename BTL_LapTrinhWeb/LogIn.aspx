<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="BTL_LapTrinhWeb.LogIn" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server"> 
    <%-- Cho phép bạn có thể điều khiển các thẻ trong head từ C# --%>
    <meta charset="UTF-8" />
    <%-- Dảm bảo các ký tự được hiển thị chính xác --%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <%-- Giúp trang web hiển thị tốt tren thiết bị bị động (reponsive --%>
    <link rel="stylesheet" href="~/Assets/css/SignIn.css" />
    <title>Log In</title>
</head>
<body>
    <form id="form1" runat="server">
        <%-- header --%>
        <%-- Đây là phần đầu trang và thanh điều hướng chúng của website. Nó chứa logo, thanh tìm kiếm(asp:Textbox ID-"..." --%>
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
            <%-- Đây là 1 đoạn mã C# ngắn, đảm bảo rằng đường dẫn đến các trang luôn chính xác, bất kể trang Login đang ở đâu --%>
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
        <h2>Log In</h2>
        <div class="bieumau">
            <div class="inner-group">
                <div class="label-error-container">
                    <label class="form-label">UserName</label>
                    <asp:Label ID="lblTenDangNhapError" runat="server" CssClass="messageError" ForeColor="Red"></asp:Label>
                </div>
                <asp:TextBox ID="txtTenDangNhap" runat="server" CssClass="form-input" placeholder="Enter UserName"></asp:TextBox>
            </div>

            <div class="inner-group">
                <div class="label-error-container">
                    <label class="form-label">Password</label>
                    <asp:Label ID="lblMatKhauError" runat="server" CssClass="messageError" ForeColor="Red"></asp:Label>
                </div>
                <asp:TextBox ID="txtMatKhau" runat="server" CssClass="form-input" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
            </div>

            <div class="remember-me-container" style="margin-bottom: 15px; text-align: left;">
                <asp:CheckBox ID="chkGhiNho" runat="server" Text=" Remember login" />
            </div>

            <asp:Label ID="lblThongbao" runat="server" CssClass="thongbao" ForeColor="Red"></asp:Label>

            <div class="inner-buttons">
                <asp:Button ID="btnSubmit" runat="server" Text="Log In" CssClass="btn btn-submit" OnClick="btnSubmit_Click" OnClientClick="return validateLogIn();" />
            </div>

            <div class="login-link-container">
                <span class="login-link-text">You don't have an account?</span>
                <a id="hlSignUp" href="SignIn.aspx" class="login-link">Sign in now</a>
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
    <script type="text/javascript">
        function validateLogIn() {
        var username = document.getElementById('<%= txtTenDangNhap.ClientID %>').value.trim();
        var password = document.getElementById('<%= txtMatKhau.ClientID %>').value.trim();
        var errorLabel = document.getElementById('<%= lblThongbao.ClientID %>');

        errorLabel.textContent = "";
        errorLabel.style.display = "none";

        var isValid = true;
        var errorMessage = "";

        if (username === "") {
            errorMessage = "Please enter your username.";
            isValid = false;
        } else if (password === "") {
            errorMessage = "Please enter your password.";
            isValid = false;
        }

        if (!isValid) {
            errorLabel.textContent = errorMessage;
            errorLabel.style.display = "block";
            errorLabel.style.visibility = "visible";
        }

        return isValid;
    }
</script>
</body>
</html>
