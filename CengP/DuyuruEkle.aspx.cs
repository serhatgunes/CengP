using CKFinder;
using System;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;

public partial class DuyuruEkle : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);
    string fullname; int toplamPuan = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["cookie"];


        if (TotalPuan() < 2500)
        {
            con.Open();
            Response.Redirect("Homepage.aspx");

            con.Close();
        }
        else
        {

        }
        if (!IsPostBack)
        {
            if (Session["mid"] == null)
                Response.Redirect("~/Default.aspx");
            else
            {
                Response.ClearHeaders();
                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                Response.AddHeader("Pragma", "no-cache");
            }

        }
        lblError.Visible = false;
        FillAuthorList();
        FileBrowser f1 = new FileBrowser();
        f1.BasePath = "../ckfinder";
        f1.SetupCKEditor(txtDuyuru);
    }
    protected void btnDuyuru_Click(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["cookie"];
        if (txtDuyuru.Text == "")
        {
            lblError.Visible = true;
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Text = "Duyuru girin.";
        }
        else
        {
            con.Open();
            SqlCommand cmd1 = new SqlCommand("insert into duyuru(baslik,duyuru,t_id,t_isim,tarih,onay) values(@baslik,@duyuru,@t_id,@t_isim,getdate(),@onay)", con);

            cmd1.Parameters.AddWithValue("@baslik", txtBaslik.Text);
            cmd1.Parameters.AddWithValue("@duyuru", txtDuyuru.Text);
            cmd1.Parameters.AddWithValue("@t_id", cookie["mid"]);
            cmd1.Parameters.AddWithValue("@t_isim", fullname);
            cmd1.Parameters.AddWithValue("@onay", 0);
            cmd1.ExecuteNonQuery();
            con.Close();
            lblError.Visible = true;
            lblError.ForeColor = System.Drawing.Color.Green;
            lblError.Text = "Duyuru eklenmiştir onaylandığında yayınlanacaktır.";
            txtDuyuru.Text = "";
        }
    }
    private void FillAuthorList()
    {

        HttpCookie cookieOgr = Request.Cookies["cookie"];
        string selectSQL = "SELECT mid,fullname FROM members WHERE mid='" + cookieOgr["mid"] + "'";

        SqlCommand cmd = new SqlCommand(selectSQL, con);
        SqlDataReader reader;

        try
        {
            con.Open();
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                fullname = reader["fullname"].ToString();
            }
            reader.Close();

        }
        catch (Exception err)
        {
            lblError.Visible = true;
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Text = "Hata";
            lblError.Text += err.Message;
        }
        finally
        {
            con.Close();
        }
    }
    public int TotalPuan()
    {
        HttpCookie cookie = Request.Cookies["cookie"];
        string stmt = "SELECT totalpoint,mid FROM members where mid='" + cookie["mid"] + "'";
        using (SqlConnection thisConnection = new SqlConnection("Data Source = SERHAT\\SERHAT; Initial Catalog = CengP; Integrated Security = True"))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                toplamPuan = Convert.ToInt32(cmdCount.ExecuteScalar());
            }
        }
        return toplamPuan;
    }
}