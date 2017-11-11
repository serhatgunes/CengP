<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.master" AutoEventWireup="true" CodeFile="SoruOku.aspx.cs" Inherits="SoruOku" %>

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
                                    <h1>Soru & Cevap</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- End Banner -->

                <!-- Start News & Events -->
                <div class="container-fluid blog-wrapper">
                    <div class="row">
                        <!-- Start Left Column -->
                        <div class="col-sm-7 blog-left">
                            <div class="comments-wrapper">
                                <h2>soru</h2>
                                <ul class="row comments">
                                    <li class="col-sm-12 clearfix">
                                        <asp:ListView ID="ListView1" runat="server">
                                            <ItemTemplate>
                                                <div class="com-img">
                                                    <img src='<%#Eval("FilePath") %>' class="img-circle" width="75" height="75" alt="">
                                                </div>
                                            </ItemTemplate>
                                        </asp:ListView>
                                        <div class="com-txt">
                                            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False"
                                                DataKeyNames="mesajid" DataSourceID="SqlDataSource1" Width="100%"
                                                EmptyDataText="Soru Silinmiştir." BorderColor="White" BorderStyle="None" HeaderStyle-BorderStyle="None">
                                                <EditRowStyle BorderStyle="None" />
                                                <FieldHeaderStyle BorderStyle="None" />
                                                <Fields>
                                                    <asp:TemplateField ControlStyle-BorderStyle="None" FooterStyle-BorderStyle="None">
                                                        <ItemTemplate>

                                                            <h3><%# Eval("kimden") %> <span><%# Eval("tarih") %></span></h3>
                                                            <p><%# Eval("mesaj") %></p>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:CommandField DeleteText="MESAJI SİL" ShowDeleteButton="True" ItemStyle-HorizontalAlign="Right" ControlStyle-BorderStyle="None" />
                                                </Fields>
                                            </asp:DetailsView>
                                        </div>
                                    </li>
                                </ul>
                            </div>

                        </div>
                        <!-- End Left Column -->

                        <!-- Start Right Column -->
                        <div class="col-sm-5">
                            <div class="blog-right">
                                <br />
                                <div class="category">
                                    <h3>Cevapla </h3>

                                    <CKEditor:CKEditorControl ID="txtAnswer" runat="server"></CKEditor:CKEditorControl>
                                    <br />
                                    <asp:LinkButton ID="LinkButton2" CssClass="btn" runat="server" OnClick="btnAnswer_Click">Cevapla <span class="icon-more-icon"></span></asp:LinkButton>
                                    <asp:Label ID="lblAnswer" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                                    <asp:Label ID="lblHata" runat="server" Text="Label" Font-Bold="True" Visible="False"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <!-- End Right Column -->

                    </div>
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CengP %>"
                    SelectCommand="SELECT * FROM [mesajlar] WHERE ([mesajid] = @mesajid)"
                    DeleteCommand="DELETE FROM [mesajlar] WHERE [mesajid] = @mesajid">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="mesajid" QueryStringField="mesajid"
                            Type="Int32" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="mesajid" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>

