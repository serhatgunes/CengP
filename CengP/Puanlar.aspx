<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.master" AutoEventWireup="true" CodeFile="Puanlar.aspx.cs" Inherits="Puanlar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Start Banner -->

    <div class="inner-banner blog">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="content">
                        <h1>puanlar</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Banner -->
    <!-- Start Browse Teacher -->

    <section class="browse-teacher grey-bg padding-lg">
        <div class="container">
            <ul class="row browse-teachers-list clearfix">
                <asp:ListView ID="ListView2" runat="server">
                    <ItemTemplate>
                        <li class="col-xs-6 col-sm-3">
                            <figure>
                                <img src="<%# Eval("FilePath") %>" width="124" height="124" alt="">
                            </figure>
                            <asp:Label ID="Label1" ForeColor="Black" Font-Bold="true" Font-Size="Medium" runat="server" Text='<%#Eval("fullname") %>'></asp:Label>
                            <span class="designation"><%# Eval("school") %></span>
                            <p class="equal-hight">
                                <p>
                                    <h3>Toplam Puan : <%#Eval("totalpoint") %></h3>
                                </p>
                            </p>
                        </li>
                    </ItemTemplate>
                </asp:ListView>
            </ul>
        </div>
    </section>

    <!-- end Browse Teacher -->
</asp:Content>

