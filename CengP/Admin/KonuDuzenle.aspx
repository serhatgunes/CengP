<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="KonuDuzenle.aspx.cs" Inherits="Admin_KonuDuzenle" %>

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
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <!-- Content Wrapper. Contains page content -->
                <div class="content-wrapper">
                    <!-- Content Header (Page header) -->
                    <section class="content-header">
                        <h1>Ders Konuları</h1>
                        <ol class="breadcrumb">
                            <li><a href="Anasayfa.aspx"><i class="fa fa-dashboard"></i>Anasayfa</a></li>
                            <li class="active">Ders Konuları Güncelle
                            </li>
                        </ol>
                    </section>
                    <!-- Main content -->
                    <br />
                    <section class="content">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="box box-primary">
                                    <div class="box-header">
                                        <h3 class="box-title">Konu Güncelle</h3>

                                    </div>
                                    <br />
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="box box-default box-solid">
                                                    <div class="box-header with-border">

                                                        <h3 class="box-title"><b>Java</b></h3>

                                                        <div class="box-tools pull-right">
                                                            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                                                <i class="fa fa-minus"></i>
                                                            </button>
                                                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                                        </div>
                                                    </div>
                                                    <div class="box-body">
                                                        <br />
                                                        <div class="col-md-12">

                                                            <div class="box-body">
                                                                <div class="box-body text-left">
                                                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                                                        DataSourceID="SqlDataSource1" AllowSorting="True" CellPadding="4" DataKeyNames="s_id"
                                                                        GridLines="None" AllowPaging="True" OnRowDataBound="GridView1_RowDataBound"
                                                                        ForeColor="#333333" BorderColor="#003300" BorderStyle="Solid"
                                                                        BorderWidth="1px" Font-Size="11pt" Font-Names="Century" PageSize="5">
                                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                                        <Columns>
                                                                            <asp:CommandField ShowEditButton="true" ControlStyle-BackColor="#507CD1" ControlStyle-ForeColor="White" ControlStyle-Font-Size="15px" EditText="Düzenle" CancelText="İptal" UpdateText="Güncelle" ButtonType="Button" />
                                                                            <asp:BoundField DataField="s_id" HeaderText="s_id" SortExpression="s_id" InsertVisible="False" ReadOnly="True" Visible="False" />
                                                                            <asp:BoundField DataField="subjectname" HeaderText="Konu Adı" SortExpression="subjectname" />
                                                                        </Columns>
                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <EditRowStyle BackColor="#A1DCF2" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                                                        <AlternatingRowStyle BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                                                        <RowStyle BackColor="#EFF3FB" BorderColor="Black" BorderWidth="1px" />

                                                                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                                                        <PagerStyle HorizontalAlign="Center" CssClass="GridPager" BorderColor="White" />
                                                                    </asp:GridView>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <br />
                                                    <br />
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:CengP %>"
                                                        SelectCommand="SELECT * FROM [subject] where [c_id] = 1"
                                                        UpdateCommand="UPDATE [subject] SET [subjectname] = @subjectname    WHERE [s_id] = @s_id"></asp:SqlDataSource>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="box box-default box-solid">
                                                    <div class="box-header with-border">

                                                        <h3 class="box-title"><b>.NET</b></h3>

                                                        <div class="box-tools pull-right">
                                                            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                                                <i class="fa fa-minus"></i>
                                                            </button>
                                                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                                        </div>
                                                    </div>
                                                    <div class="box-body">
                                                        <br />
                                                        <div class="col-md-12">

                                                            <div class="box-body">
                                                                <div class="box-body text-left">
                                                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"
                                                                        DataSourceID="SqlDataSource2" AllowSorting="True" CellPadding="4" DataKeyNames="s_id"
                                                                        GridLines="None" AllowPaging="True" OnRowDataBound="GridView2_RowDataBound"
                                                                        ForeColor="#333333" BorderColor="#003300" BorderStyle="Solid"
                                                                        BorderWidth="1px" Font-Size="11pt" Font-Names="Century" PageSize="5">
                                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                                        <Columns>
                                                                            <asp:CommandField ShowEditButton="true" ControlStyle-BackColor="#507CD1" ControlStyle-ForeColor="White" ControlStyle-Font-Size="15px" EditText="Düzenle" CancelText="İptal" UpdateText="Güncelle" ButtonType="Button" />
                                                                            <asp:BoundField DataField="s_id" HeaderText="s_id" SortExpression="s_id" InsertVisible="False" ReadOnly="True" Visible="False" />
                                                                            <asp:BoundField DataField="subjectname" HeaderText="Konu Adı" SortExpression="subjectname" />
                                                                        </Columns>
                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <EditRowStyle BackColor="#A1DCF2" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                                                        <AlternatingRowStyle BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                                                        <RowStyle BackColor="#EFF3FB" BorderColor="Black" BorderWidth="1px" />

                                                                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                                                        <PagerStyle HorizontalAlign="Center" CssClass="GridPager" BorderColor="White" />
                                                                    </asp:GridView>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <br />
                                                    <br />
                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:CengP %>"
                                                        SelectCommand="SELECT [s_id], [subjectname] FROM [subject] WHERE [c_id] = 2"
                                                        UpdateCommand="UPDATE [subject] SET [subjectname] = @subjectname    WHERE [s_id] = @s_id"></asp:SqlDataSource>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="box box-default box-solid">
                                                    <div class="box-header with-border">

                                                        <h3 class="box-title"><b>IOS</b></h3>

                                                        <div class="box-tools pull-right">
                                                            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                                                <i class="fa fa-minus"></i>
                                                            </button>
                                                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                                        </div>
                                                    </div>
                                                    <div class="box-body">
                                                        <br />
                                                        <div class="col-md-12">

                                                            <div class="box-body">
                                                                <div class="box-body text-left">
                                                                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False"
                                                                        DataSourceID="SqlDataSource3" AllowSorting="True" CellPadding="4" DataKeyNames="s_id"
                                                                        GridLines="None" AllowPaging="True" OnRowDataBound="GridView3_RowDataBound"
                                                                        ForeColor="#333333" BorderColor="#003300" BorderStyle="Solid"
                                                                        BorderWidth="1px" Font-Size="11pt" Font-Names="Century" PageSize="5">
                                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                                        <Columns>
                                                                            <asp:CommandField ShowEditButton="true" ControlStyle-BackColor="#507CD1" ControlStyle-ForeColor="White" ControlStyle-Font-Size="15px" EditText="Düzenle" CancelText="İptal" UpdateText="Güncelle" ButtonType="Button" />
                                                                            <asp:BoundField DataField="s_id" HeaderText="s_id" SortExpression="s_id" InsertVisible="False" ReadOnly="True" Visible="False" />
                                                                            <asp:BoundField DataField="subjectname" HeaderText="Konu Adı" SortExpression="subjectname" />
                                                                        </Columns>
                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <EditRowStyle BackColor="#A1DCF2" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                                                        <AlternatingRowStyle BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                                                        <RowStyle BackColor="#EFF3FB" BorderColor="Black" BorderWidth="1px" />

                                                                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                                                        <PagerStyle HorizontalAlign="Center" CssClass="GridPager" BorderColor="White" />
                                                                    </asp:GridView>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <br />
                                                    <br />
                                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:CengP %>"
                                                        SelectCommand="SELECT [s_id], [subjectname] FROM [subject] WHERE [c_id] = 14"
                                                        UpdateCommand="UPDATE [subject] SET [subjectname] = @subjectname    WHERE [s_id] = @s_id"></asp:SqlDataSource>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="box box-default box-solid">
                                                    <div class="box-header with-border">

                                                        <h3 class="box-title"><b>Android</b></h3>

                                                        <div class="box-tools pull-right">
                                                            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                                                <i class="fa fa-minus"></i>
                                                            </button>
                                                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                                                        </div>
                                                    </div>
                                                    <div class="box-body">
                                                        <br />
                                                        <div class="col-md-12">

                                                            <div class="box-body">
                                                                <div class="box-body text-left">
                                                                    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False"
                                                                        DataSourceID="SqlDataSource4" AllowSorting="True" CellPadding="4" DataKeyNames="s_id"
                                                                        GridLines="None" AllowPaging="True" OnRowDataBound="GridView4_RowDataBound"
                                                                        ForeColor="#333333" BorderColor="#003300" BorderStyle="Solid"
                                                                        BorderWidth="1px" Font-Size="11pt" Font-Names="Century" PageSize="5">
                                                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                                        <Columns>
                                                                            <asp:CommandField ShowEditButton="true" ControlStyle-BackColor="#507CD1" ControlStyle-ForeColor="White" ControlStyle-Font-Size="15px" EditText="Düzenle" CancelText="İptal" UpdateText="Güncelle" ButtonType="Button" />
                                                                            <asp:BoundField DataField="s_id" HeaderText="s_id" SortExpression="s_id" InsertVisible="False" ReadOnly="True" Visible="False" />
                                                                            <asp:BoundField DataField="subjectname" HeaderText="Konu Adı" SortExpression="subjectname" />
                                                                        </Columns>
                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <EditRowStyle BackColor="#A1DCF2" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                                                        <AlternatingRowStyle BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                                                        <RowStyle BackColor="#EFF3FB" BorderColor="Black" BorderWidth="1px" />

                                                                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                                                        <PagerStyle HorizontalAlign="Center" CssClass="GridPager" BorderColor="White" />
                                                                    </asp:GridView>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <br />
                                                    <br />
                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:CengP %>"
                                                        SelectCommand="SELECT [s_id], [subjectname] FROM [subject] WHERE [c_id] = 13"
                                                        UpdateCommand="UPDATE [subject] SET [subjectname] = @subjectname    WHERE [s_id] = @s_id"></asp:SqlDataSource>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                    </section>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

</asp:Content>

