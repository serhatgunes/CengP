<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.master" AutoEventWireup="true" CodeFile="Account.aspx.cs" Inherits="Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Start Banner -->

    <div class="inner-banner blog">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="content">
                        <h1>Hesabım Deneme Değişiklik ilk deneme bickbutket hayırlı olsun inşallah</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <!-- End Banner -->
    <form action="#" id="form1" runat="server" class="form-outer">

        <div class="container">
            <%-- Kullanıcı Bilgi --%>
            <div class="col-md-8 col-sm-12">
                <asp:Label ID="Label4" runat="server" Text="Kullanıcı Bilgileriniz" ForeColor="#0099FF" Font-Size="Medium" Font-Bold="True" Font-Italic="False"></asp:Label>
                <br />
                <asp:Label ID="lblResults" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                <br />
                <div class="row">
                    <div class="col-sm-6">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Kullanıcı adı girin." ForeColor="Red" ControlToValidate="username" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="username" placeholder="Kullanıcı Adın" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-sm-6">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Ad ve soyad girin." ForeColor="Red" ControlToValidate="fullname" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="fullname" placeholder="Adın Soyadın" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="!*" ForeColor="Red" ControlToValidate="email" Font-Bold="True" ValidationExpression="\w+([-+.’]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*E-mail girin." ForeColor="Red" ControlToValidate="email" Font-Bold="True" Font-Italic="False"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="email" placeholder="E Maİl Adresİn" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>
                    <div class="col-sm-6">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Okulunuzu girin." ForeColor="Red" ControlToValidate="school" Font-Bold="True" Font-Italic="False"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="school" placeholder="Okulun" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="button-outer">
                            <asp:LinkButton ID="LinkButton1" CssClass="btn" OnClick="userinfoUpdate" runat="server">Güncelle <span class="icon-more-icon"></span></asp:LinkButton>
                        </div>
                    </div>
                    <div class="col-sm-6">

                        <asp:Label ID="lblError" runat="server" Text="Label" Font-Bold="True"></asp:Label>

                    </div>
                </div>
            </div>
            <%-- Fotoğraf Bilgi --%>
            <div class="col-md-4 col-sm-12">
                <asp:Label ID="Label3" runat="server" Text="Profil Fotoğrafınız" ForeColor="#0099FF" Font-Size="Medium" Font-Bold="True" Font-Italic="False"></asp:Label><br />
                <asp:Label ID="lblBilgi" runat="server" Text="Label" Font-Bold="True"></asp:Label>

                <asp:GridView ID="GridView1" BorderColor="Transparent" runat="server" AutoGenerateColumns="false"
                    Font-Names="Arial">
                    <Columns>
                        <asp:ImageField DataImageUrlField="FilePath" ControlStyle-CssClass="form-control" ControlStyle-Width="120"
                            ControlStyle-Height="130" />
                    </Columns>
                </asp:GridView>


                <asp:FileUpload ID="FileUpload1" runat="server" />
                <div class="button-outer">
                    <asp:LinkButton ID="LinkButton3" CssClass="btn" OnClick="PhotoUpload_Click" runat="server">Yükle <span class="icon-more-icon"></span></asp:LinkButton>
                </div>
            </div>
        </div>
        <br />
        <br />
        <div class="container">
            <%-- Şifre Bilgi --%>
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="col-sm-3">
                        <asp:Label ID="Label2" runat="server" Text="Şifre Bilgileriniz" ForeColor="#0099FF" Font-Size="Medium" Font-Bold="True" Font-Italic="False"></asp:Label>
                        <br />
                        <asp:Label ID="lblPass" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                        <br />
                        <label>Eski Şifreniz</label>
                        <asp:Label ID="lbloldPass" ForeColor="Red" runat="server" Text="Label" Visible="False" Font-Bold="True"></asp:Label>

                        <asp:TextBox ID="oldpassword" TextMode="Password" runat="server" CssClass="form-control" placeholder="**********" Font-Bold="True"></asp:TextBox>

                    </div>
                    <div class="col-sm-3"><br /><br />
                        <label>Yeni Şifreniz</label>
                        <asp:Label ID="lblnewPass" ForeColor="Red" runat="server" Text="Label" Visible="False" Font-Bold="True"></asp:Label>

                        <asp:TextBox ID="newpassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="**********" Font-Bold="True"></asp:TextBox>

                    </div>
                    <div class="col-sm-3"><br /><br />
                        <label>Yeni Şifreniz Tekrar</label>
                        <asp:CompareValidator ID="CompareValidator1" runat="server"
                            ErrorMessage="!*"
                            ControlToValidate="repassword"
                            ControlToCompare="newpassword"
                            ForeColor="red" Font-Bold="True"></asp:CompareValidator>
                        <asp:TextBox ID="repassword" TextMode="Password" runat="server" CssClass="form-control" placeholder="**********" Font-Bold="True"></asp:TextBox>
                    </div>
                    <div class="col-sm-3"><br /><br /><br />
                        <div class="button-outer">
             
                            <asp:LinkButton ID="LinkButton2" CssClass="btn" OnClick="userPassUpdate" runat="server">Güncelle <span class="icon-more-icon"></span></asp:LinkButton><br />
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>
    <br />


</asp:Content>

