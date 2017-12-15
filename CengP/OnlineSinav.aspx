<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.master" AutoEventWireup="true" CodeFile="OnlineSinav.aspx.cs" Inherits="OnlineSinav" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Web.Configuration" %>

<script runat="server">
    private string connectionString = WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString;

    private void FillSession_mid()
    {

        HttpCookie cookie = Request.Cookies["cookie"];
        string selectSQL = "SELECT * FROM members WHERE mid='" + cookie["mid"] + "'";

        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand(selectSQL, con);
        SqlDataReader reader;

        try
        {
            con.Open();
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Session.Add("mid", reader["mid"]);
            }
            reader.Close();

        }
        catch (Exception err)
        {
            lblResults.Visible = true;
            lblResults.ForeColor = System.Drawing.Color.Red;
            lblResults.Text = "Hata";
            lblResults.Text += err.Message;
        }
        finally
        {
            con.Close();
        }
    }
    protected void btnStart_Click(object sender, EventArgs e)
    {
        // 
        FillSession_mid();
        String sid, sname;

        sid = ListSubject.SelectedItem.Value;
        sname = ListSubject.SelectedItem.Text;
        Examination exam = new Examination(Int32.Parse(Session["mid"].ToString()), Int32.Parse(sid), sname);
        exam.GetQuestions();
        Session.Add("questions", exam);
        Response.Redirect("SinavOl.aspx");
    }
</script>
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
                                    <h1>Sınav Ol</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Banner -->
                <!-- Ders Konu seçimi
=====================-->
                <div class="row padding-lg" style="background-color: lavender">
                    <br />
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4">
                                <div class="enquire-now">
                                    <div class="inner">
                                        <h3><i class="fa fa-graduation-cap"></i>        DERS     </h3>
                                        <div class="row1">
                                            <asp:ListBox ID="ListClass" OnSelectedIndexChanged="ListClass_SelectedIndexChanged" CssClass="form-control" Height="392" AutoPostBack="True" runat="server" Font-Bold="True" ForeColor="#3AC0F2" Font-Size="Large"></asp:ListBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 col-md-4 col-lg-4">
                                <div class="enquire-now">
                                    <div class="inner">
                                        <h3><i class="fa fa-book"></i>          KATEGORİ      </h3>
                                        <div class="row1">
                                            <asp:ListBox ID="ListSubject" CssClass="form-control" OnSelectedIndexChanged="ListSubject_SelectedIndexChanged" Height="392" runat="server" DataSourceID="SqlDataSource1" DataTextField="subjectname"
                                                DataValueField="s_id" AutoPostBack="True" ForeColor="#3AC0F2" Font-Bold="True" Font-Size="Large"></asp:ListBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 col-md-4 col-lg-4">
                                <div class="enquire-now">
                                    <div class="inner">
                                        <h3><i class="fa fa-exclamation-triangle"> </i> SINAV KURALLARI</h3>
                                        <div class="row1">
                                            <ul class="privacy-listing">
                                                <li style="color:white">Her sınav 10 sorudan oluşmaktadır.</li>
                                                <li style="color:white">İleri ve geri butonlarını kullanarak sorular arasında geçiş yapabilirsiniz.</li>
                                                <li style="color:white">Son soru cevaplandıktan sonra sonucunuzu görebilirsiniz.</li>
                                                <li style="color:white">Zaman kısıtlaması yok.Fakat sınav için harcanan süre veritabanında saklanacak.</li>
                                                <li style="color:white"><b>Başarılar.</b></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <asp:LinkButton ID="LinkButton1" CssClass="btn" Width="100%" runat="server" OnClick="btnStart_Click">Sınav Ol <span class="icon-more-icon"></span></asp:LinkButton>
                                    <br />
                                    <asp:Label ID="lblResults" runat="server" Text="Label" ForeColor="Red" Font-Bold="True"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CengP %>" SelectCommand="SELECT [s_id], [subjectname] FROM [subject]"></asp:SqlDataSource>
    </form>
</asp:Content>

