<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.master" AutoEventWireup="true" CodeFile="SinavGecmis.aspx.cs" Inherits="SinavGecmis" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["questions"] == null)
                Response.Redirect("../Homepage.aspx");
            else
            {
                Examination exam = (Examination)Session["questions"];
                ListView1.DataSource = exam.questions;
                ListView1.DataBind();
            }
        }
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="inner-banner blog">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="content">
                        <h1>Sorular</h1>
                        <a href="SinavSonuc.aspx">Sonucum</a>
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
                <div class="col-sm-12">
                    <ol class="ord-listing">
                        <asp:ListView ID="ListView1" runat="server">
                            <ItemTemplate>
                                <li>
                                    <pre style="color: Black; background-color: #eeeeee"><b><%# Eval( "QuestionText")%></b></pre>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <pre style="border-style: hidden; border-color: #FFFFFF; background-color: #EEF2F4;"><b style="color:black">1 - </b><%# Eval( "Answer1") %></pre>

                                        </div>
                                        <div class="col-sm-3">
                                            <pre style="border-style: hidden; border-color: #FFFFFF; background-color: #EEF2F4;"><b style="color:black">2 - </b><%# Eval( "Answer2") %></pre>

                                        </div>
                                        <div class="col-sm-3">
                                            <pre style="border-style: hidden; border-color: #FFFFFF; background-color: #EEF2F4;"><b style="color:black">3 - </b><%# Eval( "Answer3") %></pre>

                                        </div>
                                        <div class="col-sm-3">
                                            <pre style="border-style: hidden; border-color: #FFFFFF; background-color: #EEF2F4;"><b style="color:black">4 - </b><%# Eval( "Answer4") %></pre>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <pre style="color: blue; border-style: hidden; border-color: #FFFFFF; background-color: #EEF2F4;"><b>Doğru Cevap :</b> <%# Eval( "CorrectAnswer") %></pre>
                                        </div>
                                        <div class="col-sm-6">
                                            <pre style="color: blue; border-style: hidden; border-color: #FFFFFF; background-color: #EEF2F4;"><b>Cevabınız :</b> <%# Eval( "YourAnswer") %></pre>
                                        </div>
                                    </div>
                                </li>

                            </ItemTemplate>
                        </asp:ListView>
                    </ol>

                </div>
            </div>
            <!-- End Listing -->
        </div>
    </section>
</asp:Content>

