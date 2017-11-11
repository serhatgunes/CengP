<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.master" AutoEventWireup="true" CodeFile="Sorular.aspx.cs" Inherits="Sorular" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
        <div class="inner-banner blog">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="content">
                            <h1>Sorularım</h1>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <section class="privacy-wrapper">
            <div class="container">
                <!-- Start Banner -->


                <!-- End Banner -->
                <!-- Start Listing -->
                <div class="row">
                    <div class="col-md-6 col-md-offset-3 col-sm-12">

                        <br />


                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                            CellPadding="4" CssClass="style1" DataKeyNames="mesajid" OnRowDataBound="renkler"
                            DataSourceID="SqlDataSource1" ForeColor="YellowGreen" Font-Size="Medium" Font-Bold="true" GridLines="None"
                            Height="129px" Width="100%">
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink1" runat="server"
                                            ImageUrl='<%# Eval("durumres") %>' NavigateUrl='<%# Eval("mesajid", "SoruOku.aspx?mesajid={0}") %>'></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="tarih" HeaderText="Tarih" SortExpression="tarih" />
                                <asp:BoundField DataField="kimden" HeaderText="Kimden" SortExpression="kimden" />
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
                        <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>




                    </div>
                </div>
                <!-- End Listing -->
            </div>
            <br /><br />
        </section>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:CengP %>"
            SelectCommand="SELECT * FROM [mesajlar] WHERE [c_id] = @ContactName"
            DeleteCommand="DELETE FROM [mesajlar] WHERE [mesajid] = @mesajid">
            <SelectParameters>
                <asp:ControlParameter Name="ContactName" ControlID="Label1" PropertyName="Text" DefaultValue="" ConvertEmptyStringToNull="false" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>

