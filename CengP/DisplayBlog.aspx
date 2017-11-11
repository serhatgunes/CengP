<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.master" AutoEventWireup="true" CodeFile="DisplayBlog.aspx.cs" Inherits="DisplayBlog" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <%-- DisplayBlogBaşlangıç --%>

                <div class="container-fluid">
                    <div class="row">
                        <!-- Start Left Column -->
                        <div class="col-sm-7 blog-left">
                            <ul class="blog-listing detail">
                                <li>
                                    <%--                                    <img src="images/blog-detail-img.jpg" class="img-responsive" alt="">--%>
                                    <h2>
                                        <asp:Label ID="lblTitle" runat="server" />
                                    </h2>

                                    <ul class="post-detail">
                                        <li><span class="icon-calander-icon ico"></span><span class="bold">
                                            <asp:Label ID="lblDate" runat="server" /></span></li>
                                        <li>Yazar : <span class="bold">
                                            <asp:Label ID="lblWriter" runat="server" /></span></li>
                                        <li><span class="icon-chat-icon ico"></span><span class="bold">14</span> Yorum</li>
                                        <li><span class="label">
                                            <asp:Label ID="lblDers" runat="server" /></span></li>
                                        <li>
                                            <asp:Label ID="lblT_id" runat="server" Visible="false" Text="Label"></asp:Label></li>
                                        <li>
                                            <asp:Label ID="lblResults" runat="server" Text="Label" Visible="false" ForeColor="Red" Font-Bold="True"></asp:Label></li>
                                        <li>
                                            <asp:Label ID="Name" runat="server" Text="Label" ForeColor="Red" Visible="false"></asp:Label>
                                            <asp:Label ID="Email" runat="server" Text="Label" ForeColor="Red" Visible="false"></asp:Label></li>
                                    </ul>
                                    <div class="imp-quote">
                                        <p>
                                            <asp:Label ID="lblBody" runat="server" />
                                        </p>
                                    </div>

                                </li>
                            </ul>
                            <ul class="follow-us clearfix">
                                <li><a href="https://facebook.com/sharer.php?u=http://192.168.1.101:88/2.aspx" target="_blank"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>
                        <!-- End Left Column -->


                        <!-- Start Right Column -->
                        <div class="col-sm-5">
                            <br />
                            <br />
                            <div class="blog-right">
                                <div class="recent-post">
                                    <h3>Son Eklenenler</h3>
                                    <ul>
                                        <asp:ListView ID="ListView1" runat="server">
                                            <ItemTemplate>
                                                <li class="clearfix"><a href="#">
                                                    <a href='<%# string.Format("~/{0}.aspx", Eval("content_id"), Eval("Slug")) %>' class="read-more" runat="server">
                                                        <div class="img-block col-sm-1">
                                                            <img src="<%#Eval("FilePath") %>" width="35" height="30" class="img-responsive" alt="">
                                                        </div>
                                                        <div class="detail col-sm-2">
                                                            <h4><%#Eval("subjectname") %>...</h4>
                                                            <p><span class="icon-date-icon ico"></span><span><%#Eval("date") %></span></p>
                                                        </div>
                                                    </a>
                                                </a></li>
                                            </ItemTemplate>
                                        </asp:ListView>
                                    </ul>
                                </div>
                                <div class="category">
                                    <h3>yazara soru sor                                   
                                        <ul class="post-detail">
                                            <li>
                                                <b>(
                                                    <asp:Label ID="Labelwriter" runat="server" />
                                                    )</b></li>
                                        </ul>
                                    </h3>

                                    <CKEditor:CKEditorControl ID="txtSoru" runat="server"></CKEditor:CKEditorControl><br />
                                    <asp:LinkButton ID="LinkButton2" CssClass="btn" runat="server" OnClick="btnQuestion_Click">Soru Sor <span class="icon-more-icon"></span></asp:LinkButton>
                                    <asp:Label ID="lblQues" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                                </div>

                                <div class="comments-wrapper" style="background-color: white">
                                    <h2>
                                        <asp:Label ID="lblToplamYorum" runat="server" Text="Label"></asp:Label>
                                        Yorum</h2>
                                    <ul class="row comments">
                                        <asp:Repeater ID="Repeater1" runat="server">
                                            <ItemTemplate>
                                                <li class="col-sm-12 clearfix">
                                                    <div class="com-img">

                                                        <img src='<%#Eval("FilePath") %>' width="55" height="52" class="img-circle" alt="">
                                                    </div>
                                                    <div class="com-txt">
                                                        <h3><%#Eval("name") %> </h3>
                                                        <p><%#Eval("comment") %></p>
                                                    </div>
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                    <ul class="pagination">
                                        <asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand">
                                            <ItemTemplate>
                                                <li>
                                                    <asp:LinkButton ID="btnPage"
                                                        CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                                                        runat="server" CausesValidation="false"><%# Container.DataItem %></asp:LinkButton></li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>

                                </div>
                                <div class="leave-comment">
                                    <h4>YORUM YAP</h4>

                                    <div class="row1 clearfix">
                                        <asp:TextBox ID="txtName" CssClass="form-control" runat="server" placeholder="Adınız"></asp:TextBox>
                                        <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeholder="Emaİl AdresİNİZ"></asp:TextBox>
                                    </div>
                                    <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" placeholder="Yorumunuz" TextMode="MultiLine"></asp:TextBox>

                                    <asp:LinkButton ID="LinkButton1" CssClass="btn" runat="server" OnClick="btnComment_Click">Yorum Yap <span class="icon-more-icon"></span></asp:LinkButton>
                                    <asp:Label ID="lblComment" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                                </div>
                            </div>
                        </div>
                        </section>
                        <!-- End Right Column -->

                    </div>
                </div>


                <%-- DisplayBlog Bitiş --%>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <br />
</asp:Content>

