using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.Configuration;
using System.Web.UI.WebControls;

public partial class Admin_YorumOnay : System.Web.UI.Page
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
        SqlConnection con = new SqlConnection(myconnectionString);
        //Onaysız duyuruların gösterdiği sorgu
        SqlCommand cmd = new SqlCommand("select id,name,email,comment from comment WHERE onay=0", con);
        con.Open();
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds, "comment");
        datagridview.DataSource = ds.Tables[0];
        datagridview.DataBind();
        con.Close();
    }
    protected void datagridview_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        datagridview.PageIndex = e.NewPageIndex;
        fillDataGrid();
    }
    protected void datagridview_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //Duyuru uygunsuz içeriğe sahipse silindiği sorgu
        if (e.CommandName == "Delete")
        {
            int rowno = Int32.Parse(e.CommandArgument.ToString());
            try
            {
                string ProductID = datagridview.Rows[rowno].Cells[2].Text.ToString();
                SqlConnection con = new SqlConnection(myconnectionString);
                SqlCommand cmd = new SqlCommand("Delete  from comment where id='" + ProductID + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                lblname.Text = ProductID + "nolu yorum silindi.";
                fillDataGrid();
            }
            catch (Exception ex)
            {
                lblname.Text = ex.Message.ToString();
                fillDataGrid();
            }
        }
        //Duyuru webte yayınlandığı sorgu
        else if (e.CommandName == "Update")
        {
            int rownoupdate = Int32.Parse(e.CommandArgument.ToString());
            try
            {
                string UpdateNo = datagridview.Rows[rownoupdate].Cells[2].Text.ToString();
                SqlConnection con = new SqlConnection(myconnectionString);
                SqlCommand cmd = new SqlCommand("Update comment SET onay=1 where id='" + UpdateNo + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                lblname.Text = UpdateNo + "nolu yorum onaylanmıştır.";
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
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string item = e.Row.Cells[2].Text;
            foreach (Button button in e.Row.Cells[0].Controls.OfType<Button>())
            {
                if (button.CommandName == "Delete")
                {
                    button.Attributes["onclick"] = "if(!confirm('" + item + " numaralı yorum silinsin mi?')){ return false; };";
                }
            }
        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string item = e.Row.Cells[2].Text;
            foreach (Button button in e.Row.Cells[1].Controls.OfType<Button>())
            {
                if (button.CommandName == "Update")
                {
                    button.Attributes["onclick"] = "if(!confirm('" + item + " numaralı yorum onaylansın mı?')){ return false; };";
                }
            }
        }
        if (e.Row.RowType == DataControlRowType.Header)
        {

            e.Row.Cells[2].ForeColor = System.Drawing.Color.White;
            e.Row.Cells[3].ForeColor = System.Drawing.Color.White;
            e.Row.Cells[4].ForeColor = System.Drawing.Color.White;
            e.Row.Cells[5].ForeColor = System.Drawing.Color.White;



            e.Row.Cells[2].Text = "ID";
            e.Row.Cells[3].Text = "Ad Soyad";
            e.Row.Cells[4].Text = "E-Mail";
            e.Row.Cells[5].Text = "Yorum";


            e.Row.Cells[0].Width = 40;
            e.Row.Cells[1].Width = 80;
            e.Row.Cells[2].Width = 40;
            e.Row.Cells[3].Width = 150;
            e.Row.Cells[4].Width = 200;
            e.Row.Cells[5].Width = 500;


        }
    }

}