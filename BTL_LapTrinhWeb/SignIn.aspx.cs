using BTL_LapTrinhWeb.Models;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LapTrinhWeb
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ClearAllErrors();

            bool isValid = true;

            string ho = txtHoNguoiDung.Text.Trim();
            string ten = txtTenNguoiDung.Text.Trim();
            string tenDangNhap = txtTenDangNhap.Text.Trim();
            string matKhau = txtMatKhau.Text.Trim();
            string xacNhanMatKhau = txtXacNhanMatKhau.Text.Trim();
            string email = txtEmail.Text.Trim();
            string soDienThoai = txtPhoneNumber.Text.Trim();
            string quequan = txtQueQuan.Text.Trim();
            // Lớp bảo vệ thứ hai (sau javaScript) để đảm bảo dữ liệu gửi lên là hợp lệ.
            if (string.IsNullOrEmpty(ho))
            {
                ShowError(lblHoNguoiDungError, "Surname cannot be empty");
                isValid = false;
            }

            if (string.IsNullOrEmpty(ten))
            {
                ShowError(lblTenNguoiDungError, "Name cannot be empty");
                isValid = false;
            }

            if (tenDangNhap.Length < 5)
            {
                ShowError(lblTenDangNhapError, "Username must be at least 5 characters long");
                isValid = false;
            }

            if (matKhau.Length < 6)
            {
                ShowError(lblMatKhauError, "Password must be at least 6 characters long");
                isValid = false;
            }
            if (string.IsNullOrEmpty(xacNhanMatKhau))
            {
                ShowError(lblXacNhanMatKhauError, "Please confirm your password");
                isValid = false;
            }
            else if (matKhau != xacNhanMatKhau)
            {
                ShowError(lblXacNhanMatKhauError, "Passwords do not match");
                isValid = false;
            }
            if (!Regex.IsMatch(email, @"^[a-zA-Z0-9]+@gmail\.com$"))
            {
                ShowError(lblEmailError, "Invalid email format (must be an @gmail.com address)");
                isValid = false;
            }

            if (!Regex.IsMatch(soDienThoai, @"^0[1-9]\d{8}$"))
            {
                ShowError(lblPhoneNumberError, "Phone number must be a valid 10-digit number");
                isValid = false;
            }
            if(!Regex.IsMatch(quequan, @"^[A-Za-zÀ-ỹ\s]+$"))
            {
                ShowError(lblQueQuanError, "Quê quán không được có ký tự số và ký tự đặc biệt");
                isValid = false;
            }
            if (string.IsNullOrEmpty(quequan))
            {
                ShowError(lblQueQuanError, "Quê quán không được để trống");
                isValid = false;
            }
           
            // Kiểm tra trùng lặp 
            if (!isValid)
            {
                return;
            }
            List<User> danhSachNguoiDung = (List<User>)Application["dstk"];
            if (danhSachNguoiDung.Exists(u => u.Username.Equals(tenDangNhap, StringComparison.OrdinalIgnoreCase)))
            {
                lblThongbao.Text = "Username already exists";
                lblThongbao.ForeColor = Color.Red;
                lblThongbao.Visible = true;
                return;
            }

            User nguoiDungMoi = new User
            {
                Surname = ho,
                Name = ten, 
                Username = tenDangNhap,
                Password = matKhau,
                Email = email,
                Phone = soDienThoai,
                QueQuan = quequan
            };
            danhSachNguoiDung.Add(nguoiDungMoi);
            Application["dstk"] = danhSachNguoiDung;

            lblThongbao.Text = "Registration successful";
            lblThongbao.ForeColor = Color.Green;
            lblThongbao.Visible = true;

            ClearFormFields();
            Response.Redirect("~/LogIn.aspx");
        }
        private void ClearFormFields()
        {
            txtHoNguoiDung.Text = string.Empty;
            txtTenNguoiDung.Text = string.Empty;
            txtTenDangNhap.Text = string.Empty;
            txtMatKhau.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPhoneNumber.Text = string.Empty;
            txtQueQuan.Text = string.Empty;
        }

        private void ShowError(Label errorLabel, string message)
        {
            errorLabel.Text = message;
            errorLabel.Visible = true;
        }

        private void ClearAllErrors()
        {
            lblHoNguoiDungError.Visible = false;
            lblTenNguoiDungError.Visible = false;
            lblTenDangNhapError.Visible = false;
            lblMatKhauError.Visible = false;
            lblXacNhanMatKhauError.Visible = false;
            lblEmailError.Visible = false;
            lblPhoneNumberError.Visible = false;
            lblQueQuanError.Visible = false;
        }
        protected void SUBSCRIBE_btn_Click(object sender, EventArgs e) { }
        protected void lnkSignIn_Click(object sender, EventArgs e) { }
        protected void lnkFavorites_Click(object sender, EventArgs e)
        {
            if (Session["UserLoggedIn"] != null)
            {
                Response.Redirect("~/Favorites.aspx");
            }
            else
            {
                Response.Redirect("~/LogIn.aspx");
            }
        }
        protected void lnkCart_Click(object sender, EventArgs e) 
        {
            if (Session["UserLoggedIn"] != null)
            {
                Response.Redirect("~/Cart.aspx");
            }
            else
            {
                Response.Redirect("~/LogIn.aspx");
            }
        }
        protected void search_button_Click(object sender, ImageClickEventArgs e) { }
    }
}