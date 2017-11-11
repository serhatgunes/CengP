using CKFinder;
using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;
using System.Web.UI.WebControls;

public partial class DisplayBlog : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);
    int toplamYorum = 0;
    int toplamPuan = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        lblComment.Visible = false;
        if (!this.IsPostBack)
        {
            this.PopulateBlog();
            fillComment();
            FileBrowser f1 = new FileBrowser();
            f1.BasePath = "../ckfinder";
            f1.SetupCKEditor(txtSoru);
        }
        HttpCookie cookie = Request.Cookies["cookie"];
        string selectSQL = "SELECT * FROM members WHERE mid='" + cookie["mid"] + "'";
        SqlCommand cmd = new SqlCommand(selectSQL, con);
        SqlDataReader reader;

        try
        {
            con.Open();
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Name.Text = reader["fullname"].ToString();
                Email.Text = reader["e_mail"].ToString();
            }
            reader.Close();
        }
        catch (Exception err)
        {
            lblResults.Visible = true;
            lblResults.ForeColor = System.Drawing.Color.Red;
            lblResults.Text = "Hata.";
            lblResults.Text += err.Message;
        }
        finally
        {
            con.Close();
        }

        TotalComment();
        lblToplamYorum.Text = toplamYorum.ToString();
        İçerikAl();
        lblQues.Visible = false;

    }
    private void PopulateBlog()
    {
        string blogId = this.Page.RouteData.Values["content_id"].ToString();
        string query = "SELECT C.c_id,C.coursename,M.mid,M.fullname,S.subjectname, L.content_id, L.s_id, L.t_id,LEFT(L.date,10) [date],  L.content from subject S, lectureContent L, members M, courses C where S.s_id=L.s_id AND M.mid=L.t_id AND [content_id] = @content_id AND C.c_id=S.c_id";
        string conString = WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Parameters.AddWithValue("@content_id", blogId);
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        lblTitle.Text = dt.Rows[0]["subjectname"].ToString();
                        lblBody.Text = dt.Rows[0]["content"].ToString();
                        lblWriter.Text = dt.Rows[0]["fullname"].ToString();
                        lblT_id.Text= dt.Rows[0]["mid"].ToString();
                        lblDers.Text = dt.Rows[0]["coursename"].ToString();
                        lblDate.Text = dt.Rows[0]["date"].ToString();
                        Labelwriter.Text = dt.Rows[0]["fullname"].ToString();
                    }
                }
            }
        }
    }
    protected void btnComment_Click(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["cookie"];
        if (cookie != null)
        {
            string mid = cookie["mid"];
            //lastVisited.Text = "Son Aktiflik : " + Session["dlv"].ToString();
        }
        else
        {
            Response.Redirect("Default.aspx");
        }

        string blogId = this.Page.RouteData.Values["content_id"].ToString();

        if (txtMessage.Text == "")
        {
            lblComment.Visible = true;
            lblComment.ForeColor = System.Drawing.Color.Red;
            lblComment.Text = "Yorum girin.";
        }
        else
        {
            con.Open();
            //Öğrenci yorum yaptırdığımız sorgu 
            SqlCommand cmd1 = new SqlCommand("insert into comment(Comment,Name,Email,onay,alan,mid) values(@comment,@name,@email,@onay,@alan,@mid)", con);

            cmd1.Parameters.AddWithValue("@comment", txtMessage.Text);
            cmd1.Parameters.AddWithValue("@name", txtName.Text);
            cmd1.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd1.Parameters.AddWithValue("@onay", 0);
            cmd1.Parameters.AddWithValue("@alan", blogId);
            cmd1.Parameters.AddWithValue("@mid", cookie["mid"]);
            cmd1.ExecuteNonQuery();
            con.Close();
            lblComment.Visible = true;
            lblComment.ForeColor = System.Drawing.Color.Green;
            lblComment.Text = "Yorumunuz eklenmiştir onaylandığında yayınlanacaktır.";
            fillComment();
            txtMessage.Text = "";
            LinkButton1.Visible = true;
        }
    }
    public int PageNumber
    {
        get
        {
            if (ViewState["PageNumber"] != null)
                return Convert.ToInt32(ViewState["PageNumber"]);
            else
                return 0;
        }
        set
        {
            ViewState["PageNumber"] = value;
        }
    }
    private void fillComment()
    {
        string blogId = this.Page.RouteData.Values["content_id"].ToString();
        con.Open();
        DataTable dt = new DataTable();
        SqlDataAdapter adapt = new SqlDataAdapter("SELECT M.mid,M.FilePath,C.id,C.name,C.email,C.comment,C.onay,C.alan from members M,  comment C where alan='" + blogId + "' AND M.mid=C.mid  ORDER BY id DESC", con);
        adapt.Fill(dt);
        con.Close();
        PagedDataSource pds = new PagedDataSource();
        DataView dv = new DataView(dt);
        pds.DataSource = dv;
        pds.AllowPaging = true;
        pds.PageSize = 2;
        pds.CurrentPageIndex = PageNumber;
        if (pds.PageCount > 1)
        {
            rptPaging.Visible = true;
            ArrayList arraylist = new ArrayList();
            for (int i = 0; i < pds.PageCount; i++)
                arraylist.Add((i + 1).ToString());
            rptPaging.DataSource = arraylist;
            rptPaging.DataBind();
        }
        else
        {
            rptPaging.Visible = false;
        }
        Repeater1.DataSource = pds;
        Repeater1.DataBind();
    }
    protected void rptPaging_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
        fillComment();
    }
    public int TotalComment()
    {
        string blogId = this.Page.RouteData.Values["content_id"].ToString();

        string stmt = "SELECT COUNT(*) from  comment where alan='" + blogId + "'";
        using (SqlConnection thisConnection = new SqlConnection("Data Source = SERHAT\\SERHAT; Initial Catalog = CengP; Integrated Security = True"))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                toplamYorum = Convert.ToInt32(cmdCount.ExecuteScalar());
            }
        }
        return toplamYorum;
    }
    protected void İçerikAl()
    {
        DataTable dt = new DataTable();
        //string strQuery = "SELECT [content_id], [s_id],[t_id],REPLACE([s_id], ' ', '-') [SLUG], left(content, 200) [content] FROM [lectureContent]";
        string strQuery = "SELECT TOP 5 C.c_id,C.FilePath,M.mid,M.fullname,LEFT(S.subjectname,25) [subjectname], L.content_id, L.s_id, L.t_id,LEFT(L.date,10) [date],  LEFT(L.content,250) [content] ,REPLACE([subjectname], ' ', '-') [SLUG] from subject S, lectureContent L, members M, courses C where S.s_id=L.s_id AND M.mid=L.t_id AND C.c_id=S.c_id  ORDER BY L.date DESC ";

        SqlCommand cmd = new SqlCommand(strQuery);
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);
        SqlDataAdapter sda = new SqlDataAdapter();
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        try
        {
            con.Open();
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
            con.Close();
            sda.Dispose();
            con.Dispose();
        }
    }
    public int TotalPuan()
    {
        HttpCookie cookie = Request.Cookies["cookie"];
        string stmt = "SELECT totalpoint,mid FROM members where mid='" + cookie["mid"] + "'";
        using (SqlConnection thisConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                toplamPuan = Convert.ToInt32(cmdCount.ExecuteScalar());
            }
        }
        return toplamPuan;
    }
    protected void btnQuestion_Click(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["cookie"];

        if (txtSoru.Text == "")
        {
            lblQues.Visible = true;
            lblQues.ForeColor = System.Drawing.Color.Red;
            lblQues.Text = "Sorunuzu girin.";
            txtSoru.Visible = true;
            LinkButton1.Visible = true;
        }
        else
        {
            if (TotalPuan() > 1000 && lblT_id.Text != cookie["mid"])
            {
                con.Open();
                SqlCommand cmd1 = new SqlCommand("insert into mesajlar (m_id,kimden,c_id,mesaj,tarih,durum,durumres) values (@m_id,@kimden,@c_id,@mesaj,@tarih,@durum,@durumres)", con);

                cmd1.Parameters.AddWithValue("@m_id", cookie["mid"]);
                cmd1.Parameters.AddWithValue("@kimden", Name.Text);
                cmd1.Parameters.AddWithValue("@c_id", lblT_id.Text);
                cmd1.Parameters.AddWithValue("@mesaj", txtSoru.Text);
                cmd1.Parameters.AddWithValue("@tarih", DateTime.Now.ToString());
                cmd1.Parameters.AddWithValue("@durum", "0");
                cmd1.Parameters.AddWithValue("@durumres", "message/okunmadi.png");

                cmd1.ExecuteNonQuery();
                con.Close();
                lblQues.Visible = true;
                lblQues.ForeColor = System.Drawing.Color.Green;
                lblQues.Text = "Sorunuz gönderilmiştir.";
                fillComment();
                txtSoru.Text = "";
                txtSoru.Visible = true;
                LinkButton1.Visible = true;
            }
            else
            {
                lblQues.Visible = true;
                lblQues.ForeColor = System.Drawing.Color.Red;
                lblQues.Text = "Puanınız yetersiz veya kendi içeriğiniz.";
                txtSoru.Visible = true;
                LinkButton1.Visible = true;
            }
        }
    }
}