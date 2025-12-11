<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Blog1.aspx.cs" Inherits="BTL_LapTrinhWeb.Blog1" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="~/Assets/css/Blog.css" />
    <title>Blog 1</title>
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
                <h1>The Air Jordan 1 Retro Low OG SP Fragment x Travis Scott: A Masterpiece of Modern Sneaker Culture</h1>
                
                <div class="main_images">
                    <asp:Image runat="server" ImageUrl="~/Assets/images/Trangchu/blog_img1.png" alt="Air Jordan 1 Low Fragment Travis Scott" />
                </div>

                <div class="main_content">
                
                    <p>When it comes to collaborations that shake up the sneaker world, few names command as much attention as Travis Scott and Fragment Design. Combine both with the timeless Air Jordan 1 silhouette, and you get a sneaker that transcends fashion — a cultural event in itself. The Air Jordan 1 Retro Low OG SP Fragment x Travis Scott is not just another limited-edition drop; it’s a collision of heritage, creativity, and hype.</p>

                    <h2>1. The Story Behind the Collaboration</h2>
                    <p>This sneaker is the product of a three-way collaboration between Nike’s Jordan Brand, Travis Scott, and Fragment Design, the label of legendary Japanese designer Hiroshi Fujiwara. Released in August 2021, the pair followed the success of the high-top version, continuing the partnership that began reshaping the modern streetwear scene.</p>
                    <p>Travis Scott’s influence brought his signature rebellious twist — the reversed Swoosh, a design element that’s now synonymous with his sneaker line. Meanwhile, Hiroshi Fujiwara infused the sneaker with Fragment’s minimalist, Japanese-inspired aesthetic. The result: a shoe that merges Houston’s hip-hop grit with Tokyo’s refined precision.</p>

                    <h2>2. Design and Aesthetics</h2>
                    <p>The Air Jordan 1 Low Fragment x Travis Scott is a lesson in balance. The sneaker’s colorway — Sail, Black, Military Blue, and Royal Blue — pays homage to Fragment’s classic palette while still feeling fresh and contemporary.</p>
                    <ul>
                        <li><strong>Upper:</strong> Crafted from premium leather, the upper features white panels contrasted by black overlays and a blue heel.</li>
                        <li><strong>Swoosh:</strong> The reverse Swoosh, in off-white, runs boldly across the lateral side, flipping tradition upside down.</li>
                        <li><strong>Branding:</strong> You’ll find Fragment’s signature double lightning bolt logo embossed on the heel alongside Cactus Jack branding — subtle yet iconic.</li>
                        <li><strong>Midsole:</strong> The pre-aged Sail midsole adds a touch of vintage charm, echoing the retro spirit of the original Air Jordan 1 from 1985.</li>
                    </ul>
                    <p>Every detail has intention — it’s not just design for aesthetics, but storytelling through material and shape.</p>

                    <h2>3. Symbolism and Cultural Impact</h2>
                    <p>The partnership between Travis Scott and Fragment marks a new chapter in sneaker culture. This collaboration symbolizes the fusion of East and West, where Fujiwara’s precision meets Travis’s creative chaos. More than that, it represents how sneakers have become cultural canvases — objects that express individuality, creativity, and status.</p>
                    <p>Upon release, this pair instantly became a grail for collectors and fashion enthusiasts alike. It was seen on celebrities, musicians, and influencers, solidifying its place in sneaker history. With resale prices soaring past $1,500 USD shortly after release, it became a statement of exclusivity as much as taste.</p>

                    <h2>4. Comfort and Wearability</h2>
                    <p>Despite its collectible status, the Fragment x Travis Scott Jordan 1 Low is surprisingly wearable. Thanks to the Air cushioning in the midsole and the soft leather upper, it provides the comfort expected from a premium Jordan release. Whether styled with baggy jeans or slim cargos, it delivers that effortless streetwear vibe Travis Scott embodies.</p>

                    <h2>5. Hype, Resale, and Legacy</h2>
                    <p>Like all Travis Scott collaborations, the hype was massive. Sneakerheads camped online for raffles, bots went wild, and resale platforms lit up within hours. On StockX, GOAT, and Flight Club, the shoe remains one of the most sought-after Jordan 1 Lows ever made.</p>
                    <p>But beyond resale numbers, the legacy of this sneaker lies in its storytelling. It shows how collaboration can push the boundaries of design — merging music, art, and fashion into a single object of desire.</p>

                    <h2>6. Final Thoughts</h2>
                    <p>The Air Jordan 1 Retro Low OG SP Fragment x Travis Scott isn’t just a sneaker — it’s a cultural icon. It bridges generations: from the basketball courts of the ‘80s to the stages of modern hip-hop. It unites worlds: American street culture and Japanese minimalism. And most importantly, it represents a moment when creativity had no boundaries.</p>
                    <p>In the end, whether you wear it, display it, or simply dream of owning it, one thing is certain: this sneaker stands as one of the most significant collaborations of the decade — a reminder that in sneaker culture, legends aren’t just born; they’re designed.</p>

                </div>
                <div class="shop_link_container">
                    <asp:HyperLink ID="lnkGoToShop" CssClass="link_shop_css" runat="server" 
                           NavigateUrl="~/Product_Detail.aspx?type=men&id=1" 
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
