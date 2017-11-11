<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.master" AutoEventWireup="true" CodeFile="İçerikEkle.aspx.cs" Inherits="İçerikEkle" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <!-- Start Banner -->

                <div class="inner-banner blog">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="content">
                                    <h1>İÇERİK EKLE</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- End Banner -->
                <div class="container-fluid">
                    <div class="block aling-center">
                   
                        <%-- Seçtirme --%>
                        <div class="row">
                            <div class="col-sm-12" style="background-color: lavender;">
                                <br />
                                <asp:Label ID="lblSec" runat="server" Text="Lütfen ders ve kategori seçiniz." ForeColor="Red" Font-Bold="True"></asp:Label>
                                <br />
                                <br />
                            </div>
                        </div>
                        <br />
                        <%-- Ders--Kategori --%>
                        <div class="row" style="background-color: lavender;">
                            <div class="col-sm-6">
                                <asp:Label ID="Label4" runat="server" Text="DERS" ForeColor="Red" Font-Bold="True"></asp:Label>
                                <asp:ListBox ID="ListLessons" CssClass="form-control" OnSelectedIndexChanged="ListLessons_SelectedIndexChanged" Height="170px" AutoPostBack="True" runat="server" Font-Bold="True" ForeColor="#3AC0F2" Font-Size="Large"></asp:ListBox>
                            </div>
                            <div class="col-sm-6">
                                <asp:Label ID="Label5" runat="server" Text="KATEGORİ" ForeColor="Red" Font-Bold="True"></asp:Label>
                                <asp:ListBox ID="ListClass" CssClass="form-control" OnSelectedIndexChanged="ListSubject_SelectedIndexChanged" Height="170px" AutoPostBack="True" runat="server" Font-Bold="True" ForeColor="#3AC0F2" Font-Size="Large"></asp:ListBox>
                            </div>
                        </div>
                        <br />
                        <%-- Güncelleme --%>
                        <div class="row">
                            <div class="col-sm-12" style="background-color: lavender;">
                                <span id='Belgeler'></span>
                                <asp:Label ID="Label1" runat="server" Font-Bold="true" Visible="false" Text="Seçtiğiniz Konu : "></asp:Label><br />
                                <asp:Label ID="lblChoose" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                                <br />
                                <br />
                                <asp:LinkButton ID="lnkEkle" runat="server" Font-Bold="true" ForeColor="DarkBlue" OnClick="Add_Click">(Yeni İçerik Ekle)</asp:LinkButton>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="lnkGuncelle" runat="server" Font-Bold="true" ForeColor="DarkBlue" OnClick="Guncelle_Click">(İçeriği Güncelle)</asp:LinkButton>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="lnkClear" runat="server" Font-Bold="true" ForeColor="DarkBlue" OnClick="Clear_Click">(Yeni Konu Seç)</asp:LinkButton><br />
                                <br />
                                <asp:Label ID="Label3" runat="server" Visible="false" Font-Bold="true" Text="Daha önce eklenilen içerik aşağıdadır."></asp:Label>
                            </div>
                            <section class="our-difference">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-12 about-content">
                                            <div class="col-md-12"><br />
                                                <div class="rex-accordion">
                                                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                                                        <div class="rx-panel-default panel panel-default">
                                                            <div class="rx-panel-heading panel-heading collapsed" role="tab" id="headingOne" data-parent="#accordion" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                                <h5 class="rx-panel-title panel-title">
			                              <span class="icon icon-Play rx-accordin-icon pull-right"></span>
                                                                </h5>
                                                                <i class="fa fa-plus"></i>
                                                            </div>
                                                            <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                                                                <div class="rx-panel-body panel-body">
                                                                    <p>
                                                                        <asp:Label ID="lblİcerik" runat="server"></asp:Label>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                        <div class="row">
                            <div class="col-sm-12" style="background-color: lavender;">
                                <h3>
                                    <asp:Label ID="Label2" runat="server" Text="Yeni İçerik Girebilir veya Düzenleyebilirsiniz" Visible="False"></asp:Label></h3>
                                <asp:Label ID="lblError" runat="server" Text="Label" Font-Bold="True" Visible="False"></asp:Label>
                                <CKEditor:CKEditorControl ID="txtIcerikEkle" Visible="false" Height="400" runat="server"></CKEditor:CKEditorControl>
                            </div>
                        </div>
                        <div class="row" style="background-color: lavender;">
                            <br />
                            <div class="col-sm-6">
                                <asp:LinkButton ID="Button1" Width="50%" runat="server" OnClick="AddContent_Click" CssClass="btn">YENİ İÇERİKLERİ Ekle <span class="icon-more-icon"></span></asp:LinkButton>
                                <br />
                                <br />
                                <asp:Label ID="lblResults" runat="server"></asp:Label>
                                <asp:Label ID="lblSubId" runat="server" Visible="true"></asp:Label>
                            </div>
                            <div class="col-sm-6">
                                <asp:LinkButton ID="Button2" Width="50%" runat="server" OnClick="UpdateContent_Click" CssClass="btn">İÇERİĞİ Güncelle <span class="icon-more-icon"></span></asp:LinkButton>
                                <br />
                                <br />
                            </div>
                        </div>
                    </div>
                </div>
                <script>
                    function Func() {
                        var offsets = $('#Belgeler').offset();
                        var top = offsets.top;
                        $('body,html').animate({ scrollTop: top }, 1500);
                    };
                </script>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>

