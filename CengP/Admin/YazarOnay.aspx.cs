using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web.Configuration;
using System.Web.UI.WebControls;

public partial class Admin_YazarOnay : System.Web.UI.Page
{
    private String myconnectionString = WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillDataGrid();
        }
    }
    public void fillDataGrid()
    {
        string conString = WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString;
        SqlConnection sqlcon = new SqlConnection(conString);
        SqlCommand sqlcmd;
        SqlDataAdapter da;
        DataTable dt = new DataTable();
        String query;

        if (txtSearch.Text == "")
        {
            query = "select mid,fullname,e_mail,school,totalpoint from members WHERE onay=0";
        }
        else
        {
            query = "select mid,fullname,e_mail,school,totalpoint from members WHERE onay=0 and fullname LIKE '%" + txtSearch.Text + "%' or mid LIKE '%" + txtSearch.Text + "%'";
        }
        sqlcmd = new SqlCommand(query, sqlcon);
        sqlcon.Open();
        da = new SqlDataAdapter(sqlcmd);
        dt.Clear();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            datagridview.DataSource = dt;
            datagridview.DataBind();
        }
        else
        {
            datagridview.DataBind();
            lblname.Text = "Kayıt Bulunamadı";
        }
        sqlcon.Close();
    }
}