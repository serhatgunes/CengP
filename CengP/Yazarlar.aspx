﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Yazarlar.aspx.cs" Inherits="Yazarlar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bilgisayar Mühendisleri Platformu</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0; maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
    <!-- Reset CSS -->
    <link href="css/reset.css" rel="stylesheet" type="text/css" />
    <!-- Custom Fonts -->
    <link href="css/fonts.css" rel="stylesheet" type="text/css" />
    <!-- Bootstrap -->
    <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Select2 -->
    <link href="assets/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome -->
    <link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Magnific Popup -->
    <link href="assets/magnific-popup/css/magnific-popup.css" rel="stylesheet" type="text/css" />
    <!-- Iconmoon -->
    <link href="assets/iconmoon/css/iconmoon.css" rel="stylesheet" type="text/css" />
    <!-- Owl Carousel -->
    <link href="assets/owl-carousel/css/owl.carousel.min.css" rel="stylesheet" type="text/css" />
    <!-- Animate -->
    <link href="css/animate.css" rel="stylesheet" type="text/css" />
    <!-- Custom Style -->
    <link href="css/custom.css" rel="stylesheet" type="text/css" />
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.min.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->

</head>
<body>
    <form id="form1" runat="server">
        <!-- Start Preloader -->
        <div id="loading">
            <div class="element">
                <div class="sk-folding-cube">
                    <div class="sk-cube1 sk-cube"></div>
                    <div class="sk-cube2 sk-cube"></div>
                    <div class="sk-cube4 sk-cube"></div>
                    <div class="sk-cube3 sk-cube"></div>
                </div>
            </div>
        </div>
        <!-- End Preloader -->
        <!-- Start Header -->
        <header>
            <!-- Start Header top Bar -->
            <div class="header-top">
                <div class="container clearfix">
                    <ul class="top-nav hidden-xs">
                        <li><a href="İçerikEkle.aspx">İçerİk Ekle</a></li>
                        <li><a href="SoruEkle.aspx">Soru Ekle</a></li>
                        <li><a href="DuyuruEkle.aspx">Duyuru Ekle</a></li>
                    </ul>

                    <div class="right-block clearfix">
                        <ul class="top-nav hidden-xs">
                            <li><a href="Account.aspx">Hesabım</a></li>
                            <li><a href="#">Gelen Kutusu</a></li>
                            <li><a href="#">
                                <asp:Label ID="lblUsername" runat="server" Text=""></asp:Label>
                            </a></li>
                            <li><a href="Account/Logout.aspx">Çıkış Yap</a></li>
                        </ul>

                    </div>
                </div>
            </div>
            <!-- End Header top Bar -->
            <!-- Start Header Middle -->
            <div class="container header-middle">
                <div class="row">
                    <span class="col-xs-6 col-sm-3"><a href="Default.aspx">
                        <img src="images/cengplogo.png" class="img-responsive" alt=""></a></span>
                    <div class="col-xs-6 col-sm-3"></div>
                    <div class="col-xs-6 col-sm-9">
                        <div class="contact clearfix">
                            <ul class="hidden-xs">
                                <li>
                                    <div id="bx-pager">
                                        <a data-slide-index="0" href="#">
                                            <asp:ListView ID="ListView1" runat="server">
                                                <ItemTemplate>
                                                    <asp:Image ID="Image1" class="img-circle" runat="server" ImageUrl='<%#Eval("FilePath") %>' Width="55" Height="50" />
                                                </ItemTemplate>
                                            </asp:ListView>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Header Middle -->
            <!-- Start Navigation -->
            <nav class="navbar navbar-inverse">
                <div class="container">
                    <div class="navbar-header">
                        <button aria-controls="navbar" aria-expanded="false" data-target="#navbar" data-toggle="collapse" class="navbar-toggle collapsed" type="button"><span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                    </div>
                    <div class="navbar-collapse collapse" id="navbar">

                        <ul class="nav navbar-nav">
                            <li><a href="Default.aspx">Anasayfa</a></li>
                            <li><a href="Kategoriler.aspx">Kategorİler</a></li>
                            <li><a href="OnlineSinav.aspx">Onlİne testler</a></li>
                            <li><a href="Yazarlar.aspx">Yazarlar</a></li>
                            <li><a href="Puanlar.aspx">Puanlar</a></li>
                            <li><a href="Duyurular.aspx">Duyuru</a></li>
                            <li class="dropdown"><a data-toggle="dropdown" href="#">Kullanıcı <i class="fa fa-angle-down" aria-hidden="true"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="Sinavlarim.aspx">SINAVLARIM</a></li>
                                    <li><a href="Profilim.aspx">PROFİLİM</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End Navigation -->
        </header>
        <!-- End Header -->

        <!-- Start Banner -->

        <div class="inner-banner blog">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="content">
                            <h1>Yazarlar</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- End Banner -->

        <!-- Start Testimonial Section -->
        <section class="grey-bg padding-lg">
            <div class="container">
                <ul class="row testimonials">
                    <asp:ListView ID="ListView2" runat="server">
                        <ItemTemplate>
                            <li class="col-xs-6 col-sm-4 grid-item">
                                <div class="quotblock">
                                    <img src="<%#Eval("FilePath") %>" width="100" height="100" class="img-responsive img-circle" alt="" />
                                    <span class="icon-quote-left-icon"></span>
                                    <br />
                                    <asp:Label ID="Label1" ForeColor="Black" Font-Bold="true" Font-Size="Medium" runat="server" Text='<%#Eval("fullname") %>'></asp:Label>
                                    <span class="desig"><%#Eval("school") %></span>
                                    <p>
                                        <h3>Toplam Puan : <%#Eval("totalpoint") %></h3>
                                    </p>
                                </div>
                            </li>
                        </ItemTemplate>
                    </asp:ListView>
                </ul>
            </div>
        </section>
        <!-- End Testimonial Section -->

        <!-- Start Footer -->

        <footer class="footer">
            <!-- Start Footer Top -->
            <%--<div class="container">
            <div class="row row1">
                <div class="col-sm-9 clearfix">
                    <div class="foot-nav">
                        <h3>About US</h3>
                        <ul>
                            <li><a href="#">Edumart Group of Institutions</a></li>
                            <li><a href="#">Our Institutes and Universities</a></li>
                            <li><a href="#">Management Team</a></li>
                            <li><a href="#">Approval and Recognition</a></li>
                            <li><a href="#">Evaluation & Assessments</a></li>
                        </ul>
                    </div>
                    <div class="foot-nav">
                        <h3>Courses</h3>
                        <ul>
                            <li><a href="#">2 Year Online MBA General</a></li>
                            <li><a href="#">Certificate in HRM</a></li>
                            <li><a href="#">Certificate in Marketing</a></li>
                            <li><a href="#">Certificate in Finance</a></li>
                            <li><a href="#">Corporate Programs</a></li>
                        </ul>
                    </div>
                    <div class="foot-nav">
                        <h3>Why Edumart</h3>
                        <ul>
                            <li><a href="#">Introduction</a></li>
                            <li><a href="#">Learn Everywhere</a></li>
                            <li><a href="#">Modern Curriculum</a></li>
                            <li><a href="#">Placement Assistance</a></li>
                            <li><a href="#">Eligibility</a></li>
                        </ul>
                    </div>
                    <div class="foot-nav">
                        <h3>Learning Experience</h3>
                        <ul>
                            <li><a href="#">Course Preparations</a></li>
                            <li><a href="#">Guided lessons</a></li>
                            <li><a href="#">Interactive Practice</a></li>
                            <li><a href="#">Virtual Classroom</a></li>
                            <li><a href="#">Peer Learning</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="footer-logo hidden-xs">
                        <a href="Default.aspx">
                            <img src="images/altlogo.png" class="img-responsive" alt=""></a>
                    </div>
                    <p>© 2017 <span>CengP</span>. All rights reserved</p>

                </div>
            </div>
        </div>--%>
            <!-- End Footer Top -->
            <!-- Start Footer Bottom -->
            <div class="bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="connect-us">
                                <h3>Sosyal Medya</h3>
                                <ul class="follow-us clearfix">
                                    <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-youtube-play" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="subscribe">
                                <h3>Haberlerİ Kaçırma</h3>
                                <!-- Begin MailChimp Signup Form -->
                                <div id="mc_embed_signup">
                                    <form action="http://protechtheme.us16.list-manage.com/subscribe/post?u=cd5f66d2922f9e808f57e7d42&amp;id=ec6767feee" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>
                                        <div id="mc_embed_signup_scroll">
                                            <input type="email" value="" name="EMAIL" class="email" id="mce-EMAIL" placeholder="email adresiniz" required>
                                            <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
                                            <div style="position: absolute; left: -5000px;" aria-hidden="true">
                                                <input type="text" name="b_cd5f66d2922f9e808f57e7d42_ec6767feee" tabindex="-1" value="">
                                            </div>
                                            <div class="clear">
                                                <input type="submit" value="Subscribe" name="subscribe" id="mc-embedded-subscribe" class="button">
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <!--End mc_embed_signup-->
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="instagram">
                                <h3>GELİŞTİRİCİLER</h3>
                                <ul class="clearfix">
                                    <li>
                                        <figure>
                                            <img src="images/insta-img1.png" class="img-responsive" alt="" />
                                        </figure>
                                    </li>
                                    <li>
                                        <figure>
                                            <img src="images/insta-img2.png" class="img-responsive" alt="" />
                                        </figure>
                                    </li>
                                    <li>
                                        <figure>
                                            <img src="images/insta-img3.png" class="img-responsive" alt="" />
                                        </figure>
                                    </li>
                                    <li>
                                        <figure>
                                            <img src="images/insta-img4.png" class="img-responsive" alt="" />
                                        </figure>
                                    </li>
                                    <li>
                                        <figure>
                                            <img src="images/insta-img5.png" class="img-responsive" alt="">
                                        </figure>
                                    </li>
                                    <li>
                                        <figure>
                                            <img src="images/insta-img6.png" class="img-responsive" alt="">
                                        </figure>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Footer Bottom -->
        </footer>
        <!-- End Footer -->

        <!-- Scroll to top -->
        <a href="#" class="scroll-top"><i class="fa fa-chevron-up" aria-hidden="true"></i></a>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <!-- Bootsrap JS -->
        <script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
        <!-- Select2 JS -->
        <script type="text/javascript" src="assets/select2/js/select2.min.js"></script>
        <!-- Masonry JS -->
        <script type="text/javascript" src="assets/masonry/js/masonry.min.js"></script>
        <!-- Custom JS -->
        <script type="text/javascript" src="js/custom.js"></script>
    </form>
</body>
</html>
