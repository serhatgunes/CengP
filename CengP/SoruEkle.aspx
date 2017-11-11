<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.master" AutoEventWireup="true" CodeFile="SoruEkle.aspx.cs" Inherits="Yazar_SoruEkle" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <!-- Start Banner -->

                <div class="inner-banner blog">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="content">
                                    <h1>SORU EKLE</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- End Banner -->
                <div class="flex-container">
                    <div style="float: none; margin-left: 0px; margin-top: 0px;">
                        <div class="container-fluid">
                            <div class="block aling-center">
                                <div class="row">
                                    <div class="col-sm-12" style="background-color: lavender;">
                                        <br />
                                        <asp:Label ID="lblSec" runat="server" Text="Lütfen ders ve kategoriyi seçiniz." ForeColor="Red" Font-Bold="True"></asp:Label>
                                        <br />
                                        <br />
                                    </div>
                                </div>
                                <br />
                                <div class="row" style="background-color: lavender;">
                                    <div class="col-sm-6">
                                        <asp:Label ID="Label1" runat="server" Text="DERS" ForeColor="Red" Font-Bold="True"></asp:Label>
                                        <asp:ListBox ID="ListLessons" CssClass="form-control" OnSelectedIndexChanged="ListLessons_SelectedIndexChanged" Height="170px" AutoPostBack="True" runat="server" Font-Bold="True" ForeColor="#3AC0F2" Font-Size="Large"></asp:ListBox>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:Label ID="Label2" runat="server" Text="KATEGORİ" ForeColor="Red" Font-Bold="True"></asp:Label>
                                        <asp:ListBox ID="ListClass" CssClass="form-control" OnSelectedIndexChanged="ListSubject_SelectedIndexChanged" Height="170px" AutoPostBack="True" runat="server" Font-Bold="True" ForeColor="#3AC0F2" Font-Size="Large"></asp:ListBox>
                                        <br />
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-sm-12" style="background-color: lavender;">
                                        <br />
                                        <span id='Belgeler'></span>
                                        <asp:Label ID="Label3" runat="server" Text="EKLENECEK SORULARIN KATEGORİSİ  : " ForeColor="Red" Font-Bold="True"></asp:Label>
                                        <asp:Label ID="lblChoose" runat="server" ForeColor="DarkBlue" Font-Bold="True"></asp:Label>
                                        <asp:Label ID="lblSubId" runat="server" Visible="true" Font-Bold="True"></asp:Label>
                                        <asp:LinkButton ID="lnkClear" runat="server">(Yeni Konu Seç)</asp:LinkButton><br />
                                        <br />
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-sm-12" style="background-color: lavender;">
                                        <h3>Soru : </h3>
                                        <CKEditor:CKEditorControl ID="txtSoruEkle" runat="server"></CKEditor:CKEditorControl>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" Font-Bold="true" ErrorMessage="Lütfen Soru Girin" ControlToValidate="txtSoruEkle"></asp:RequiredFieldValidator><br />
                                        <asp:Label ID="lblError" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                                    </div>
                                </div>
                                <br />
                                <div class="row" style="background-color: lavender;">
                                    <div class="col-sm-3">
                                        <h3>A</h3>
                                        <asp:RadioButton ID="cvpA" runat="server" GroupName="cevap" />
                                        <asp:TextBox ID="cevapA" CssClass="form-control" placeholder="A Şıkkı" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" Font-Bold="true" ErrorMessage="*!" ControlToValidate="cevapA"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-sm-3">
                                        <h3>B</h3>
                                        <asp:RadioButton ID="cvpB" runat="server" GroupName="cevap" />
                                        <asp:TextBox ID="cevapB" CssClass="form-control" placeholder="B Şıkkı" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" Font-Bold="true" ErrorMessage="*!" ControlToValidate="cevapB"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-sm-3">
                                        <h3>C</h3>
                                        <asp:RadioButton ID="cvpC" runat="server" GroupName="cevap" />
                                        <asp:TextBox ID="cevapC" CssClass="form-control" placeholder="C Şıkkı" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" Font-Bold="true" ErrorMessage="*!" ControlToValidate="cevapC"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-sm-3">
                                        <h3>D</h3>
                                        <asp:RadioButton ID="cvpD" runat="server" GroupName="cevap" />
                                        <asp:TextBox ID="cevapD" CssClass="form-control" placeholder="D Şıkkı" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" Font-Bold="true" ErrorMessage="*!" ControlToValidate="cevapD"></asp:RequiredFieldValidator>
                                        <br />
                                        <br />
                                    </div>
                                </div>
                                <br />
                                <div class="row" style="background-color: lavender;">
                                    <br />
                                    <div class="col-sm-12">
                                        <asp:LinkButton ID="Button1" Width="50%" runat="server" OnClick="Soruekle_Click" CssClass="btn">Yenİ Soru Ekle <span class="icon-more-icon"></span></asp:LinkButton>

                                        <br />
                                        <br />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <footer>
                        <asp:Label ID="lblResults" runat="server"></asp:Label>
                    </footer>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <script type="text/javascript">
            function customvalidator1_ClientValidate(source, args) {
                if (document.getElementById("<%= cvpA.ClientID %>").checked || document.getElementById("<%= cvpB.ClientID %>").checked) {
                args.IsValid = true;
            }
            else {
                args.IsValid = false;
            }
        }
        </script>
        <script>
            function Func() {
                var offsets = $('#Belgeler').offset();
                var top = offsets.top;
                $('body,html').animate({ scrollTop: top }, 1500);
            };
        </script>
    </form>
</asp:Content>

