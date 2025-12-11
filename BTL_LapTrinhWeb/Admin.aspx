<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="BTL_LapTrinhWeb.Admin.Admin" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Product Management</title>
    <link rel="stylesheet" href="~/Assets/css/Admin.css" runat="server" /> 
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <%-- Phần head --%>
            <div class="admin-header">
                    <div class="header-title">
                        <h1>Product Management</h1>
                    </div>
                    <div class="header-logo">
                        <b class="first_logo">IT</b><b class="last_logo"> Shoes</b>
                    </div>
                <div class="header-search">
                    <asp:TextBox ID="txtSearch" runat="server" placeholder="Search Products" CssClass="search_box" />
                    <asp:ImageButton ID="btnSearch" runat="server" ImageUrl="~/Assets/images/Chung/kinhlup.png" OnClick="btnSearch_Click" CssClass="search_button" />
                    <%-- Tìm kiếm: Onclick trên btnSearch là một"cầu nối", Khi nhấn nút này này, nó sẽ kích hoạt phương thức btnSearch_Click trong tệp Admin.aspx.cs để thực hiển logic tìm kiếm --%>
                </div>
            </div>
            <%-- Điều hướng --%>
            <%-- Cung cấp hai liên kết chính cho admin --%>
            <nav class="menu">
                <ul id="menu_list">
                    <li><a href='<%= ResolveUrl("~/Admin.aspx") %>' class="menu_item">Product Management</a></li>
                    <li><a href='<%= ResolveUrl("~/ManageUser.aspx") %>' class="menu_item">User Management</a></li>
                </ul>
            </nav>
            <%-- các nút hành động chính của trang --%>
            <div class="button-container">
                <%-- Khi nhấn, onclick = btnBackToLogin_Click sẽ gọi hàm C# tương ứng để responsive.redirect về trang login.aspx --%>
                <asp:Button ID="btnBackToLogin" runat="server" Text="Back to Login" CssClass="asp-button" OnClick="btnBackToLogin_Click" />
                <%-- Đây là chức năng "create" trong crud. Khi nhấn, onclick = "btnAddproduct_Clicj" sẽ gọi hàm để chuyến hướng admin đến trang AdminAddProdct.aspx  --%>
                <asp:Button ID="btnAddProduct" runat="server" Text="Add New Product" CssClass="asp-button" OnClick="btnAddProduct_Click" />
            </div>
            <div class="grid-wrapper">
                <%-- Thuộc tính của grid view --%>
                <%-- Auto..="false": Rất quan trọng. Nó báo cho gridview không tự động tạo cột. Thay vào đó, chúng sẽ tự định nghĩa các cột bên trong thẻ <Column>. --%>
                <%-- DataKeyNames = "ProductID": Cực ký quan trọng. Đây là "chìa khóa chính" của bảng. Nó cho GridView biết rằng productID là ID duy nhất của mỗi hàng. --%>
                <%-- Khi bạn nhấn Edit hoặc Delete GridView sẽ dùng DataKey này để báo cho C# biết chính xác hàng nào cần được xử lý  --%>
                <%-- Các sự kiện (Events): Đây là các cầu nối logic: --%>
                <%-- OnrowEditing: kích hoạt hàm gvProducts_RowEditing(C#) khi nhấn nút "Edit" --%>
                <%-- OnrowUpdating: kích hoạt hàm gvProducts_Rowupdating khi nhấn nút Update --%>
                <%-- OnrowCancelingEdit: kích hoạt hàm gvProducts_RowCancelingEdit khi nhấn nút cancel  --%>
                <%-- OnrowDeleting: kích hoạt hàm gvproduct_rowdeleting khi nhấn nút delete --%>
                <asp:GridView ID="gvProducts" runat="server" 
                AutoGenerateColumns="False" 
                DataKeyNames="ProductID" 
                OnRowEditing="gvProducts_RowEditing" 
                OnRowCancelingEdit="gvProducts_RowCancelingEdit" 
                OnRowUpdating="gvProducts_RowUpdating" 
                OnRowDeleting="gvProducts_RowDeleting"
                CssClass="product-grid" 
                EmptyDataText="No products found.">
                <Columns>
                    <%-- Cấu trúc cột --%>
                    <%-- Mỗi cột gồm  2 chế độ hiên thị --%>
                    <%-- <ItemTemplate>: Chế độ xem bình thường (hiển thị Label). --%>
                   <%-- <EditItemTemplate>: Chế độ chỉnh sửa (hiển thị TextBox). --%>
                    <asp:BoundField DataField="ProductID" HeaderText="ID" ReadOnly="True" />
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate> <%--Hiển thị hình ảnh sản phẩm --%>
                            <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' Width="50" Height="50" />
                        </ItemTemplate> <%--Chỉnh sửa --%>
                        <EditItemTemplate> 
                            <asp:Image ID="imgProductEdit" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' Width="50" Height="50" />
                            <br />
                            <b>Upload new:</b>
                            <br />
                            <asp:FileUpload ID="fuImageUrlEdit" runat="server" CssClass="edit-textbox" />
                            <%-- <asp:FileUpload> control (fuImageUrlEdit)  để admin có thể tải lên một ảnh mới. --%>
                            <asp:HiddenField ID="hdnImageUrl" runat="server" Value='<%# Bind("ImageUrl") %>' />
                            <%-- HiddenField (hdnImageUrl)  được dùng để lưu trữ URL ảnh cũ, phòng trường hợp admin không muốn thay đổi ảnh. --%>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate> <%--Hiển thị sản phẩm bằng 1 label--%>
                            <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label> 
                            <%-- Bind("Name": Đây là cú pháp "Data Binding" (liên kết dữ liệu). Nó tự động liên kết thuộc tính Text của Label/TextBox với cột "Name" từ nguồn dữ liệu (danh sách Products được gán trong C#).--%>
                        </ItemTemplate>
                        <EditItemTemplate> <%--Khi nhấn nút Edit, label này sẽ bị ẩn đi và 1 textbox(txtName) sẽ xuất hiện, cho phép admin chỉnh sửa tên --%>
                            <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>' CssClass="edit-textbox"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price">
                        <ItemTemplate>
                            <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price", "{0:C}") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("Price") %>' CssClass="edit-textbox"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category">
                        <ItemTemplate>
                            <asp:Label ID="lblCategory" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCategory" runat="server" Text='<%# Bind("Category") %>' CssClass="edit-textbox"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Gender">
                        <ItemTemplate>
                            <asp:Label ID="lblGender" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtGender" runat="server" Text='<%# Bind("Gender") %>' CssClass="edit-textbox"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description">
                        <ItemTemplate>
                            <asp:Label ID="lblDescription" runat="server" 
                                       Text='<%# TruncateDescription(Eval("Description"), 100) %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' CssClass="edit-textbox" TextMode="MultiLine" Rows="3"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sale (%)">
                        <ItemTemplate>
                            <asp:Label ID="lblSale" runat="server" Text='<%# Bind("Sale") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtSale" runat="server" Text='<%# Bind("Sale") %>' CssClass="edit-textbox" type="number"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate> <%--Chứa 2 nút --%>
                            <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" CssClass="grid-action-btn btn-edit"></asp:LinkButton>
                            <%-- Là 1 lệnh đặc biệt. Khi nhấn, nó tự động kích hoạt sự kiện Onrowediting của gridview --%>
                            <br />
                            <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this product?');" CssClass="grid-action-btn btn-delete"></asp:LinkButton>
                            <%-- Tự kích hoạt onrowdeleting --%>
                        </ItemTemplate>
                        <EditItemTemplate> <%--Chứa 2 nút khác, chỉ xuất hiện ở chế độ sửa--%>
                            <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" Text="Update" CssClass="grid-action-btn btn-update"></asp:LinkButton>
                           <%-- btnUpdate: CommandName="Update" tự động kích hoạt OnRowUpdating.--%>
                            <br />
                            <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CssClass="grid-action-btn btn-cancell"></asp:LinkButton>
                            <%-- btnCancel: CommandName="Cancel" tự động kích hoạt OnRowCancelingEdit. --%>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                </div>
        </div>
    </form>
</body>
</html>