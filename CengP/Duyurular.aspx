<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.master" AutoEventWireup="true" CodeFile="Duyurular.aspx.cs" Inherits="Duyurular" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Start Banner -->

    <div class="inner-banner blog">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="content">
                        <h1>duyurular</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Banner -->
    <!-- Start Testimonial -->

    <section class="testimonial padding-lg">
        <div class="container">
            <div class="wrapper">

                <ul class="testimonial-slide">
                    <asp:ListView ID="ListView2" runat="server">
                        <ItemTemplate>
                            <li>
                                <p><%# Eval("baslik") %></p>
                                <p><%# Eval("duyuru") %></p>
                                <span>Tarih : </span><b style="color: white"><%# Eval("tarih") %> </b>
                                <br />
                                <span>Yazar : </span><b style="color: white"><%# Eval("t_isim") %> </b>
                                <br />
                            </li>
                        </ItemTemplate>
                    </asp:ListView>
                </ul>
            </div>
        </div>
    </section>

    <!-- End Testimonial -->
</asp:Content>

