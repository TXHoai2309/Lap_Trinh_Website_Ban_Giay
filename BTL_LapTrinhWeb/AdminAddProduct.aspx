<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminAddProduct.aspx.cs" Inherits="BTL_LapTrinhWeb.Admin.AdminAddProduct" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>Add New Product</title>
    <link rel="stylesheet" href="~/Assets/css/Admin.css" runat="server" /> 
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="admin-header">
                <div class="header-title">
                    <h1>Add New Product</h1>
                </div>
            </div>

            <div class="form-container">
                <div class="form-group">
                    <asp:Label ID="lblName" runat="server" Text="Product Name:"></asp:Label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-textbox"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblPrice" runat="server" Text="Price:"></asp:Label>
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-textbox" TextMode="Number" step="0.01"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblImageUrl" runat="server" Text="Main Image:"></asp:Label>
                    <asp:FileUpload ID="fuImageUrl" runat="server" />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblImageLeft" runat="server" Text="Image Left:"></asp:Label>
                    <asp:FileUpload ID="fuImageLeft" runat="server" />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblImageBack" runat="server" Text="Image Back:"></asp:Label>
                    <asp:FileUpload ID="fuImageBack" runat="server" />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblImageTop" runat="server" Text="Image Top:"></asp:Label>
                    <asp:FileUpload ID="fuImageTop" runat="server" />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblImageUnder" runat="server" Text="Image Under:"></asp:Label>
                    <asp:FileUpload ID="fuImageUnder" runat="server" />
                </div>
                <div class="form-group">
                    <asp:Label ID="lblCategory" runat="server" Text="Category:"></asp:Label>
                    <asp:TextBox ID="txtCategory" runat="server" CssClass="form-textbox"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblGender" runat="server" Text="Gender:"></asp:Label>
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-dropdown">
                        <asp:ListItem>Men</asp:ListItem>
                        <asp:ListItem>Women</asp:ListItem>
                        <asp:ListItem>Kids</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblDescription" runat="server" Text="Description:"></asp:Label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-textbox" TextMode="MultiLine" Rows="4"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblSale" runat="server" Text="Sale Percentage (e.g., 30 for 30%):"></asp:Label>
                    <asp:TextBox ID="txtSale" runat="server" CssClass="form-textbox" TextMode="Number" Text="0"></asp:TextBox>
                </div>
                <div class="form-actions">
                    <asp:Label ID="lblErrorMessage" runat="server" CssClass="error-message" Visible="false"></asp:Label>
                    <asp:HyperLink ID="btnCancel" runat="server" Text="Cancel" NavigateUrl="~/Admin.aspx" CssClass="form-button btn-cancel"></asp:HyperLink>
                    <asp:Button ID="btnSave" runat="server" Text="Save Product" OnClick="btnSave_Click" CssClass="form-button btn-save" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>