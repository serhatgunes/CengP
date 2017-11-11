using System;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class Homepage : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);
    string cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["username"] == null)
                Response.Redirect("Default.aspx");
            else
            {
                Response.ClearHeaders();
                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                Response.AddHeader("Pragma", "no-cache");
            }


        }
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
        FillAuthorList();
        Foto();
        verigetir();
        verigetirOgr();
    }
    private void FillAuthorList()
    {
        HttpCookie cookie = Request.Cookies["cookie"];
        string selectSQL = "SELECT mid,fullname FROM members WHERE mid='" + cookie["mid"] + "'";

        SqlCommand cmd = new SqlCommand(selectSQL, con);
        SqlDataReader reader;

        try
        {
            con.Open();
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                lblUsername.Text = "";
                lblUsername.Text = "Hoşgeldİn " + reader["fullname"].ToString();

            }
            reader.Close();

        }
        catch (Exception err)
        {
            lblUsername.Visible = true;
            lblUsername.ForeColor = System.Drawing.Color.Red;
            lblUsername.Text = "Hata";
            lblUsername.Text += err.Message;
        }
        finally
        {
            con.Close();
        }
    }
    protected void Foto()
    {
        HttpCookie cookie = Request.Cookies["cookie"];
        DataTable dt = new DataTable();
        string strQuery = "select mid,FilePath from members WHERE mid='" + cookie["mid"] + "' ";
        SqlCommand cmd = new SqlCommand(strQuery);
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
    void verigetir()

    {
        HttpCookie cookieOgr = Request.Cookies["cookie"];
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);
        SqlCommand com = new SqlCommand("SELECT COUNT(*) FROM mesajlar WHERE c_id = '" + cookieOgr["mid"] + "' and durum = 0", con);
        con.Open();
        int sayi = Convert.ToInt32(com.ExecuteScalar());

            Label1.Text = "(" + "<b>" + sayi.ToString() + "</b>" + ") Yenİ Soru";

        con.Close();
    }
    void verigetirOgr()
    {
        HttpCookie cookie = Request.Cookies["cookie"];
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);
        SqlCommand com = new SqlCommand("SELECT COUNT(*) FROM mesajCevap WHERE m_id = '" + cookie["mid"] + "' and durum = 0", con);
        con.Open();
        int sayi = Convert.ToInt32(com.ExecuteScalar());

            Label2.Text = "(" + "<b>" + sayi.ToString() + "</b>" + ") Yenİ Cevap";

        con.Close();
    }

}
