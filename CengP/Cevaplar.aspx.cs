using System;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;
using System.Web.UI.WebControls;

public partial class Cevaplar : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);
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
        GridviewBind();
    }
    protected void GridviewBind()
    {
        using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
        {
            HttpCookie cookie = Request.Cookies["cookie"];
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM [mesajCevap] WHERE m_id='" + cookie["mid"] + "'", con);
            SqlDataReader dr = cmd.ExecuteReader();
            GridView1.DataSource = dr;
            GridView1.DataBind();
            con.Close();
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        string id = GridView1.DataKeys[e.RowIndex].Value.ToString();

        SqlCommand cmd = new SqlCommand("DELETE FROM mesajCevap WHERE id =" + id, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();


        GridviewBind();
    }
    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
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