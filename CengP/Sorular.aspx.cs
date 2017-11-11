using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;
using System.Web.UI.WebControls;

public partial class Sorular : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookieOgr = Request.Cookies["cookie"];
        string selectSQL = "SELECT mid FROM members WHERE mid='" + cookieOgr["mid"] + "'";

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);
        SqlCommand cmd = new SqlCommand(selectSQL, con);
        SqlDataReader reader;

        try
        {
            con.Open();
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Label1.Text = "";
                Label1.Text = reader["mid"].ToString();
            }
            reader.Close();

        }
        catch (Exception err)
        {
            Label1.Visible = true;
            Label1.ForeColor = System.Drawing.Color.Red;
            Label1.Text = "Hata";
            Label1.Text += err.Message;
        }
        finally
        {
            con.Close();
        }
    }
    protected void renkler(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            if (e.Row.Cells[3].Text == "0")
            {
                e.Row.Font.Bold = true;
            }
            else
                if (e.Row.Cells[3].Text == "1")
            {
                e.Row.Font.Bold = false;
            }
        }
    }
}