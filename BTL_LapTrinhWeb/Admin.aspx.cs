using BTL_LapTrinhWeb.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LapTrinhWeb.Admin
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserLoggedIn"] == null)
            {
                // bảo mật
                Response.Redirect("~/LogIn.aspx");
                return;
            }
            if (!IsPostBack)
            {
                BindProductsGridView();
            }
        }
        public string TruncateDescription(object description, int maxLength = 100)
        {
            // Nhiệm vụ của nó là nhận 1 đoạn mô tả (description) và cắt ngắn nó xuống còn 100 ký tự (maxLength = 100), sau đó thêm dấu ... vào cuối để hiển thị cho gọn gàng
            string desc = description as string;
            if (string.IsNullOrEmpty(desc))
            {
                return "";
            }

            if (desc.Length > maxLength)
            {
                return desc.Substring(0, maxLength) + "...";
            }
            return desc;
        }
        private void BindProductsGridView(string searchTerm = "")
        {
            // Lấy dữ liệu: Lấy toàn bộ danh sách sản phẩm từ "cơ sở dữ liệu"
            List<Products> allProducts = (List<Products>)Application["AllProducts"];
            IEnumerable<Products> filteredProducts = allProducts;
            // Lọc (nếu có tìm kiếm)
            if (!string.IsNullOrEmpty(searchTerm))
            {
                filteredProducts = allProducts.Where(p =>
                    p.Name.ToLower().Contains(searchTerm.ToLower())
                );
            }
            // Đổ dữ liệu vào bảng 
            gvProducts.DataSource = filteredProducts.ToList();
            gvProducts.DataBind();
        }

        protected void btnSearch_Click(object sender, ImageClickEventArgs e)
        {
            BindProductsGridView(txtSearch.Text.Trim());
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminAddProduct.aspx");
        }
        protected void btnBackToLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LogIn.aspx");
        }
        protected void gvProducts_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvProducts.EditIndex = e.NewEditIndex;
            BindProductsGridView(txtSearch.Text.Trim());
        }

        protected void gvProducts_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProducts.EditIndex = -1;
            BindProductsGridView(txtSearch.Text.Trim());
        }

        protected void gvProducts_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int productID = Convert.ToInt32(gvProducts.DataKeys[e.RowIndex].Value);
            List<Products> allProducts = (List<Products>)Application["AllProducts"];
            Products productToUpdate = allProducts.FirstOrDefault(p => p.ProductID == productID);

            if (productToUpdate != null)
            {
                GridViewRow row = gvProducts.Rows[e.RowIndex];

                FileUpload fuImageUrlEdit = (row.FindControl("fuImageUrlEdit") as FileUpload);
                HiddenField hdnImageUrl = (row.FindControl("hdnImageUrl") as HiddenField);
                string newImageUrl = hdnImageUrl.Value;

                string gender = (row.FindControl("txtGender") as TextBox)?.Text;

                if (fuImageUrlEdit != null && fuImageUrlEdit.HasFile)
                {
                    try
                    {
                        string fileName = Path.GetFileName(fuImageUrlEdit.FileName);
                        string folderPath = Path.Combine("~/Assets/images/", gender);
                        string serverFolderPath = Server.MapPath(folderPath);

                        if (!Directory.Exists(serverFolderPath))
                        {
                            Directory.CreateDirectory(serverFolderPath);
                        }

                        string serverFilePath = Path.Combine(serverFolderPath, fileName);
                        fuImageUrlEdit.SaveAs(serverFilePath);

                        newImageUrl = folderPath.Replace("\\", "/") + "/" + fileName;
                    }
                    catch (Exception)
                    {
                    }
                }
                productToUpdate.Name = (row.FindControl("txtName") as TextBox)?.Text;
                productToUpdate.Price = Convert.ToDecimal((row.FindControl("txtPrice") as TextBox)?.Text);
                productToUpdate.Category = (row.FindControl("txtCategory") as TextBox)?.Text;
                productToUpdate.Gender = gender;
                productToUpdate.Description = (row.FindControl("txtDescription") as TextBox)?.Text;
                productToUpdate.Sale = Convert.ToInt32((row.FindControl("txtSale") as TextBox)?.Text);
                productToUpdate.ImageUrl = newImageUrl;

                UpdateSpecificProductLists();
            }

            gvProducts.EditIndex = -1;
            BindProductsGridView(txtSearch.Text.Trim());
        }

        protected void gvProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int productID = Convert.ToInt32(gvProducts.DataKeys[e.RowIndex].Value);
            List<Products> allProducts = (List<Products>)Application["AllProducts"];

            allProducts.RemoveAll(p => p.ProductID == productID);

            UpdateSpecificProductLists();
            BindProductsGridView(txtSearch.Text.Trim());
        }

        private void UpdateSpecificProductLists()
        {
            List<Products> allProducts = (List<Products>)Application["AllProducts"];
            Application["MenProductList"] = allProducts.Where(p => p.Gender == "Men").ToList();
            Application["WomenProductList"] = allProducts.Where(p => p.Gender == "Women").ToList();
            Application["KidsProductList"] = allProducts.Where(p => p.Gender == "Kids").ToList();
        }
    }
}