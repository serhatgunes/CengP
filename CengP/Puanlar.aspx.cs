using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

public partial class Puanlar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.Score();
        }
    }
    private void Score()
    {
        using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM members where onay=1 ORDER BY totalpoint DESC"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        ListView2.DataSource = dt;
                        ListView2.DataBind();
                    }
                }
            }
        }
    }
}