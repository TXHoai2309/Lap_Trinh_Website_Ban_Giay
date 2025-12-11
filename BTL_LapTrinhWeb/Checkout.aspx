<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="BTL_LapTrinhWeb.Checkout" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>CHECK OUT</title>
    <link rel="stylesheet" type="text/css" href="~/Assets/css/Checkout.css" />
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
        <h3><b>CHECK OUT</b></h3>
        <h4>Please fill out the form below to complete your order</h4>
        <div class="form-container">

            <div class="form-left">
                <div class="form-section">
                    <p><b>Personal Details</b></p>
                    <div class="inner-group">
                        <div class="label-row">
                            <label for="txtSurname">Surname</label>
                            <asp:Label ID="lblSurnameError" runat="server" CssClass="Error"></asp:Label>
                        </div>
                        <asp:TextBox ID="txtSurname" runat="server"></asp:TextBox>
                    </div>

                    <div class="inner-group">
                        <div class="label-row">
                            <label for="txtName">Name</label>
                            <asp:Label ID="lblNameError" runat="server" CssClass="Error"></asp:Label>
                        </div>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    </div>

                    <div class="inner-group">
                        <div class="label-row">
                            <label for="txtEmail">Email Address</label>
                            <asp:Label ID="lblEmailError" runat="server" CssClass="Error"></asp:Label>
                        </div>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    </div>

                    <div class="inner-group">
                        <div class="label-row">
                            <label for="txtPhone">Phone Number</label>
                            <asp:Label ID="lblPhoneError" runat="server" CssClass="Error"></asp:Label>
                        </div>
                        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                    </div>
                </div>

                <!-- Delivery -->
                <div class="form-section">
                    <p><b>Delivery</b></p>

                    <div class="inner-group">
                        <div class="label-row">
                            <label for="txtAddress1">Street Address Line 1</label>
                            <asp:Label ID="lblAddress1Error" runat="server" CssClass="Error"></asp:Label>
                        </div>
                        <asp:TextBox ID="txtAddress1" runat="server"></asp:TextBox>
                    </div>

                    <div class="inner-group">
                        <div class="label-row">
                            <label for="txtAddress2">Street Address Line 2</label>
                            <asp:Label ID="lblAddress2Error" runat="server" CssClass="Error"></asp:Label>
                        </div>
                        <asp:TextBox ID="txtAddress2" runat="server"></asp:TextBox>
                    </div>

                    <div class="inner-group">
                        <div class="label-row">
                            <label for="txtPostal">Postal Code</label>
                            <asp:Label ID="lblPostalError" runat="server" CssClass="Error"></asp:Label>
                        </div>
                        <asp:TextBox ID="txtPostal" runat="server"></asp:TextBox>
                    </div>

                    <div class="inner-group">
                        <div class="label-row">
                            <label for="txtCity">Town / City</label>
                            <asp:Label ID="lblCityError" runat="server" CssClass="Error"></asp:Label>
                        </div>
                        <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-section">
                    <p><b>Payment Method</b></p>

                    <div class="inner-group">
                        <div class="label-row">
                            <label>Select Method</label>
                            <asp:Label ID="lblPaymentError" runat="server" CssClass="Error"></asp:Label>
                        </div>

                        <asp:RadioButtonList ID="rblPaymentMethod" runat="server" RepeatDirection="Horizontal" CssClass="payment-options">
                            <asp:ListItem Value="COD" Text="Cash on Delivery"></asp:ListItem>
                            <asp:ListItem Value="Bank" Text="Bank Transfer"></asp:ListItem>
                            <asp:ListItem Value="Card" Text="Credit Card"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>

                    <div class="inner-group">
                        <div class="label-row">
                            <label for="txtAccount">Account Number</label>
                            <asp:Label ID="lblAccountError" runat="server" CssClass="Error"></asp:Label>
                        </div>
                        <asp:TextBox ID="txtAccount" runat="server" placeholder="Enter your account or card number"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-right">
                <p><b>Order Summary (4)</b></p>
                <div class="title">
                    <h5>Items</h5>
                    <h5 class="subtotal">Subtotal</h5>
                </div>
               <!-- Hoài sửa chỗ này -->
                <div class="checkout-list">
                    <asp:Repeater ID="rptCheckoutItems" runat="server">
                        <ItemTemplate>
                            <div class="checkout-item">
                                <div class="product-info">
                                    <img src='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>' class="product-img" />
                                    <div class="details">
                                        <p class="name"><%# Eval("Name") %></p>
                                        <p class="sub">Size: <%# Eval("Size") %><br />
                                            Qty: <%# Eval("Quantity") %></p>
                                    </div>
                                </div>
                                <p class="price">
                                    <%# GetPrice(Eval("Price"), Eval("Sale"), Eval("Quantity")) %>
                                </p>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>


                    <asp:Label ID="lblEmptyCart" runat="server" CssClass="Error" Visible="false"></asp:Label>

                    <div class="total_buy">
                        <div class="text_price">
                            <p>Total Purchase</p>
                            <p>Delivery</p>
                            <p><b>Grand Total</b></p>
                        </div>
                        <div class="total_price_class">
                            <p class="total_price">
                                <asp:Literal ID="litTotalPurchase" runat="server"></asp:Literal>
                            </p>
                            <p class="total_price">
                                <asp:Literal ID="litDelivery" runat="server"></asp:Literal>
                            </p>
                            <p class="total_price">
                                <asp:Literal ID="litGrandTotal" runat="server"></asp:Literal>
                            </p>
                        </div>
                    </div>
                </div>
                <!-- Hoài sửa chỗ này -->
                <div class="btn-group">
                    <asp:Button ID="btnSubmit" runat="server" Text="Confirm Order"
                        CssClass="submit-btn" OnClick="btnSubmit_Click" onClientClick="return validateCheckOutForm();"/>
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="cancel-btn" />
                </div>
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
        function validateCheckOutForm() {
            var surname = document.getElementById('<%= txtSurname.ClientID %>').value.trim();
            var name = document.getElementById('<%= txtName.ClientID %>').value.trim();
            var email = document.getElementById('<%= txtEmail.ClientID %>').value.trim();
            var phone = document.getElementById('<%= txtPhone.ClientID %>').value.trim();
            var address1 = document.getElementById('<%= txtAddress1.ClientID %>').value.trim();
            var address2 = document.getElementById('<%= txtAddress2.ClientID %>').value.trim();
            var postal = document.getElementById('<%= txtPostal.ClientID %>').value.trim();
            var city = document.getElementById('<%= txtCity.ClientID %>').value.trim();
            var paymentList = document.getElementsByName('<%= rblPaymentMethod.UniqueID %>');
            var account = document.getElementById('<%= txtAccount.ClientID %>').value.trim();


            var lblSurnameError = document.getElementById('<%= lblSurnameError.ClientID %>');
            var lblNameError = document.getElementById('<%= lblNameError.ClientID %>');
            var lblEmailError = document.getElementById('<%= lblEmailError.ClientID %>');
            var lblPhoneError = document.getElementById('<%= lblPhoneError.ClientID %>');
            var lblAddress1Error = document.getElementById('<%= lblAddress1Error.ClientID %>');
            var lblPostalError = document.getElementById('<%= lblPostalError.ClientID %>');
            var lblCityError = document.getElementById('<%= lblCityError.ClientID %>');
            var lblPaymentError = document.getElementById('<%= lblPaymentError.ClientID %>');
            var lblAccountError = document.getElementById('<%= lblAccountError.ClientID %>');

            var labels = [lblSurnameError, lblNameError, lblEmailError, lblPhoneError,
                lblAddress1Error, lblPostalError, lblCityError,
                lblPaymentError];
            labels.forEach(l => l.textContent = "");


            var isValid = true;

            if (surname === "") {
                lblSurnameError.textContent = "Vui lòng nhập họ";
                isValid = false;
            }
            if (name === "") {
                lblNameError.textContent = "Vui lòng nhập tên";
                isValid = false;
            }
            if (email === "") {
                lblEmailError.textContent = "Vui lòng nhập email";
                isValid = false;
            } else if (!/^\S+@\S+\.\S+$/.test(email)) {
                lblEmailError.textContent = "Email không hợp lệ";
                isValid = false;
            }
            if (phone === "") {
                lblPhoneError.textContent = "Vui lòng nhập số điện thoại";
                isValid = false;
            } else if (!/^[0-9]{10}$/.test(phone)) {
                lblPhoneError.textContent = "Số điện thoại phải có 10 chữ số";
                isValid = false;
            }
            if (address1 === "") {
                lblAddress1Error.textContent = "Vui lòng nhập địa chỉ";
                isValid = false;
            }
            if (postal === "") {
                lblPostalError.textContent = "Vui lòng nhập mã bưu điện";
                isValid = false;
            }
            if (city === "") {
                lblCityError.textContent = "Vui lòng nhập thành phố";
                isValid = false;
            }

            var paymentSelected = false;
            for (var i = 0; i < paymentList.length; ++i) {
                if (paymentList[i].checked) {
                    paymentSelected = true;
                    break;
                }
            }
            if (!paymentSelected) {
                lblPaymentError.textContent = "Vui lòng chọn phương thức thanh toán";
                isValid = false;
            }

            if (account === "") {
                lblAccountError.textContent = "Vui lòng nhập số tài khoản/thẻ";
                isValid = false;
            }
            return isValid;


        }

    </script>
</body>
</html>
