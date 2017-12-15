<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Iletisim.aspx.cs" Inherits="Admin_Iletisim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <form id="form1" runat="server">
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>İletişim</h1>
                <ol class="breadcrumb">
                    <li><a href="Anasayfa.aspx"><i class="fa fa-dashboard"></i>Anasayfa</a></li>
                    <li class="active">İletişim Mesajları</li>
                </ol>
            </section>
            <!-- Main content -->
            <br />
            <section class="content">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box box-primary">
                            <div class="box-header">
                                <h3 class="box-title">Gelen Kutusu</h3>
                            </div>
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
                                        <asp:ButtonField ButtonType="Button" Text="Okundu" CommandName="Update"
                                            ControlStyle-BackColor="#507CD1" ControlStyle-ForeColor="White" ControlStyle-Font-Size="15px" />
                                    </Columns>
                                </asp:GridView>
                                <br />
                                <asp:Label runat="server" Text=" " ID="lblname"
                                    ForeColor="#507CD1" Font-Size="20px"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </div>
    </form>
</asp:Content>

