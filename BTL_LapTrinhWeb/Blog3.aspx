<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Blog3.aspx.cs" Inherits="BTL_LapTrinhWeb.Blog3" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="~/Assets/css/Blog.css" />
    <title>Blog 3</title>
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
                <h1>Air Jordan 4 Retro Off-White “Sail”: When Luxury Meets Streetwear Perfection</h1>
                
                <div class="main_images">
                    <asp:Image runat="server" ImageUrl="~/Assets/images/Trangchu/blog_img3.png" alt="Air Jordan 4 Retro Off-White Sail" />
                </div>
                
                <div class="main_content">
                
                    <p>Some sneakers go beyond hype — they define eras. The Air Jordan 4 Retro Off-White “Sail”, designed by the late Virgil Abloh, is one of those rare masterpieces that blur the line between fashion and function. Released in 2020, this collaboration between Off-White and Jordan Brand didn’t just drop into the sneaker world — it elevated it.</p>

                    <h2>1. A Legacy of Vision and Creativity</h2>
                    <p>Virgil Abloh’s partnership with Nike under “The Ten” series was revolutionary, reinterpreting iconic silhouettes through the lens of deconstruction and transparency. After the success of the Air Jordan 1 Off-White “Chicago,” fans craved another classic reimagined by Virgil.</p>
                    <p>Enter the Air Jordan 4 “Sail” — a women’s exclusive that transcended gender boundaries. Soft, luxurious, and conceptually brilliant, it captures the essence of Abloh’s design philosophy: “question everything.”</p>
                    <p>Every element of the shoe reflects that approach — from the exposed foam collars to the industrial text print on the medial side — transforming a court legend into a modern art piece.</p>

                    <h2>2. Design Breakdown: Minimalism in Motion</h2>
                    <p>The Off-White x Air Jordan 4 “Sail” redefines minimalism. The tone, the materials, and the detailing all work in harmony to create a sneaker that feels futuristic yet timeless.</p>
                    <ul>
                        <li><strong>Colorway:</strong> A monochromatic Sail palette — a creamy beige tone that embodies elegance and versatility.</li>
                        <li><strong>Upper:</strong> Premium nubuck and mesh create a tactile blend of textures, offering both durability and a luxe aesthetic.</li>
                        <li><strong>Details:</strong>
                            <ul>
                                <li>Exposed foam edges reveal Abloh’s signature unfinished look.</li>
                                <li>The iconic “AIR” text printed near the midsole is both playful and bold — a wink to sneaker insiders.</li>
                                <li>The zip tie in soft cream completes the Off-White signature touch.</li>
                            </ul>
                        </li>
                        <li><strong>Midsole:</strong> The translucent rubber and visible Air cushioning ensure that performance meets fashion.</li>
                    </ul>
                    <p>It’s a sneaker that whispers luxury rather than shouting hype — understated, yet impossible to ignore.</p>

                    <h2>3. The Meaning Behind the Design</h2>
                    <p>Virgil Abloh described his design language as “remixing the classics.” He wanted to make sneakers that invite conversation, not just admiration.</p>
                    <p>The AJ4 “Sail” does exactly that — it celebrates imperfection. The raw stitching, the text labeling, and the exposed components remind us that beauty lies in process and authenticity.</p>
                    <p>This philosophy — merging streetwear and haute couture — cemented Abloh’s role as a visionary who changed not only fashion but also the cultural value of sneakers.</p>

                    <h2>4. Comfort and Performance</h2>
                    <p>While many treat the Off-White AJ4 “Sail” as a collector’s item, it’s still built for comfort. The Air unit in the midsole offers responsive cushioning, and the padded collar provides secure ankle support.</p>
                    <p>The fit feels light and breathable, perfect for casual wear or styling, though few sneakerheads dare to scuff such an artful pair.</p>

                    <h2>5. Release and Resale Impact</h2>
                    <p>Released on July 25, 2020, at a retail price of $200 USD, the shoe instantly sold out worldwide. Demand was astronomical — not only because of Virgil’s influence but also because the colorway resonated deeply with both sneaker enthusiasts and the fashion community.</p>
                    <p>Within weeks, resale prices skyrocketed, reaching $1,000–$1,800 USD depending on size. Even years later, the “Sail” remains one of the most coveted pairs in the Off-White x Nike legacy — a true grail.</p>

                    <h2>6. Styling the “Sail”</h2>
                    <p>The beauty of the Sail colorway lies in its versatility. Whether paired with streetwear staples like oversized hoodies and cargos or elevated fashion fits like neutral suits and skirts, it delivers sophistication with a laid-back edge.</p>
                    <p>The sneaker embodies the phrase “less is more.” It complements rather than competes, allowing the wearer’s personality to shine through.</p>

                    <h2>7. A Tribute to Virgil Abloh</h2>
                    <p>Following Virgil Abloh’s passing in 2021, the Off-White “Sail” took on even deeper meaning. It became more than just a sneaker — it became a tribute to his genius, creativity, and lasting influence on design.</p>
                    <p>Every pair now feels like a piece of history, a reminder of what happens when art, culture, and sport collide.</p>

                    <h2>8. Final Verdict</h2>
                    <p>The Air Jordan 4 Retro Off-White “Sail” is a masterpiece — elegant, raw, and visionary. It’s more than a shoe; it’s an artifact of the modern fashion era. Virgil Abloh didn’t just design sneakers — he told stories through them, and this one speaks volumes.</p>
                    <p>Whether displayed in a glass case or worn with pride, the “Sail” reminds us that true innovation is not about following trends — it’s about redefining them.</p>

                </div>
                <div class="shop_link_container">
                    <asp:HyperLink ID="lnkGoToShop" CssClass="link_shop_css" runat="server" 
                           NavigateUrl="~/Product_Detail.aspx?type=women&id=16" 
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

