using System;
using System.Data.SqlClient;
using System.Web;
using CKFinder;
using System.Data;
using System.Web.Configuration;

public partial class SoruOku : System.Web.UI.Page
{
    private string connectionString = WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString;
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);
    string m_id;
    string mesaj;
    string ogrisim;
    string filepath;
    protected void Page_Load(object sender, EventArgs e)
    {
        lblAnswer.Visible = false;
        string id = Request.QueryString["mesajid"];
        string kdurum = "1";
        string kdurumres = "message/okundu.png";
        SqlCommand com = new SqlCommand("UPDATE mesajlar SET durum='" + kdurum + "', durumres='" + kdurumres + "' where mesajid=@mesajid", con);
        com.Parameters.Add("@mesajid", System.Data.SqlDbType.Int).Value = id;
        con.Open();
        com.ExecuteNonQuery();
        com.Dispose();
        con.Close();

        FillAuthorList();
        Fill();
        Foto();
        if (!IsPostBack)
        {


            FileBrowser f1 = new FileBrowser();
            f1.BasePath = "../ckfinder";
            f1.SetupCKEditor(txtAnswer);
        }

    }
    private void FillAuthorList()
    {

        HttpCookie cookieOgr = Request.Cookies["cookie"];
        string selectSQL = "SELECT mid,fullname FROM members WHERE mid='" + cookieOgr["mid"] + "'";

        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand(selectSQL, con);
        SqlDataReader reader;

        try
        {
            con.Open();
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                ogrisim = reader["fullname"].ToString();
            }
            reader.Close();

        }
        catch (Exception err)
        {
            lblHata.Visible = true;
            lblHata.ForeColor = System.Drawing.Color.Red;
            lblHata.Text = "Hata";
            lblHata.Text += err.Message;
        }
        finally
        {
            con.Close();
        }
    }
    private void Fill()
    {
        //Öğrenciden gelen mesajları gösteren kod
        string id = Request.QueryString["mesajid"];
        SqlCommand com = new SqlCommand("SELECT * FROM mesajlar WHERE mesajid=@mesajid", con);
        SqlDataReader reader;
        com.Parameters.Add("@mesajid", System.Data.SqlDbType.Int).Value = id;
        con.Open();
        reader = com.ExecuteReader();

        while (reader.Read())
        {
            m_id = reader["m_id"].ToString();
            mesaj = reader["mesaj"].ToString();
        }
        reader.Close();

        com.ExecuteNonQuery();
        com.Dispose();
        con.Close();
    }
    protected void btnAnswer_Click(object sender, EventArgs e)
    {
        HttpCookie cookieOgr = Request.Cookies["cookie"];
        //Displaying Javascript alert Comment Posted Successfully
        if (txtAnswer.Text == "")
        {
            lblAnswer.Visible = true;
            lblAnswer.ForeColor = System.Drawing.Color.Red;
            lblAnswer.Text = "Cevap girin.";
        }
        else
        {
            con.Open();
            //Gelen Soruyu cevapladığı kod
            SqlCommand cmd1 = new SqlCommand("insert into mesajCevap (t_id,m_id,kimden,mesaj,mesajcvp,tarih,durum,durumres) values (@t_id,@m_id,@kimden,@mesaj,@mesajcvp,@tarih,@durum,@durumres)", con);

            cmd1.Parameters.AddWithValue("@t_id", cookieOgr["mid"]);
            cmd1.Parameters.AddWithValue("@m_id", m_id);
            cmd1.Parameters.AddWithValue("@kimden", ogrisim);
            cmd1.Parameters.AddWithValue("@mesaj", mesaj);
            cmd1.Parameters.AddWithValue("@mesajcvp", txtAnswer.Text);
            cmd1.Parameters.AddWithValue("@tarih", DateTime.Now.ToString());
            cmd1.Parameters.AddWithValue("@durum", "0");
            cmd1.Parameters.AddWithValue("@durumres", "message/okunmadi.png");

            cmd1.ExecuteNonQuery();
            con.Close();
            lblAnswer.Visible = true;
            lblAnswer.ForeColor = System.Drawing.Color.Green;
            lblAnswer.Text = "Cevap gönderilmiştir.";
            txtAnswer.Text = "";
        }
    }
    protected void Foto()
    {
        DataTable dt = new DataTable();
        string strQuery = "select mid,FilePath from members WHERE mid='" + m_id + "' ";
        SqlCommand cmd = new SqlCommand(strQuery);
        SqlConnection con = new SqlConnection(connectionString);
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
}