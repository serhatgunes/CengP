using System;
using System.Collections.Generic;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.Configuration;
using System.Web.UI.WebControls;

public partial class Admin_Iletisim : System.Web.UI.Page
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
        //Admine gelen mesajların sayfada gösterildiği sorgu
        SqlConnection con = new SqlConnection(myconnectionString);
        SqlCommand cmd = new SqlCommand("select id,name,email,subject,message,date from contact WHERE durum=0  ORDER BY id DESC", con);
        con.Open();
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds, "contact");
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
        //Mesajı sildiği kısım
        if (e.CommandName == "Delete")
        {
            int rowno = Int32.Parse(e.CommandArgument.ToString());
            try
            {
                string ProductID = datagridview.Rows[rowno].Cells[2].Text.ToString();
                SqlConnection con = new SqlConnection(myconnectionString);
                SqlCommand cmd = new SqlCommand("Delete  from contact where id='" + ProductID + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                lblname.Text = "Mesaj Silinmiştir.";
                fillDataGrid();
            }
            catch (Exception ex)
            {
                lblname.Text = ex.Message.ToString();
                fillDataGrid();
            }
        }
        //Mesajı okundu olarak işaretlediği sorgu
        else if (e.CommandName == "Update")
        {
            int rownoupdate = Int32.Parse(e.CommandArgument.ToString());
            try
            {
                string UpdateNo = datagridview.Rows[rownoupdate].Cells[2].Text.ToString();
                SqlConnection con = new SqlConnection(myconnectionString);
                SqlCommand cmd = new SqlCommand("Update contact SET durum=1 where id='" + UpdateNo + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                lblname.Text = UpdateNo + " nolu Mesaj Okunanlar Kısmına Taşınmıştır";
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
                    button.Attributes["onclick"] = "if(!confirm('" + item + " numaralı mesaj silinsin mi?')){ return false; };";
                }
            }
        }
        if (e.Row.RowType == DataControlRowType.Header)
        {

            e.Row.Cells[2].ForeColor = System.Drawing.Color.White;
            e.Row.Cells[3].ForeColor = System.Drawing.Color.White;
            e.Row.Cells[4].ForeColor = System.Drawing.Color.White;
            e.Row.Cells[5].ForeColor = System.Drawing.Color.White;
            e.Row.Cells[6].ForeColor = System.Drawing.Color.White;
            e.Row.Cells[7].ForeColor = System.Drawing.Color.White;


            e.Row.Cells[2].Text = "ID";
            e.Row.Cells[3].Text = "İsim";
            e.Row.Cells[4].Text = "E-Mail";
            e.Row.Cells[5].Text = "Konu";
            e.Row.Cells[6].Text = "Mesaj";
            e.Row.Cells[7].Text = "Tarih";


            e.Row.Cells[0].Width = 35;
            e.Row.Cells[1].Width = 75;
            e.Row.Cells[2].Width = 30;
            e.Row.Cells[3].Width = 120;
            e.Row.Cells[4].Width = 210;
            e.Row.Cells[5].Width = 150;
            e.Row.Cells[6].Width = 300;
            e.Row.Cells[7].Width = 150;


        }
    }
}