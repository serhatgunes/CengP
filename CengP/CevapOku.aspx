<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.master" AutoEventWireup="true" CodeFile="CevapOku.aspx.cs" Inherits="CevapOku" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
            <div class="inner-banner blog">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="content">
                            <h1>cevabım</h1>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    <form id="form1" runat="server">    
        <!-- Start News & Events -->
        <div class="container blog-wrapper col-sm-12" style="background-color:azure">
            <div class="row">
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False"
                    DataKeyNames="id" DataSourceID="SqlDataSource1" Width="100%"
                    EmptyDataText="Cevap Silinmiştir." BorderColor="White" BorderStyle="None" HeaderStyle-BorderStyle="None">
                    <EditRowStyle BorderStyle="None" />
                    <FieldHeaderStyle BorderStyle="None" />
                    <Fields>
                        <asp:TemplateField ControlStyle-BorderStyle="None" FooterStyle-BorderStyle="None">
                            <ItemTemplate>
                                <br />
                                <!-- Start Left Column -->
                                <div class="col-sm-6 ">
                                    <div class="comments-wrapper" style="background-color: azure">
                                        <h2>Sorunuz</h2>

                                    </div>
                                    <ul class="blog-listing detail">
                                        <li>
                                            <ul class="post-detail">
                                                <li><span class="icon-calander-icon ico"></span><span class="bold"><%# Eval("tarih") %></span></li>
                                                <li>Cevaplayan : <span class="bold">
                                                    <%# Eval("kimden") %></span></li>
                                            </ul>
                                            <div class="imp-quote" style="background-color: azure">
                                                <p>
                                                    <%# Eval("mesaj") %>
                                                </p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <!-- End Left Column -->

                                <!-- Start Right Column -->
                                <div class="col-sm-6">
                                    <div class="comments-wrapper" style="background-color: azure">
                                        <h2>Cevabı</h2>

                                    </div>
                                    <ul class="blog-listing detail">
                                        <li>
                                            <ul class="post-detail">
                                            </ul>
                                            <br />
                                            <div class="imp-quote" style="background-color: azure">
                                                <p><%# Eval("mesajcvp") %></p>
                                            </div>
                                        </li>
                                    </ul>

                                </div>
                                <!-- End Right Column -->
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField DeleteText="Mesajı Sil" ShowDeleteButton="True" ItemStyle-HorizontalAlign="Right" ControlStyle-BorderStyle="None" />
                    </Fields>
                </asp:DetailsView>
            </div>
        </div>

        <!-- End News & Events -->
    </form>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CengP %>"
        SelectCommand="SELECT * FROM [mesajCevap] WHERE ([id] = @id)"
        DeleteCommand="DELETE FROM [mesajCevap] WHERE [id] = @id">
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="id"
                Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="mesajid" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>

