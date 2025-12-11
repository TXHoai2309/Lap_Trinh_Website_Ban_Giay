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
    public partial class AdminAddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserLoggedIn"] == null)
            {
                // Nếu chưa đăng nhập quay về trang Login 
                Response.Redirect("~/LogIn.aspx");
                return;
            }
        }
        private string SaveFileAndGetPath(FileUpload fileUploadControl, string gender)
        {
            if (fileUploadControl.HasFile)
            {
                // Kiểm tra xem admin có thực sự chọn tệp để tải lên không. Nếu không trả về null 
                try
                {
                    string fileName = Path.GetFileName(fileUploadControl.FileName);
                    string folderPath = Path.Combine("~/Assets/images/", gender);
                    // Nếu admin chọn gender là Men, đường dẫn sẽ là `~/Assets/images/Men
                    string serverFolderPath = Server.MapPath(folderPath);
                    //  Đây là 1 hàm quan trọng. Nó chuyển đổi đường dẫn ảo virtual path `/... (mà website hiểu) thành 1 đường dẫn vật lý (physical path) trển ổ cứng của máy chủ. Ví dụ(C:\MyProject\Assets\images\Men) để có thể lưu tệp.
                    if (!Directory.Exists(serverFolderPath))
                    {
                        Directory.CreateDirectory(serverFolderPath);
                        // Tự động tạo thư mục Men, Women, hoặc Kids nếu chưa tồn tại
                    }

                    string serverFilePath = Path.Combine(serverFolderPath, fileName);
                    fileUploadControl.SaveAs(serverFilePath);
                    // Đây là lệnh thực thi việc lưu tệp ảnh vào ổ cứng máy tính

                    return folderPath.Replace("\\", "/") + "/" + fileName;
                    // Trả về đường dẫn ảo (ví dụ: ~/Assets/images/Men/shoe.png). Đây chính là đường dẫn sẽ được lưu vào đối tượng Products và được dùng để hiển thị ảnh trên web
                }
                catch (Exception ex)
                {
                    lblErrorMessage.Text = "Error uploading file: " + ex.Message;
                    lblErrorMessage.Visible = true;
                    return null;
                }
            }
            return null;
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string gender = ddlGender.SelectedValue;

            string imageUrl = SaveFileAndGetPath(fuImageUrl, gender);
            string imageLeft = SaveFileAndGetPath(fuImageLeft, gender);
            string imageBack = SaveFileAndGetPath(fuImageBack, gender);
            string imageTop = SaveFileAndGetPath(fuImageTop, gender);
            string imageUnder = SaveFileAndGetPath(fuImageUnder, gender);

            if (string.IsNullOrWhiteSpace(txtName.Text) ||
                string.IsNullOrWhiteSpace(txtPrice.Text) ||
                string.IsNullOrWhiteSpace(imageUrl) ||
                string.IsNullOrWhiteSpace(imageLeft) ||
                string.IsNullOrWhiteSpace(imageBack) ||
                string.IsNullOrWhiteSpace(imageTop) ||
                string.IsNullOrWhiteSpace(imageUnder) ||
                string.IsNullOrWhiteSpace(txtCategory.Text))
            {
                if (!lblErrorMessage.Visible)
                {
                    lblErrorMessage.Text = "Please fill in all required fields and upload all 5 images.";
                    lblErrorMessage.Visible = true;
                }
                return;
            }

            List<Products> allProducts = (List<Products>)Application["AllProducts"];
            if (allProducts == null)
            {
                allProducts = new List<Products>();
            }
            // Tìm id lớn nhất hiện có và cộng thêm 1 
            int newProductId = (allProducts.Any() ? allProducts.Max(p => p.ProductID) : 0) + 1;

            Products newProduct = new Products
            {
                ProductID = newProductId,
                Name = txtName.Text.Trim(),
                Price = decimal.Parse(txtPrice.Text),
                ImageUrl = imageUrl,
                ImageLeft = imageLeft,
                ImageBack = imageBack,
                ImageTop = imageTop,
                ImageUnder = imageUnder,
                Category = txtCategory.Text.Trim(),
                Description = txtDescription.Text.Trim(),
                Gender = gender,
                Sale = string.IsNullOrEmpty(txtSale.Text) ? 0 : int.Parse(txtSale.Text),
                ProductUrl = "#"
            };
            // Lưu vào cơ sở dữ liệu 
            allProducts.Add(newProduct);
            Application["AllProducts"] = allProducts;
            // đồng bộ hóa 
            UpdateSpecificProductLists();
            // chuyển hướng
            Response.Redirect("~/Admin.aspx");
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