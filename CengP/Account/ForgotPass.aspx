<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPass.aspx.cs" Inherits="Account_ForgotPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0; maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
    <title>Şifremi Unuttum</title>
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
                    <h1>PAROLA SIFIRLA</h1>
                </div>
                <div class="cnt-block">
                    <form action="#" id="FORM1" method="get" class="form-outer" runat="server">
                        <asp:TextBox ID="txtEmail" runat="server" placeholder="MAİL ADRESİNİZ"></asp:TextBox>
                        <div class="button-outer">
                            <asp:LinkButton ID="btnPassword" runat="server" OnClick="forgotpass_Click" CssClass="btn">Parola Gönder <span class="icon-more-icon"></span></asp:LinkButton>
                            <div class="or hidden-xs"></div>
                            <a href="Login.aspx" class="forgot"><span>?</span>Giriş Yap</a>
                            <br />
                            <asp:Label ID="lblforgotpass" runat="server" Text="Label" Font-Bold="True" ForeColor="Red"></asp:Label>
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
