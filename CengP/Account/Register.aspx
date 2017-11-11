<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0; maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
    <title>Kayıt Ol</title>
    <!-- Reset CSS -->
    <link href="../css/reset.css" rel="stylesheet" type="text/css" />
    <!-- Custom Fonts -->
    <link href="../css/fonts.css" rel="stylesheet" type="text/css" />
    <!-- Bootstrap -->
    <link href="../assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Select2 -->
    <link href="../assets/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome -->
    <link href="../assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Iconmoon -->
    <link href="../assets/iconmoon/css/iconmoon.css" rel="stylesheet" type="text/css" />
    <!-- Date Picker -->
    <link href="../assets/datepicker/css/datepicker.css" rel="stylesheet" type="text/css" />
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
    <!-- Start apply online -->
    <section class="login-wrapper register" style="background-image: url(login-giris.jpg)">
        <div class="inner">
            <div class="regiter-inner">
                <div class="head-block">
                    <h1>kayıt ol</h1>
                </div>
                <div class="cnt-block">
                    <form action="#" method="get" id="form1" runat="server" class="form-outer">
                        <div class="row">
                            <div class="col-sm-6">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Kullanıcı adı girin." ForeColor="Red" ControlToValidate="username" Font-Bold="True"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="username" placeholder="Kullanıcı Adın" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-sm-6">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Ad ve soyad girin." ForeColor="Red" ControlToValidate="fullname" Font-Bold="True"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="fullname" placeholder="Adın Soyadın" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Şifre girin." ForeColor="Red" ControlToValidate="password" Font-Bold="True" Font-Italic="False"></asp:RequiredFieldValidator>

                                <asp:TextBox ID="password" placeholder="Şİfren" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="col-sm-6">
                                <asp:CompareValidator ID="CompareValidator1" runat="server"
                                    ErrorMessage="*Şifre eşleşmedi."
                                    ControlToValidate="repassword"
                                    ControlToCompare="password"
                                    ForeColor="red" Font-Bold="True"></asp:CompareValidator>
                                <asp:TextBox ID="repassword" placeholder="Şİfre Tekrar" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="!*" ForeColor="Red" ControlToValidate="email" Font-Bold="True" ValidationExpression="\w+([-+.’]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*E-mail girin." ForeColor="Red" ControlToValidate="email" Font-Bold="True" Font-Italic="False"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="email" placeholder="E Maİl Adresİn" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-sm-6">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Okulunuzu girin." ForeColor="Red" ControlToValidate="school" Font-Bold="True" Font-Italic="False"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="school" placeholder="Okulun" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="button-outer">
                            <asp:LinkButton ID="LinkButton1" OnClick="register_Click" CssClass="btn" runat="server">Kayıt Ol <span class="icon-more-icon"></span></asp:LinkButton>
                            <asp:Label ID="lblError" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- End apply online -->

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <!-- Bootsrap JS -->
    <script type="text/javascript" src="../assets/bootstrap/js/bootstrap.min.js"></script>
    <!-- Select2 JS -->
    <script type="text/javascript" src="../assets/select2/js/select2.min.js"></script>
    <!-- Date Picker JS -->
    <script type="text/javascript" src="../assets/datepicker/js/datepicker.js"></script>
    <!-- Custom JS -->
    <script type="text/javascript" src="../js/custom.js"></script>
</body>
</html>
