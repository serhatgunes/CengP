using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.Configuration;

public partial class Profilim : System.Web.UI.Page
{
    string strConnString = WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString;
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
}