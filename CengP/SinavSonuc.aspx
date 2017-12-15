<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.master" AutoEventWireup="true" CodeFile="SinavSonuc.aspx.cs" Inherits="SinavSonuc" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Web.Configuration" %>
<script runat="server">
    private string connectionString = WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString;
    SqlConnection con1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["questions"] == null)
                Response.Redirect("../Homepage.aspx");
            else
            {

            }
        }
        Foto();
    }
    protected void Foto()
    {
        HttpCookie cookie = Request.Cookies["cookie"];
        DataTable dt = new DataTable();
        string strQuery = "select mid,FilePath from members WHERE mid='" + cookie["mid"] + "' ";
        SqlCommand cmd = new SqlCommand(strQuery);
        SqlDataAdapter sda = new SqlDataAdapter();
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con1;
        try
        {
            con1.Open();
            sda.SelectCommand = cmd;
            sda.Fill(dt);
            ListView1.DataSource = dt;
            ListView1.DataBind();

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
            con1.Close();
            sda.Dispose();
            con1.Dispose();
        }
    }

    private void FillTotalPointNext()
    {
        HttpCookie cookie = Request.Cookies["cookie"];
        string selectSQL = "SELECT mid,SUM(puan) AS TotalPuan FROM oe_exams WHERE mid='" + cookie["mid"] + "' GROUP BY [mid]";

        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand(selectSQL, con);
        SqlDataReader reader;

        try
        {
            con.Open();
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {

                lblToplaPuan.Text = reader["TotalPuan"].ToString();
            }
            reader.Close();

        }
        catch (Exception err)
        {
            lblToplaPuan.ForeColor = System.Drawing.Color.Red;
            lblToplaPuan.Text = "Hata";
            lblToplaPuan.Text += err.Message;
        }
        finally
        {
            con.Close();
        }
    }

    protected void lblResult_Click(object sender, EventArgs e)
    {
        // show exam result
        Examination exam = (Examination)Session["questions"];
        lblSubject.Text = exam.sname;
        lblStime.Text = exam.StartTime.ToString();
        TimeSpan ts = DateTime.Now.Subtract(exam.StartTime);
        lblMin.Text = ts.Minutes.ToString();
        lblNquestions.Text = exam.SIZE.ToString();

        // find how many correct answers
        int cnt = 0;
        int durum;
        foreach (Question q in exam.questions)
        {
            if (q.IsCorrect())
                cnt++;
        }

        lblNcans.Text = cnt.ToString();
        exam.ncans = cnt;
        Session.Add("questions", exam);

        if (cnt > 7)
        {
            lblGrade.ForeColor = System.Drawing.Color.Green;
            lblGrade.Text = "Mükemmel";
        }
        else
            if (cnt > 5)
        {
            lblGrade.ForeColor = System.Drawing.Color.DarkBlue;
            lblGrade.Text = "Orta";
        }
        else
            lblGrade.Text = "Zayıf";


        if (lblGrade.Text == "Mükemmel")
        {
            durum = 1;
        }
        else
            if (lblGrade.Text == "Orta")
        {
            durum = 2;
        }
        else
            durum = 0;
        // add row to OE_EXAMS table
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("select isnull( max(examid),0) + 1 from oe_exams", con);
        int examid = (Int32)cmd.ExecuteScalar();
        cmd.CommandText = "insert into oe_exams values(@examid,@mid,@sid,@noq,@ncans,@stdate,getdate(),@durum,@not,@puan)";
        cmd.Parameters.Add("@examid", SqlDbType.Int).Value = examid;
        cmd.Parameters.Add("@mid", SqlDbType.Int).Value = exam.mid;
        cmd.Parameters.Add("@sid", SqlDbType.Int).Value = exam.sid;
        cmd.Parameters.Add("@noq", SqlDbType.Int).Value = exam.SIZE;
        cmd.Parameters.Add("@ncans", SqlDbType.Int).Value = exam.ncans;
        cmd.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
        cmd.Parameters.Add("@durum", SqlDbType.Int).Value = durum;
        cmd.Parameters.Add("@not", SqlDbType.NVarChar).Value = lblGrade.Text;
        cmd.Parameters.Add("@puan", SqlDbType.NVarChar).Value = exam.ncans * 10;
        cmd.ExecuteNonQuery();
        con.Close();

        lblResult.Visible = false;
        lblSubject.Visible = true;
        lblStime.Visible = true;
        lblMin.Visible = true;
        lblNquestions.Visible = true;
        lblNcans.Visible = true;
        lblGrade.Visible = true;
        int puan = exam.ncans * 10;
        lblPuan.Text = puan.ToString();
        lblPuan.Visible = true;
        lblToplaPuan.Visible = true;

        FillTotalPointNext();

        SqlConnection con1 = new SqlConnection("Data Source=SERHAT\\SERHAT;Initial Catalog=CengP;Integrated Security=True");
        con1.Open();
        SqlCommand cmd1 = new SqlCommand("Update members Set totalpoint='" + lblToplaPuan.Text + "' Where mid=@mid", con1);
        cmd1.Parameters.AddWithValue("mid", exam.mid);
        cmd1.ExecuteNonQuery();
        con1.Close();
    }

    protected void lbRank_Click(object sender, EventArgs e)
    {

        Examination exam = (Examination)Session["questions"];
        double per = (double)exam.ncans / exam.SIZE;
        SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("select count(*) from oe_exams where nocans * 1.0 / noq >= @per and  sid = @sid", con);
        cmd.Parameters.Add("@per", SqlDbType.Decimal).Value = per;
        cmd.Parameters.Add("@sid", SqlDbType.Int).Value = exam.sid;
        int rank = (Int32)cmd.ExecuteScalar();

        cmd.CommandText = "select count(*) from oe_exams where sid = @sid";
        int total = (Int32)cmd.ExecuteScalar();

        con.Close();

        lblRank.Text = "Bu konuyla ilgili toplam " + total.ToString() + " sınavdan " + rank.ToString() + " tanesinde başarılı oldunuz.";

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
                                    <h1>Sonucum</h1>
                                    <asp:LinkButton ID="lblResult" runat="server" ForeColor="Blue" Font-Bold="true" OnClick="lblResult_Click">Sınav Sonucunuzu Görmek İçin Tıklayınız</asp:LinkButton><br />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Banner -->
                <!-- Start Browse Teacher -->

                <section class="browse-teacher grey-bg ">
                    <div class="container">
                        <ul class="row browse-teachers-list clearfix">
                            <li class="col-xs-4 col-sm-4"></li>
                            <li class="col-xs-4 col-sm-4">
                                <figure>
                                    <asp:ListView ID="ListView1" runat="server">
                                        <ItemTemplate>
                                            <img src='<%#Eval("FilePath") %>' width="124" height="124" alt="" />
                                        </ItemTemplate>
                                    </asp:ListView>
                                </figure>
                                <span class="designation">Konu :
                        <asp:Label ID="lblSubject" runat="server" Text="Label" ForeColor="Black" Font-Bold="true" Font-Italic="True" Visible="False"></asp:Label></span>
                                <span class="designation">Başlama Zamanı :
                        <asp:Label ID="lblStime" runat="server" ForeColor="Black" Font-Bold="true" Text="Label" Font-Italic="True" Visible="False"></asp:Label></span>
                                <span class="designation">Toplam Dakika :
                        <asp:Label ID="lblMin" runat="server" ForeColor="Black" Font-Bold="true" Text="Label" Font-Italic="True" Visible="False"></asp:Label></span>
                                <span class="designation">Soru Sayısı :
                        <asp:Label ID="lblNquestions" runat="server" ForeColor="Black" Font-Bold="true" Font-Italic="True" Visible="False"></asp:Label></span>
                                <span class="designation">Doğru Sayısı :
 <asp:Label ID="lblNcans" runat="server" Text="Label" ForeColor="Black" Font-Bold="true" Font-Italic="True" Visible="False"></asp:Label></span>
                                <span class="designation">Notunuz :
                         <asp:Label ID="lblGrade" runat="server" Text="Label" Font-Italic="True" Font-Bold="True" ForeColor="Red" Visible="False"></asp:Label></span>
                                <span class="designation">Aldığınız Puanınız :
            <asp:Label ID="lblPuan" runat="server" Text="Label" Font-Italic="True" Font-Bold="True" ForeColor="Red" Visible="False"></asp:Label></span>
                                <p class="equal-hight">

                                    <h3>Toplam Puan : 
                            <asp:Label ID="lblToplaPuan" runat="server" Text="Label" Font-Italic="True" Font-Bold="True" ForeColor="Blue" Visible="False"></asp:Label></h3>

                                </p>
                                <br />
                                <a href="SinavGecmis.aspx">Sorulara Göz at</a>&nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="lbRank" runat="server" OnClick="lbRank_Click">Başarılı Sınav Sayısı</asp:LinkButton><br />
                                <br />
                                <asp:Label ID="lblRank" runat="server" Font-Bold="True" Font-Italic="True"></asp:Label>
                            </li>
                            <li class="col-xs-4 col-sm-4"></li>
                        </ul>
                    </div>
                    <br />
                </section>

                <!-- end Browse Teacher -->
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

</asp:Content>

