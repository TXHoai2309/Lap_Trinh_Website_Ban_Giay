# IT Shoes - Hệ Thống Thương Mại Điện Tử Giày Dép 👟

![Project Status](https://img.shields.io/badge/Status-Completed-success)
![Technology](https://img.shields.io/badge/Technology-ASP.NET_Web_Forms-blue)
![Framework](https://img.shields.io/badge/Framework-.NET_4.7.2-purple)

**IT Shoes** là đồ án Bài Tập Lớn (BTL) môn Lập trình Web, mô phỏng một hệ sinh thái thương mại điện tử hoàn chỉnh dành cho các tín đồ giày dép. Dự án không chỉ dừng lại ở giao diện bán hàng mà còn đi sâu vào xử lý logic nghiệp vụ phức tạp phía máy chủ (Server-side) kết hợp với tương tác người dùng mượt mà phía trình duyệt (Client-side).

Điểm độc đáo nhất của dự án này là kiến trúc **"Server-Memory Database"**. Thay vì phụ thuộc vào SQL Server, toàn bộ dữ liệu được cấu trúc hóa và lưu trữ trực tiếp trên RAM máy chủ, cho phép tốc độ truy xuất cực nhanh và dễ dàng triển khai trên mọi môi trường mà không cần cài đặt cơ sở dữ liệu phức tạp.

---

## 📋 Mục Lục

1. [Tổng Quan Dự Án](#-tổng-quan-dự-án)
2. [Kiến Trúc Hệ Thống](#-kiến-trúc-hệ-thống)
3. [Chi Tiết Tính Năng & Nghiệp Vụ](#-chi-tiết-tính-năng--nghiệp-vụ)
    - [Phân Hệ Khách Hàng](#1-phân-hệ-khách-hàng-client)
    - [Phân Hệ Quản Trị](#2-phân-hệ-quản-trị-admin)
4. [Quy Tắc Xác Thực (Validation Rules)](#-quy-tắc-xác-thực-validation-rules)
5. [Cài Đặt & Hướng Dẫn Sử Dụng](#-cài-đặt--hướng-dẫn-sử-dụng)
6. [Cấu Trúc Mã Nguồn](#-cấu-trúc-mã-nguồn)

---

## 🌟 Tổng Quan Dự Án

Dự án được xây dựng nhằm giải quyết bài toán mua sắm trực tuyến với hai đối tượng người dùng chính:
* **Khách hàng (Shoppers):** Cần một giao diện thân thiện để tìm kiếm, so sánh giá, xem ảnh chi tiết và đặt hàng nhanh chóng.
* **Quản trị viên (Store Owners):** Cần công cụ để cập nhật sản phẩm mới, quản lý thông tin khách hàng và theo dõi đơn hàng phát sinh.

**Mục tiêu kỹ thuật:**
* Làm chủ công nghệ **ASP.NET Web Forms**.
* Hiểu sâu về vòng đời của trang web (Page Lifecycle) và quản lý trạng thái (`Session`, `Application`, `Cookie`).
* Thực hiện xác thực dữ liệu chặt chẽ hai lớp (Client-side JavaScript & Server-side C#).

---

## 🏗 Kiến Trúc Hệ Thống

Dự án sử dụng mô hình **In-Memory Data Storage** (Lưu trữ dữ liệu trong bộ nhớ) để thay thế cho Database truyền thống.

| Thành phần | Vai trò & Cơ chế lưu trữ |
| :--- | :--- |
| **Global.asax** | Đóng vai trò như "khởi tạo database". Khi ứng dụng bắt đầu (`Application_Start`), nó tạo ra các danh sách `List<Product>`, `List<User>`, `List<Order>` và lưu vào biến toàn cục `Application`. |
| **Application State** | Lưu trữ dữ liệu dùng chung cho toàn bộ hệ thống: Danh sách sản phẩm, Tài khoản người dùng, Lịch sử đơn hàng, Đánh giá sản phẩm. Dữ liệu này tồn tại cho đến khi tắt máy chủ IIS. |
| **Session State** | Lưu trữ dữ liệu riêng tư của từng phiên người dùng: Giỏ hàng (`ShoppingCart`), Thông tin đăng nhập (`UserLoggedIn`). |
| **Cookies** | Lưu trữ tên đăng nhập để thực hiện tính năng "Ghi nhớ đăng nhập" (Remember Me) trên trình duyệt người dùng. |

---

## 🚀 Chi Tiết Tính Năng & Nghiệp Vụ

### 1. Phân Hệ Khách Hàng (Client)

#### A. Trải nghiệm Mua sắm (Shopping Experience)
* **Trang chủ (Home):** Hiển thị Banner quảng cáo, Top 4 sản phẩm bán chạy nhất (Best Sellers) và các bài viết tin tức mới nhất về thời trang.
* **Danh mục sản phẩm:**
    * Hệ thống phân chia rõ ràng: **Men** (Nam), **Women** (Nữ), **Kids** (Trẻ em) và **Sale** (Giảm giá).
    * **Bộ lọc thông minh (Filtering):**
        * Lọc theo loại: *Sneakers, Boots, Sports, Lifestyles/Casual*.
        * Lọc theo giá: *Dưới $100, $100 - $500, Trên $500*.
    * **Sắp xếp (Sorting):** Theo Tên (A-Z, Z-A) hoặc Giá (Tăng dần, Giảm dần).
* **Tìm kiếm (Search):** Thanh tìm kiếm toàn cục trên Header cho phép tìm sản phẩm theo tên ở bất kỳ trang nào.

#### B. Chi Tiết Sản Phẩm (Product Detail)
* Hiển thị đầy đủ thông tin: Tên, Giá gốc, Giá khuyến mãi (tự động tính toán), Mô tả chi tiết.
* **Thư viện ảnh động:** Cho phép xem 5 góc độ của giày (Chính, Trái, Phải, Trên, Dưới). Nhấp vào ảnh nhỏ để đổi ảnh lớn.
* **Hệ thống Reviews (Đánh giá):**
    * Hiển thị số sao trung bình.
    * **Logic nghiệp vụ:** Chỉ những người dùng **đã đăng nhập** và **đã mua sản phẩm này** (kiểm tra trong lịch sử đơn hàng) mới được quyền viết đánh giá.
    * Người dùng có quyền sửa/xóa đánh giá của chính mình.

#### C. Giỏ hàng & Thanh toán (Cart & Checkout)
* **Giỏ hàng:**
    * Thêm sản phẩm với tùy chọn **Size** và **Số lượng**.
    * Xem lại giỏ hàng, tự động tính tổng tiền (Subtotal) và xóa sản phẩm không ưng ý.
* **Thanh toán (Checkout):**
    * Yêu cầu đăng nhập để thanh toán.
    * **Auto-fill:** Tự động điền thông tin cá nhân (Tên, Email, SĐT) vào form thanh toán nếu đã có trong hồ sơ.
    * Xử lý đơn hàng: Tạo mã đơn hàng duy nhất (`ORD-YYYYMMDD-XXXX`), lưu đơn hàng vào hệ thống, xóa giỏ hàng và chuyển hướng đến trang Cảm ơn.

#### D. Quản lý Tài khoản (My Account)
* **Cập nhật thông tin:** Cho phép người dùng bổ sung địa chỉ giao hàng, quê quán.
* **Lịch sử đơn hàng:** Xem lại danh sách các đơn hàng đã đặt, bao gồm ngày đặt, chi tiết sản phẩm và tổng tiền.

### 2. Phân Hệ Quản Trị (Admin)

Truy cập thông qua tài khoản `admin`.

* **Quản lý Sản phẩm (Product Management):**
    * Giao diện `GridView` trực quan hiển thị toàn bộ sản phẩm.
    * **Thêm mới:** Form nhập liệu chi tiết hỗ trợ upload đồng thời 5 hình ảnh lên máy chủ.
    * **Sửa/Xóa:** Cập nhật thông tin giá, khuyến mãi hoặc xóa sản phẩm khỏi hệ thống (có popup xác nhận an toàn).
* **Quản lý Người dùng (User Management):**
    * Hiển thị danh sách dạng bảng (`Table`) tất cả người dùng đã đăng ký.
    * **Tính năng tương tác:** Sử dụng JavaScript để cho phép Admin nhấp vào một dòng để ẩn thông tin người dùng đó (*Click-to-hide*).
    * Nút **"Hiển thị lại tất cả"** để reset trạng thái hiển thị của bảng.

---

## 🔒 Quy Tắc Xác Thực (Validation Rules)

Dự án áp dụng cơ chế kiểm tra dữ liệu nghiêm ngặt ở cả 2 lớp (Front-end & Back-end) để đảm bảo tính toàn vẹn dữ liệu.

| Trường dữ liệu | Quy tắc xác thực |
| :--- | :--- |
| **Tên đăng nhập** | Tối thiểu 5 ký tự. Không được trùng với tài khoản đã có. |
| **Mật khẩu** | Tối thiểu 6 ký tự. Phải khớp với ô "Xác nhận mật khẩu". |
| **Email** | Phải đúng định dạng email (Regex: `... @gmail.com`). |
| **Số điện thoại** | Phải là 10 chữ số, bắt đầu bằng số 0. |
| **CCCD** | **Bắt buộc đúng 12 chữ số** (Regex: `^\d{12}$`). |
| **Mã định danh** | Định dạng đặc biệt: **3 chữ hoa, 2 số, kết thúc bằng @** (Ví dụ: `ABC12@`). |
| **Quê quán** | Không được để trống, không được có ký tự số và ký tự đặc biệt. |
| **Giới tính** | Bắt buộc chọn từ danh sách (Nam/Nữ/Khác). |

---

## ⚙️ Cài Đặt & Hướng Dẫn Sử Dụng

### Yêu cầu hệ thống
* **IDE:** Visual Studio 2019 hoặc 2022.
* **Framework:** .NET Framework 4.7.2.

### Các bước cài đặt
1.  **Tải mã nguồn:** Clone repository hoặc giải nén file ZIP dự án.
2.  **Mở dự án:** Khởi động Visual Studio, chọn `Open Project/Solution` và tìm file `BTL_LapTrinhWeb.sln`.
3.  **Build dự án (Quan trọng):**
    * Vào menu **Build** > chọn **Rebuild Solution**.
    * *Lưu ý:* Bước này bắt buộc để đảm bảo các logic xác thực mới (như CCCD 12 số) được biên dịch lại thành file `.dll`.
4.  **Chạy dự án:** Nhấn phím **F5** hoặc nút **IIS Express (Google Chrome)** trên thanh công cụ.

### Tài khoản Demo
Hệ thống đã khởi tạo sẵn dữ liệu mẫu. Bạn có thể sử dụng ngay:

* **Tài khoản Admin:**
    * User: `admin`
    * Pass: `12345678`
* **Tài khoản Khách:**
    * Bạn vui lòng vào trang **Sign In** để đăng ký tài khoản mới và trải nghiệm quy trình validation.

---

## 📂 Cấu Trúc Mã Nguồn

```bash
BTL_LapTrinhWeb/
├── Admin/                  # Các trang dành riêng cho Admin
│   ├── Admin.aspx          # Quản lý sản phẩm (List/Edit/Delete)
│   ├── AdminAddProduct.aspx # Thêm sản phẩm mới
│   └── ManageUser.aspx     # Quản lý người dùng
├── Assets/                 # Tài nguyên tĩnh
│   ├── css/                # Các file định kiểu (.css) cho từng trang
│   └── images/             # Kho hình ảnh sản phẩm (được chia folder Men/Women/Kids)
├── Models/                 # Các lớp định nghĩa dữ liệu (C# Classes)
│   ├── Products.cs         # Cấu trúc sản phẩm
│   ├── User.cs             # Cấu trúc người dùng (gồm cả CCCD, MaDinhDanh...)
│   ├── Order.cs            # Cấu trúc đơn hàng
│   ├── CartItem.cs         # Cấu trúc một món trong giỏ
│   └── Review.cs           # Cấu trúc đánh giá
├── Global.asax             # Nơi khởi tạo dữ liệu mẫu (Application_Start)
├── Root Files              # Các trang người dùng
│   ├── Trangchu.aspx       # Trang chủ
│   ├── Men.aspx, Women.aspx... # Trang danh mục
│   ├── Product_Detail.aspx # Trang chi tiết & Review
│   ├── Cart.aspx, Checkout.aspx # Giỏ hàng & Thanh toán
│   └── SignIn.aspx, Login.aspx # Đăng ký & Đăng nhập
└── Web.config              # Cấu hình hệ thống# BTL_LTW
