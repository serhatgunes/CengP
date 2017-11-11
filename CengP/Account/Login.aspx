<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0; maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
    <title>Giriş Yap</title>
    <!-- Reset CSS -->
    <link href="../css/reset.css" rel="stylesheet" type="text/css" />
    <!-- Custom Fonts -->
    <link href="../css/fonts.css" rel="stylesheet" type="text/css" />
    <!-- Bootstrap -->
    <link href="../assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome -->
    <link href="../assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Iconmoon -->
    <link href="../assets/iconmoon/css/iconmoon.css" rel="stylesheet" type="text/css" />
    <!-- Custom Style -->
    <link href="../css/custom.css" rel="stylesheet" type="text/css" />
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.min.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<body class="fill-bg">
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

    <!-- Start Login -->
    <section class="login-wrapper" style="background-image: url(login-giris.jpg)">
        <div class="inner">
            <div class="login">
                <div class="head-block">
                    <h1>GİRİS YAP</h1>
                </div>
                <div class="cnt-block">
                    <form action="#" id="FORM1" method="get" class="form-outer" runat="server">
                        <asp:TextBox ID="recipientname" runat="server" placeholder="Kullanıcı Adınız"></asp:TextBox>
                        <asp:TextBox ID="pass_word" runat="server" placeholder="ŞİFRENİZ" TextMode="Password"></asp:TextBox>
                        <div class="button-outer">
                            <asp:LinkButton ID="btnLogin" runat="server" OnClick="login_Click" CssClass="btn">GİRİS Yap <span class="icon-more-icon"></span></asp:LinkButton>
                            <div class="or hidden-xs"></div>
                            <asp:LinkButton ID="btnRegister" runat="server" CssClass="btn register" PostBackUrl="~/Account/Register.aspx">Kayıt Ol <span class="icon-more-icon"></span></asp:LinkButton><br />
                            <asp:Label ID="lblgiris" runat="server" Text="Label" Font-Bold="True" ForeColor="Red"></asp:Label>
                            <asp:Label ID="mid" runat="server" Text="Label" Visible="False"></asp:Label>
                        </div>
                        <div class="remember">
                            <div class="check">
                                <input type="checkbox" id="test1" />
                                <label for="test1">Benİ Hatırla</label>
                            </div>
                            <a href="ForgotPass.aspx" class="forgot"><span>?</span>Sİfremİ Unuttum</a>
                        </div>
                    </form>
                </div>
                <div class="login-footer">
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
        </div>
    </section>

    <!-- End Login -->

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <!-- Bootsrap JS -->
    <script type="text/javascript" src="../assets/bootstrap/js/bootstrap.min.js"></script>
    <!-- Custom JS -->
    <script type="text/javascript" src="../js/custom.js"></script>
</body>
</html>
