<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="BTL_LapTrinhWeb.SignIn" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="~/Assets/css/SignIn.css" />
    <%-- thanh thay đổi tên title cho đúng --%>
    <title>Register</title>
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
        <%-- thanh thay đổi tên h2 cho đúng --%>
        <%-- BODY --%>
        <h2>Register</h2>
        <div class="bieumau">
            <div class="inner-group">
                <div class="label-error-container">
                    <label class="form-label">Surname</label>
                    <asp:Label ID="lblHoNguoiDungError" runat="server" CssClass="messageError" ForeColor="Red"></asp:Label>
                </div>
                <asp:TextBox ID="txtHoNguoiDung" runat="server" CssClass="form-input" placeholder="Enter Surname"></asp:TextBox>
            </div>
            <div class="inner-group">
                <div class="label-error-container">
                    <label class="form-label">Name</label>
                    <asp:Label ID="lblTenNguoiDungError" runat="server" CssClass="messageError" ForeColor="Red"></asp:Label>
                </div>
                <asp:TextBox ID="txtTenNguoiDung" runat="server" CssClass="form-input" placeholder="Enter Name"></asp:TextBox>
            </div>

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
            <div class="inner-group">
                <div class="label-error-container">
                    <label class="form-label">Confirm Password</label>
                    <asp:Label ID="lblXacNhanMatKhauError" runat="server" CssClass="messageError" ForeColor="Red"></asp:Label>
                </div>
                <asp:TextBox ID="txtXacNhanMatKhau" runat="server" CssClass="form-input" placeholder="Confirm Password"></asp:TextBox>
            </div>

            <div class="inner-group">
                <div class="label-error-container">
                    <label class="form-label">Email</label>
                    <asp:Label ID="lblEmailError" runat="server" CssClass="messageError" ForeColor="Red"></asp:Label>
                </div>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" placeholder="Enter Email" TextMode="Email"></asp:TextBox>
            </div>

            <div class="inner-group">
                <div class="label-error-container">
                    <label class="form-label">Phone Number</label>
                    <asp:Label ID="lblPhoneNumberError" runat="server" CssClass="messageError" ForeColor="Red"></asp:Label>
                </div>
                <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-input" placeholder="Enter Phone Number" TextMode="Phone"></asp:TextBox>
            </div>

            <div class="inner-group">
                <div class="label-error-container">
                    <label class="form-label">Quê quán</label>
                    <asp:Label ID="lblQueQuanError" runat="server" CssClass="messageError" ForeColor="Red"></asp:Label>
                </div>
                <asp:TextBox ID="txtQueQuan" runat="server" CssClass="form-input" placeholder="Nhập quê quán"></asp:TextBox>
            </div>
            <asp:Label Visible="false" ID="lblThongbao" runat="server" CssClass="thongbao"></asp:Label>
            <div class="inner-buttons">
                <asp:Button ID="btnSubmit" runat="server" Text="Register" CssClass="btn btn-submit" OnClick="btnSubmit_Click" OnClientClick="return validateSignIn();" />
            </div>

            <div class="login-link-container">
                <span class="login-link-text">Already have an account?</span>
                <a id="hlLogin" href="LogIn.aspx" class="login-link">Login Now</a>
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
        function validateSignIn() {
            // Lấy tất cả giá trị từ các ô input
            var surname = document.getElementById('<%= txtHoNguoiDung.ClientID %>').value.trim();
            var name = document.getElementById('<%= txtTenNguoiDung.ClientID %>').value.trim();
            var username = document.getElementById('<%= txtTenDangNhap.ClientID %>').value.trim();
            var password = document.getElementById('<%= txtMatKhau.ClientID %>').value.trim();
            var confirmPassword = document.getElementById('<%= txtXacNhanMatKhau.ClientID %>').value.trim();
            var email = document.getElementById('<%= txtEmail.ClientID %>').value.trim();
            var phone = document.getElementById('<%= txtPhoneNumber.ClientID %>').value.trim();
            var quequan = document.getElementById('<%= txtQueQuan.ClientID %>').value.trim();
            // Lấy tất cả các nhãn báo lỗi
            var lblSurnameError = document.getElementById('<%= lblHoNguoiDungError.ClientID %>');
            var lblNameError = document.getElementById('<%= lblTenNguoiDungError.ClientID %>');
            var lblUsernameError = document.getElementById('<%= lblTenDangNhapError.ClientID %>');
            var lblPasswordError = document.getElementById('<%= lblMatKhauError.ClientID %>');
            var lblConfirmPasswordError = document.getElementById('<%= lblXacNhanMatKhauError.ClientID %>');
            var lblEmailError = document.getElementById('<%= lblEmailError.ClientID %>');
            var lblPhoneError = document.getElementById('<%= lblPhoneNumberError.ClientID %>');
            var lblQueQuanError = document.getElementById('<%= lblQueQuanError.ClientID %>');

            //đặt lại lỗi
            lblSurnameError.textContent = "";
            lblNameError.textContent = "";
            lblUsernameError.textContent = "";
            lblPasswordError.textContent = "";
            lblConfirmPasswordError.textContent = "";
            lblEmailError.textContent = "";
            lblPhoneError.textContent = "";
            lblQueQuanError.textContent = "";

            //ẩn đi
            lblSurnameError.style.display = "none";
            lblNameError.style.display = "none";
            lblUsernameError.style.display = "none";
            lblPasswordError.style.display = "none";
            lblConfirmPasswordError.style.display = "none";
            lblEmailError.style.display = "none";
            lblPhoneError.style.display = "none";
            lblQueQuanError.style.display = "none";


            var isValid = true;

            if (surname === "") {
                showError(lblSurnameError, "Surname cannot be empty");
                isValid = false;
            }
            if (name === "") {
                showError(lblNameError, "Name cannot be empty");
                isValid = false;
            }
            if (username.length < 5) {
                showError(lblUsernameError, "Username must be at least 5 characters long");
                isValid = false;
            }
            if (password.length < 6) {
                showError(lblPasswordError, "Password must be at least 6 characters long");
                isValid = false;
            }
            if (confirmPassword === "") {
                showError(lblConfirmPasswordError, "Please confirm your password");
                isValid = false;
            } else if (confirmPassword !== password) {
                showError(lblConfirmPasswordError, "Passwords do not match");
                isValid = false;
            }
            var emailPattern = /^[a-zA-Z0-9]+@gmail\.com$/;
            if (!emailPattern.test(email)) {
                showError(lblEmailError, "Invalid email format (must be an @gmail.com address)");
                isValid = false;
            }
            var phonePattern = /^0[1-9]\d{8}$/;
            if (!phonePattern.test(phone)) {
                showError(lblPhoneNumberError, "Phone number must be a valid 10-digit number");
                isValid = false;
            }
            if (quequan === "") {
                showError("Quê quán không được để trống");
                isValid = false;
            }
            var quequanPattern = /^[A-Za-zÀ-ỹ\s]+$/;
            if (!quequanPattern.test(quequan)){
                showError(lblQueQuanError, "Quê quán không được có số và ký tự đặc biệt");
                isValid = false;
            }
            
            return isValid;
        }
    </script>
</body>
</html>
