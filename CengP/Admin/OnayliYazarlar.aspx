<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="OnayliYazarlar.aspx.cs" Inherits="Admin_OnayliYazarlar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <style type="text/css">
        body {
            font-family: Arial;
            font-size: 10pt;
        }

        .GridPager a, .GridPager span {
            display: block;
            height: 25px;
            width: 25px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
        }

        .GridPager a {
            background-color: #507CD1;
            color: #969696;
            border: 2px solid #969696;
        }

        .GridPager span {
            background-color: #A1DCF2;
            color: #000;
            border: 2px solid #3AC0F2;
        }
    </style>
        <form id="form1" runat="server">
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>Onayli Yazarlar</h1>
                <ol class="breadcrumb">
                    <li><a href="Anasayfa.aspx"><i class="fa fa-dashboard"></i>Anasayfa</a></li>
                    <li class="active">Onaylı Yazarlar</li>
                </ol>
            </section>
            <!-- Main content -->
            <br />
            <section class="content">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box box-primary">
                            <div class="box-header">
                                <h3 class="box-title"></h3>
                            </div>
                            <br />
                            <div class="col-md-3">
                                <div class="input-group">
                                    <asp:TextBox ID="txtSearch" AutoCompleteType="Disabled" runat="server" placeholder="ID veya Ad Soyad girin" CssClass="form-control" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox><br />
                                    <span class="input-group-btn">
                                        <asp:LinkButton ID="LinkButton1" OnClick="lnkBtn_Click" CssClass="btn btn-flat" runat="server">
                                                <i class="fa fa-search"></i>
                                        </asp:LinkButton>
                                    </span>
                                </div>
                            </div>
                            <br />
                            <br />
                            <br />
                            <div align="center">
                                <asp:GridView runat="server" ID="datagridview" CssClass="mydatagrid" AllowPaging="True"
                                    CellPadding="4" ForeColor="#333333" GridLines="None" BorderColor="#003300" BorderStyle="Solid"
                                    BorderWidth="1px" Font-Size="11pt" Font-Names="Century" OnPageIndexChanging="datagridview_PageIndexChanging"
                                    OnRowCommand="datagridview_RowCommand" OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="datagridview_RowDeleting" OnRowUpdating="datagridview_RowUpdate" PageSize="10">
                                    <RowStyle BackColor="#EFF3FB" BorderColor="Black" BorderWidth="1px" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#00000A" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                    <AlternatingRowStyle BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                    <Columns>
                                        <asp:ButtonField ButtonType="Button" Text="Sil" CommandName="Delete"
                                            ControlStyle-BackColor="#507CD1" ControlStyle-ForeColor="White" ControlStyle-Font-Size="15px" />
                                    </Columns>
                                    <Columns>
                                        <asp:ButtonField ButtonType="Button" Text="Onayını Kaldır" CommandName="Update"
                                            ControlStyle-BackColor="#507CD1" ControlStyle-ForeColor="White" ControlStyle-Font-Size="15px" />
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" CssClass="GridPager" BorderColor="White" />
                                </asp:GridView>
                                <br />
                                <br />
                                <asp:Label runat="server" Text=" " ID="lblname"
                                    ForeColor="#507CD1" Font-Size="20px"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>

                <h2 class="page-header">Onaylı Yazarlar</h2>

                <div class="row">
                    <asp:ListView ID="ListView1" runat="server">
                        <ItemTemplate>
                            <div class="col-md-4">
                                <!-- Widget: user widget style 1 -->
                                <div class="box box-widget widget-user-2">
                                    <!-- Add the bg color to the header using any of the bg-* classes -->
                                    <div class="widget-user-header bg-yellow">
                                        <div class="widget-user-image">
                                            <asp:Image ID="Image1" class="img-circle" runat="server" ImageUrl='<%#Eval("FilePath") %>' Width="50" Height="50" />
                                        </div>
                                        <!-- /.widget-user-image -->
                                        <h3 class="widget-user-username"><%#Eval("fullname") %></h3>
                                    </div>
                                    <br />
                                    <br />
                                    <div class="box-footer no-padding">
                                        <ul class="nav nav-stacked">
                                            <li>Kullanıcı Adı : <span class="pull-right badge bg-blue"><%#Eval("username") %></span></li>
                                            <li>E-Mail : <span class="pull-right badge bg-aqua"><%#Eval("e_mail") %></span></a></li>
                                            <li>Okul : <span class="pull-right badge bg-red"><%#Eval("school") %></span></a></li>
                                            <li>Toplam Puan : <span class="pull-right badge bg-yellow"><%#Eval("totalpoint") %></span></a></li>
                                        </ul>
                                        <br />
                                    </div>

                                </div>
                                <!-- /.widget-user -->
                            </div>
                        </ItemTemplate>
                    </asp:ListView>

                </div>
            </section>

        </div>
    </form>
</asp:Content>

