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
    protected void datagridview_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        datagridview.PageIndex = e.NewPageIndex;
        fillDataGrid();
    }
    protected void datagridview_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //Admin sayfası onaysız yazarı sildiğim sorgu
        if (e.CommandName == "Delete")
        {
            int rowno = int.Parse(e.CommandArgument.ToString());
            try
            {
                string ProductID = datagridview.Rows[rowno].Cells[2].Text.ToString();
                SqlConnection con = new SqlConnection(myconnectionString);
                SqlCommand cmd = new SqlCommand("Delete  from members where mid='" + ProductID + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                lblname.Text = ProductID + " Numaralı Yazar Silinmiştir.";
                fillDataGrid();

            }
            catch (Exception ex)
            {
                lblname.Text = ex.Message.ToString();
                fillDataGrid();
            }
        }
        //Admin sayfası onaysız yazarı onayladığım sorgu
        else if (e.CommandName == "Update")
        {
            int rownoupdate = Int32.Parse(e.CommandArgument.ToString());
            try
            {
                string UpdateNo = datagridview.Rows[rownoupdate].Cells[2].Text.ToString();
                SqlConnection con = new SqlConnection(myconnectionString);
                SqlCommand cmd = new SqlCommand("Update members SET onay=1 where mid='" + UpdateNo + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                lblname.Text = UpdateNo + " Numaralı Yazar Onaylanmıştır.";
                fillDataGrid();
            }
            catch (Exception ex)
            {
                lblname.Text = ex.Message.ToString();
                fillDataGrid();
            }
        }
    }
    protected void datagridview_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        // this is important
    }
    protected void datagridview_RowUpdate(object sender, GridViewUpdateEventArgs e)
    {
        // this is important
    }
}