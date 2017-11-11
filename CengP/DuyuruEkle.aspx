<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.master" AutoEventWireup="true" CodeFile="DuyuruEkle.aspx.cs" Inherits="DuyuruEkle" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Start Banner -->

    <div class="inner-banner blog">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="content">
                        <h1>duyuru ekle</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- End Banner -->
    <form id="form1" runat="server" class="form-outer">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="container-fluid" style="background-color:lavender">
                    <div class="newsletter-area">
                        <div class="search-full-width">
                            <br />
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3 col-sm-12" >
                                    <div class="block aling-center">
                                        <asp:Label ID="Label1" runat="server" Text="Başlık" Font-Bold="True"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Duyuru Başlığı Girin." ControlToValidate="txtBaslik" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator><br />

                                        <br />
                                        <asp:TextBox ID="txtBaslik" placeholder="BAŞLIK" CssClass="form-control" runat="server"></asp:TextBox>
                                        <asp:Label ID="Label2" runat="server" Text="Duyuru" Font-Bold="True"></asp:Label>

                                        <br />
                                        <CKEditor:CKEditorControl ID="txtDuyuru" runat="server"></CKEditor:CKEditorControl>
                                        <br />

                                        <div class="button-outer">
                                            <asp:LinkButton ID="LinkButton1" OnClick="btnDuyuru_Click" CssClass="btn" runat="server">Duyuru Ekle <span class="icon-more-icon"></span></asp:LinkButton>
                                        </div>
                                        <asp:Label ID="lblError" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <br />
                        </div>
                    </div>
                </div>


            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>

