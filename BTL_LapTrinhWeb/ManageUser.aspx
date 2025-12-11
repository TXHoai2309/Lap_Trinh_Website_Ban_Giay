    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageUser.aspx.cs" Inherits="BTL_LapTrinhWeb.ManageUser" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>
    <link rel="stylesheet" href="~/Assets/css/Admin.css" runat="server" /> 
    <link rel="stylesheet" href="~/Assets/css/UserManager.css" runat="server" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="admin-header">
                    <div class="header-title">
                        <h1>User Management</h1>
                    </div>
                    <div class="header-logo">
                        <b class="first_logo">IT</b><b class="last_logo"> Shoes</b>
                    </div>
                <div class="header-search">
                    <asp:TextBox ID="txtSearch" runat="server" placeholder="Search Products" CssClass="search_box" />
                    <asp:ImageButton ID="btnSearch" runat="server" ImageUrl="~/Assets/images/Chung/kinhlup.png" OnClick="btnSearch_Click" CssClass="search_button" />
                </div>
            </div>
            <nav class="menu">
                <ul id="menu_list">
                    <li><a href='<%= ResolveUrl("~/Admin.aspx") %>' class="menu_item">Product Management</a></li>
                    <li><a href='<%= ResolveUrl("~/ManageUser.aspx") %>' class="menu_item">User Management</a></li>
                </ul>
            </nav>
            <div class="button-container">
                <asp:Button ID="btnBackToLogin" runat="server" Text="Back to Login" CssClass="asp-button" OnClick="btnBackToLogin_Click" />
            </div>
            <%-- BẢNG HIỂN THỊ NGƯỜI DÙNG QUAN TRỌNG --%>
            <div class="grid-wrapper">
                <table class="user-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Surname</th>
                            <th>Name</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Quê quán</th>
                        </tr>
                    </thead>
                    <%-- Đây là mã HTML tiêu chuẩn, đinh nghĩa 1 cái bảng (user-table) và phần đầu của bảng (thead). Phần này liệt kê 6 tiêu đề cột(ID, Surname, Name, Username, Email, Phone) mà admin sẽ thấy --%>
                    <tbody>
                        <asp:Literal ID="ltlUserTableBody" runat="server"></asp:Literal>
                        <%-- Đây là phần "thân" của bảng, nơi các hàng dữ liệu (các người dùng) sẽ xuất hiện --%>
                    </tbody>
                </table>
            </div>
        </div>
    </form>
</body>
</html>