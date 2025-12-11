<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Blog2.aspx.cs" Inherits="BTL_LapTrinhWeb.Blog2" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="~/Assets/css/Blog.css" />
    <title>Blog 2</title>
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

        <main>
            <div class="banner_sale">
                <a>Free standard delivery on orders over $30</a>
            </div>

            <div class="content">
                <h1>Puma LaMelo Ball MB.04 Lo “Alien Skin”: A Bold Leap Into the Future of Basketball Sneakers</h1>
                
                <div class="main_images">
                    <asp:Image runat="server" ImageUrl="~/Assets/images/Trangchu/blog_img2.png" alt="Puma LaMelo Ball MB.04 Lo Alien Skin" />
                </div>

                <div class="main_content">
                
                    <p>When it comes to merging style, innovation, and personality, few athletes have done it like LaMelo Ball. His partnership with Puma has redefined what a signature basketball shoe can be — not just performance gear, but a fashion statement born from another dimension. The latest release, the Puma MB.04 Lo “Alien Skin”, proves once again that LaMelo’s world is anything but ordinary.</p>

                    <h2>1. The Evolution of the MB Line</h2>
                    <p>The MB.04 Lo continues the legacy of LaMelo’s futuristic sneaker line that began with the MB.01 in 2021. Each model has told a story — “Not From Here”, “Rare”, “Galaxy” — and now, “Alien Skin” pushes that narrative into uncharted territory.</p>
                    <p>LaMelo Ball’s creative direction and Puma’s technology have evolved together, and the MB.04 feels like the perfect blend of performance and personality. It’s lighter, sleeker, and visually louder — a sneaker built to dominate both the court and the culture.</p>

                    <h2>2. Design: Alien Aesthetics Meet Court Functionality</h2>
                    <p>The first thing that hits you about the Alien Skin edition is its cosmic-inspired upper. The design mimics the texture of reptilian or extraterrestrial skin — a bold, organic pattern that glows with personality.</p>
                    <ul>
                        <li><strong>Colorway:</strong> The shoe comes in a striking mix of neon green, acidic yellow, and black hues that make it look straight out of another planet.</li>
                        <li><strong>Upper:</strong> A 3D-printed mesh overlay wraps the foot, giving it a sculpted, alien-like texture while maintaining breathability and flexibility.</li>
                        <li><strong>Midsole:</strong> The Nitro foam cushioning ensures responsiveness and explosive bounce — perfect for LaMelo’s fast, unpredictable playing style.</li>
                        <li><strong>Outsole:</strong> Its multi-directional traction pattern provides elite grip and stability, ideal for quick cuts, spins, and crossovers.</li>
                    </ul>
                    <p>Puma didn’t just design a shoe that looks cool — they engineered it for serious performance while making it look like an artifact from another world.</p>

                    <h2>3. Performance Breakdown</h2>
                    <p>LaMelo’s game is electric, and the MB.04 Lo is built to keep up. The Nitro-infused midsole delivers excellent energy return without feeling bulky. Players report that it’s noticeably lighter than the MB.03, improving speed and comfort during intense play.</p>
                    <p>The low-cut design gives players more ankle mobility, while the inner padding keeps the foot locked in. The Alien Skin upper, beyond its wild aesthetics, adapts to the foot’s shape and movement, offering a snug but breathable fit.</p>
                    <p>In short: this is a guard’s dream shoe — explosive, fast, and ultra-responsive.</p>

                    <h2>4. Style and Street Appeal</h2>
                    <p>Even off the court, the MB.04 “Alien Skin” turns heads. The alien-inspired pattern and luminous colorway make it perfect for streetwear styling. Paired with cargos, tech pants, or oversized hoodies, it’s a statement piece — a declaration that you don’t follow trends, you create them.</p>
                    <p>LaMelo’s “1 of 1” branding continues to appear subtly on the heel and tongue, reinforcing the message that individuality and confidence define both the player and his sneaker line.</p>

                    <h2>5. The Message: Not From Here, Still Rare</h2>
                    <p>Each LaMelo Ball sneaker carries the same underlying theme — being different is your superpower. “Alien Skin” is an evolution of that identity, symbolizing growth, transformation, and self-belief.</p>
                    <p>It’s more than a basketball shoe; it’s a reminder to embrace the out-of-this-world version of yourself — just like LaMelo has done in his rise to NBA stardom.</p>

                    <h2>6. Release and Resale Hype</h2>
                    <p>Released in 2024, the MB.04 Lo “Alien Skin” dropped at a retail price of $125 USD. It sold out quickly in most regions due to its unique design and LaMelo’s growing fanbase. On secondary markets like StockX and GOAT, pairs now list for $180–250 depending on size — proof that hype and performance can coexist when done right.</p>

                    <h2>7. Final Verdict</h2>
                    <p>The Puma LaMelo Ball MB.04 Lo “Alien Skin” isn’t just another player signature shoe — it’s a visual revolution. From its bold alien aesthetic to its top-tier court performance, it’s clear Puma and LaMelo are shaping a new era of basketball sneakers that celebrate personality as much as performance.</p>
                    <p>If you’re looking for a shoe that breaks conventions, commands attention, and plays as hard as it looks — the MB.04 “Alien Skin” might just be your next cosmic step forward.</p>

                </div>
                <div class="shop_link_container">
                    <asp:HyperLink ID="lnkGoToShop" CssClass="link_shop_css" runat="server" 
                           NavigateUrl="~/Product_Detail.aspx?type=men&id=6" 
                           Text="Go to Shop" />
                </div>
            </div>
            <div class="button_back">
                <asp:Button ID="btnBack" CssClass="button_back_css" runat="server" Text="Back to Home" OnClick="btnBackToHome_Click" />
            </div>
        </main>
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
</body>
</html>
