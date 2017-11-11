using CKFinder;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Duyurular : System.Web.UI.Page
{
    string t_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        Duyuru10();
    }
    protected void Duyuru10()
    {
        DataTable dt = new DataTable();
        string strQuery = "select TOP 10 d_id,baslik,duyuru,t_id,t_isim,tarih,onay from duyuru WHERE onay=1 ORDER BY d_id DESC";
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
            ListView2.DataSource = dt;
            ListView2.DataBind();

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