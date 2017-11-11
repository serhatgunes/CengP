<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.master" AutoEventWireup="true" CodeFile="Cevaplar.aspx.cs" Inherits="Cevaplar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
        <!-- Start Banner -->

        <div class="inner-banner blog">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="content">
                            <h1>Cevaplarım</h1>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!-- End Banner -->
        <section class="privacy-wrapper">
            <div class="container">
                <!-- Start Banner -->


                <!-- End Banner -->
                <!-- Start Listing -->
                <div class="row">
                    <div class="col-md-6 col-md-offset-3 col-sm-12">

                        <br />

                        <asp:GridView ID="GridView1" runat="server"
                            OnRowDeleting="GridView1_RowDeleting"
                            AutoGenerateColumns="False"
                            OnRowDataBound="OnRowDataBound"
                            CellPadding="4" CssClass="style1" DataKeyNames="id"
                            ForeColor="YellowGreen" Font-Bold="true" GridLines="None"
                            Height="129px" Width="100%">
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink1" runat="server"
                                            ImageUrl='<%# Eval("durumres") %>' NavigateUrl='<%# Eval("id", "CevapOku.aspx?id={0}") %>'></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="tarih" HeaderText="Tarih" SortExpression="tarih" />
                                <asp:BoundField DataField="kimden" HeaderText="Yazar" SortExpression="kimden" />
                                <asp:BoundField DataField="durum" ShowHeader="False" SortExpression="durum">
                                    <ItemStyle BorderStyle="None" Font-Size="0pt" Width="0px" />
                                </asp:BoundField>
                                <asp:CommandField DeleteText="Mesajı Sil" ShowDeleteButton="True" />
                            </Columns>
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="Transparent" Font-Bold="True" ForeColor="Black" />
                                <EditRowStyle BackColor="#2461BF" />
                                <AlternatingRowStyle BackColor="Transparent" />
                        </asp:GridView>



                    </div>
                </div>
                <!-- End Listing -->
            </div>
            <br /><br />
        </section>






    </form>
</asp:Content>

