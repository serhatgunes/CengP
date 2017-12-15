using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.Configuration;
using System.Web.UI.WebControls;

public partial class Admin_DuyuruOnay : System.Web.UI.Page
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
        SqlCommand cmd = new SqlCommand("select d_id,baslik,duyuru,t_isim,tarih from duyuru WHERE onay=0", con);
        con.Open();
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds, "duyuru");
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
        if (e.CommandName == "Delete")
        {
            int rowno = Int32.Parse(e.CommandArgument.ToString());
            try
            {
                string ProductID = datagridview.Rows[rowno].Cells[2].Text.ToString();
                SqlConnection con = new SqlConnection(myconnectionString);
                SqlCommand cmd = new SqlCommand("Delete  from duyuru where d_id='" + ProductID + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                lblname.Text = ProductID + " numaralı duyuru silindi.";
                fillDataGrid();
            }
            catch (Exception ex)
            {
                lblname.Text = ex.Message.ToString();
                fillDataGrid();
            }
        }
        else if (e.CommandName == "Update")
        {
            int rownoupdate = Int32.Parse(e.CommandArgument.ToString());
            try
            {
                string UpdateNo = datagridview.Rows[rownoupdate].Cells[2].Text.ToString();
                SqlConnection con = new SqlConnection(myconnectionString);
                SqlCommand cmd = new SqlCommand("Update duyuru SET onay=1 where d_id='" + UpdateNo + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                lblname.Text = UpdateNo + " numaralı duyuru onaylanmıştır.";
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
                    button.Attributes["onclick"] = "if(!confirm('" + item + " numaralı duyuru silinsin mi?')){ return false; };";
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
                    button.Attributes["onclick"] = "if(!confirm('" + item + " numaralı duyuru onaylansın mı?')){ return false; };";
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
            e.Row.Cells[3].Text = "Başlık";
            e.Row.Cells[4].Text = "Duyuru";
            e.Row.Cells[5].Text = "Yazar";
            e.Row.Cells[6].Text = "Tarih";


            e.Row.Cells[0].Width = 40;
            e.Row.Cells[1].Width = 80;
            e.Row.Cells[2].Width = 40;
            e.Row.Cells[3].Width = 150;
            e.Row.Cells[4].Width = 400;
            e.Row.Cells[5].Width = 150;
            e.Row.Cells[6].Width = 150;


        }
    }
}