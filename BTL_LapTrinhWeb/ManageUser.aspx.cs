using BTL_LapTrinhWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LapTrinhWeb
{
    public partial class ManageUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUserData();
            }
        }

        private void BindUserData()
        {
            // Lấy cơ sở dữ liệu người dùng: Lấy danh sách List<User> từ "CSDL" Application["dstk"] (danh sách này được tạo trong Global.asax.cs). 
            List<User> danhSachNguoiDung = (List<User>)Application["dstk"];
            // Khởi tạo công cụ xây dựng 
            // Đây là 1 công cụ hiệu quả để xây dựng các chuỗi (string) lớn, nhanh hơn nhiều so với việc cộng chuỗi (string + string)
            StringBuilder sb = new StringBuilder();
            // Kiểm tra dữ liệu
            if (danhSachNguoiDung != null && danhSachNguoiDung.Count > 0)
            {
                // Lặp qua từng người dùng
                foreach (User user in danhSachNguoiDung)
                {
                    // Tạo ra các hàng <tr>...</tr bằng HTML
                    // Lặp foreach: Vòng lặp này chạy qua từng đổi tượng User có trong danhSachNguoiDung.
                    sb.Append("<tr>");
                    // Tạo HTML: Với mỗi người dùng, nó tự xây dựng 1 hàng <tr> của bảng HTML, chứa các ô <td> với thông tin của người dùng (ID, Họ, Tên, v.v).
                    sb.Append($"<td>{HttpUtility.HtmlEncode(user.Id.ToString())}</td>");
                    // Bảo mật (HttpUtility.HtmlEncode): Đây là 1 bước rất quan trọng. Hàm này mã hóa các dữ liệu của người dùng(ví dụ: chuyển ký tự < thành &lt;). Điều này 
                    // ngăn chặn một kiểu tấn công gọi là Cross-Site-Scripting (XSS). 
                    sb.Append($"<td>{HttpUtility.HtmlEncode(user.Surname)}</td>");
                    sb.Append($"<td>{HttpUtility.HtmlEncode(user.Name)}</td>");
                    sb.Append($"<td>{HttpUtility.HtmlEncode(user.Username)}</td>");
                    sb.Append($"<td>{HttpUtility.HtmlEncode(user.Email)}</td>");
                    sb.Append($"<td>{HttpUtility.HtmlEncode(user.Phone)}</td>");
                    sb.Append($"<td>{HttpUtility.HtmlEncode(user.QueQuan)}</td>");

                    sb.Append("</tr>");
                }
            }
            else // Nếu không có người dùng nào 
            {
                sb.Append("<tr><td colspan='8' style='text-align:center;'>No information.</td></tr>");
            }
            // Đưa chuỗi HTML vào trang web
            ltlUserTableBody.Text = sb.ToString();
            // Lấy toàn bộ chuỗi HTML (tất cả các hàng <tr> </tr> và "nhét" nó vào bên trong điều khiển aspx
        }
        protected void btnSearch_Click(object sender, ImageClickEventArgs e)
        {
        }
        protected void btnBackToLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LogIn.aspx");
        }
    }
}