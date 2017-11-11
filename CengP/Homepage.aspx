<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.master" AutoEventWireup="true" CodeFile="Homepage.aspx.cs" Inherits="Homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">

        <section class="news-wrapper "><br>
            <div class="container">
                <ul class="row news-listing">
                    <asp:ListView ID="ListView1" runat="server">
                        <ItemTemplate>
                            <li class="col-xs-6 col-sm-3 grid-item">
                                <div class="inner">
                                    <a href='<%# string.Format("~/{0}.aspx", Eval("content_id"), Eval("Slug")) %>' class="read-more" runat="server">
                                        <img src='<%#Eval("FilePath") %>' height="150" alt="" /></a>
                                    <div class="cnt-block" style="height: 100%">
                                        <ul class="post-detail">
                                            <li><span class="icon-date-icon ico"></span><span class="bold"><%#Eval("date") %></span></li>
                                            <li><span class="icon-chat-icon ico"></span><span class="bold">14</span> Yorum</li>
                                            <br />
                                            <li>Yazar : <span class="bold"><%#Eval("fullname") %></span></li>
                                        </ul>
                                        <a href='<%# string.Format("~/{0}.aspx", Eval("content_id"), Eval("Slug")) %>' class="read-more" runat="server">
                                            <h2><%#Eval("subjectname") %> </h2>
                                        </a>
                                        <%--  <p><%#Eval("content") %> ... </p>--%>
                                        <a href='<%# string.Format("~/{0}.aspx", Eval("content_id"), Eval("Slug")) %>' class="read-more" runat="server"><span class="icon-play-icon"></span>OKU</a>
                                    </div>
                                </div>

                            </li>
                        </ItemTemplate>
                    </asp:ListView>
                </ul>
            </div>
        </section>

    </form>
</asp:Content>

