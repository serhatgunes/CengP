using System;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;
using System.Web.UI.WebControls;

public partial class Sinavlarim : System.Web.UI.Page
{
    private string connectionString = WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
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
            FillSession_mid();
            FillTotalPoint();
        }
    }
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
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[0].ForeColor = System.Drawing.Color.DarkGreen;
            e.Row.Cells[1].ForeColor = System.Drawing.Color.DarkGreen;
            e.Row.Cells[2].ForeColor = System.Drawing.Color.DarkGreen;
            e.Row.Cells[3].ForeColor = System.Drawing.Color.DarkGreen;
            e.Row.Cells[4].ForeColor = System.Drawing.Color.DarkGreen;
            e.Row.Cells[5].ForeColor = System.Drawing.Color.DarkGreen;
            e.Row.Cells[6].ForeColor = System.Drawing.Color.DarkGreen;
            e.Row.Cells[7].ForeColor = System.Drawing.Color.DarkGreen;

            e.Row.Cells[0].Text = "Sınav Konusu";
            e.Row.Cells[1].Text = "Soru Sayısı";
            e.Row.Cells[2].Text = "Doğru Sayısı";
            e.Row.Cells[3].Text = "Yanlış Sayısı";
            e.Row.Cells[4].Text = "Tarih";
            e.Row.Cells[5].Text = "Toplam Dakika";
            e.Row.Cells[6].Text = "Not";
            e.Row.Cells[7].Text = "Puan";
        }
    }
    private void FillTotalPoint()
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

                lblToplaPuan.Text = "Toplam Puanınız : " + reader["TotalPuan"].ToString();

            }
            reader.Close();

        }
        catch (Exception err)
        {
            lblToplaPuan.Visible = true;
            lblToplaPuan.ForeColor = System.Drawing.Color.Red;
            lblToplaPuan.Text = "Hata";
            lblToplaPuan.Text += err.Message;
        }
        finally
        {
            con.Close();
        }
    }
}