<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.master" AutoEventWireup="true" CodeFile="Profilim.aspx.cs" Inherits="Profilim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="inner-banner blog">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="content">
                        <h1>profİlİm</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <form action="#" id="form1" runat="server" class="form-outer">
        <section class="privacy-wrapper">
            <br />
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <asp:Label ID="Label1" runat="server" Text="Önceki Başarılarım" ForeColor="#0099FF" Font-Size="Medium" Font-Bold="True" Font-Italic="False"></asp:Label><br />

                        <ul class="privacy-listing">
                            <li>Çözdüğüm soru sayısı :</li>
                            <li>Toplam olduğum sınav sayısı :
            <ul>
                <li><b>Mükemmel :</b></li>
                <li><b>Orta :</b></li>
                <li><b>Zayıf :</b></li>
            </ul>
                            </li>
                            <li>Sorduğum soru sayısı :</li>
                            <li>Toplam Puanım :</li>
                        </ul>
                    </div>
                    <div class="col-sm-3">
                        <br />
                        <ul class="privacy-listing">
                            <li>
                                <asp:Label ID="lblSoru" runat="server"></asp:Label></li>
                            <li>
                                <asp:Label ID="lblSinav" runat="server"></asp:Label>
                                <ul>
                                    <li>
                                        <asp:Label ID="lblukemel" Font-Bold="true" ForeColor="green" runat="server"></asp:Label></li>
                                    <li>
                                        <asp:Label ID="lblOrta" Font-Bold="true" ForeColor="blue" runat="server"></asp:Label></li>
                                    <li>
                                        <asp:Label ID="lblZayıf" Font-Bold="true" ForeColor="red" runat="server"></asp:Label></li>
                                </ul>
                            </li>
                            <li>
                                <asp:Label ID="lblSordugumSoru" runat="server"></asp:Label></li>
                            <li>
                                <asp:Label ID="ToplamPuan" runat="server"></asp:Label></li>
                        </ul>
                    </div>
                    <div class="col-sm-6">
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
                            <asp:LinkButton ID="LinkButton3" CssClass="btn"  runat="server">Yükle <span class="icon-more-icon"></span></asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
            <br />
        </section>
    </form>
</asp:Content>

