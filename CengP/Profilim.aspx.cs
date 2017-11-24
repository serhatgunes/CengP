using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.Configuration;

public partial class Profilim : System.Web.UI.Page
{
    string strConnString = WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString;
    int countSoru = 0;
    int countSinav = 0;
    int countMukemmel = 0;
    int countOrta = 0;
    int countZayif = 0;
    int countSorulanSoru = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["cookie"];
        if (cookie != null)
        {
            string mid = cookie["mid"];
        }
        else
        {
            Response.Redirect("Account/Logout.aspx");
        }
        lblBilgi.Visible = false;
        Foto();
        OgrenciSoru();
        OgrenciSınav();
        MukemelSinav();
        OrtaSınav();
        ZayıfSinav();
        SorulanSoru();
        TotalPuan();

        lblSoru.Text = countSoru.ToString();
        lblSinav.Text = countSinav.ToString();
        lblukemel.Text = countMukemmel.ToString();
        lblOrta.Text = countOrta.ToString();
        lblZayıf.Text = countZayif.ToString();
        lblSordugumSoru.Text = countSorulanSoru.ToString();
    }
    protected void Foto()
    {
        HttpCookie cookie = Request.Cookies["cookie"];
        DataTable dt = new DataTable();
        string strQuery = "select mid,FilePath from members WHERE mid='" + cookie["mid"] + "' ";
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
            GridView1.DataSource = dt;
            GridView1.DataBind();

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
    protected void PhotoUpload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.PostedFile != null)
        {
            string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);

            //Save files to disk
            FileUpload1.SaveAs(Server.MapPath("ProfilFotograf/" + FileName));
            HttpCookie cookie = Request.Cookies["cookie"];
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);
            string strQuery = "update members Set FileName='" + FileName + "', FilePath='" + "ProfilFotograf/" + FileName + "' WHERE mid='" + cookie["mid"] + "'";
            SqlCommand cmd = new SqlCommand(strQuery);


            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                lblBilgi.Visible = true;
                lblBilgi.ForeColor = System.Drawing.Color.Green;
                lblBilgi.Text = "Profil fotoğrafınız yüklenmiştir.";
            }
            catch (Exception ex)
            {
                lblBilgi.Visible = true;
                lblBilgi.ForeColor = System.Drawing.Color.Red;
                lblBilgi.Text = "Hata : " + ex.Message;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }
        Foto();
    }
    public int OgrenciSoru()
    {
        HttpCookie cookie = Request.Cookies["cookie"];
        string stmt = "SELECT COUNT(*) FROM oe_exams where mid='" + cookie["mid"] + "'";


        using (SqlConnection thisConnection = new SqlConnection(strConnString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countSoru = (int)cmdCount.ExecuteScalar() * 10;
            }
        }
        return countSoru;
    }
    public int OgrenciSınav()
    {
        HttpCookie cookie = Request.Cookies["cookie"];
        string stmt = "SELECT COUNT(*) FROM oe_exams where mid='" + cookie["mid"] + "'";


        using (SqlConnection thisConnection = new SqlConnection(strConnString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countSinav = (int)cmdCount.ExecuteScalar();
            }
        }
        return countSinav;
    }
    public int MukemelSinav()
    {
        HttpCookie cookie = Request.Cookies["cookie"];
        string stmt = "SELECT COUNT(*) FROM oe_exams where mid='" + cookie["mid"] + "' and durum=1";


        using (SqlConnection thisConnection = new SqlConnection(strConnString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countMukemmel = (int)cmdCount.ExecuteScalar();
            }
        }
        return countMukemmel;
    }
    public int OrtaSınav()
    {
        HttpCookie cookie = Request.Cookies["cookie"];
        string stmt = "SELECT COUNT(*) FROM oe_exams where mid='" + cookie["mid"] + "' and durum=2";


        using (SqlConnection thisConnection = new SqlConnection(strConnString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countOrta = (int)cmdCount.ExecuteScalar();
            }
        }
        return countOrta;
    }
    public int ZayıfSinav()
    {
        HttpCookie cookie = Request.Cookies["cookie"];
        string stmt = "SELECT COUNT(*) FROM oe_exams where mid='" + cookie["mid"] + "' and durum=0";


        using (SqlConnection thisConnection = new SqlConnection(strConnString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countZayif = (int)cmdCount.ExecuteScalar();
            }
        }
        return countZayif;
    }
    public int SorulanSoru()
    {
        HttpCookie cookie = Request.Cookies["cookie"];
        string stmt = "SELECT COUNT(*) FROM mesajlar where m_id='" + cookie["mid"] + "'";


        using (SqlConnection thisConnection = new SqlConnection(strConnString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countSorulanSoru = (int)cmdCount.ExecuteScalar();
            }
        }
        return countSorulanSoru;
    }
    private void TotalPuan()
    {
        HttpCookie cookie = Request.Cookies["cookie"];
        string selectSQL = "SELECT mid,totalpoint FROM members WHERE mid='" + cookie["mid"] + "'";

        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand(selectSQL, con);
        SqlDataReader reader;

        try
        {
            con.Open();
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                ToplamPuan.Text = "";
                ToplamPuan.Text = reader["totalpoint"].ToString();

            }
            reader.Close();

        }
        catch (Exception err)
        {
            ToplamPuan.Text = "Hata";
            ToplamPuan.Text += err.Message;
        }
        finally
        {
            con.Close();
        }
    }
}