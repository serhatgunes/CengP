﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.Configuration;
using System.Web.UI.WebControls;

public partial class Admin_OnayliKullanici : System.Web.UI.Page
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
            query = "select mid,fullname,e_mail,school,totalpoint from members WHERE onay=1 AND totalpoint<2500 ORDER BY totalpoint DESC";
        }
        else
        {
            query = "select mid,fullname,e_mail,school,totalpoint from members WHERE onay=1 AND totalpoint<2500 and fullname LIKE '%" + txtSearch.Text + "%' or mid LIKE '%" + txtSearch.Text + "%' ORDER BY totalpoint DESC";
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
        if (e.CommandName == "Delete")
        {
            int rowno = Int32.Parse(e.CommandArgument.ToString());
            try
            {
                string ProductID = datagridview.Rows[rowno].Cells[2].Text.ToString();
                SqlConnection con = new SqlConnection(myconnectionString);
                SqlCommand cmd = new SqlCommand("Delete  from members where mid='" + ProductID + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                lblname.Text = ProductID + " Numaralı Kullanıcı Silinmiştir.";
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
                SqlCommand cmd = new SqlCommand("Update members SET onay=0 where mid='" + UpdateNo + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                lblname.Text = UpdateNo + " Numaralı Kullanıcının Onayı Kaldırılmıştır.";
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
                    button.Attributes["onclick"] = "if(!confirm('" + item + " numaralı kullanıcı silinsin mi?')){ return false; };";
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
                    button.Attributes["onclick"] = "if(!confirm('" + item + " numaralı kullanıcı onayı kaldırılsın mı?')){ return false; };";
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


            e.Row.Cells[2].Text = "ID";
            e.Row.Cells[3].Text = "Ad Soyad";
            e.Row.Cells[4].Text = "E-Mail";
            e.Row.Cells[5].Text = "Okul";
            e.Row.Cells[6].Text = "Puanı";


            e.Row.Cells[0].Width = 40;
            e.Row.Cells[1].Width = 80;
            e.Row.Cells[2].Width = 40;
            e.Row.Cells[3].Width = 120;
            e.Row.Cells[4].Width = 200;
            e.Row.Cells[5].Width = 250;
            e.Row.Cells[6].Width = 55;


        }
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        this.fillDataGrid();
        lblname.Text = "";
    }
    protected void lnkBtn_Click(object sender, EventArgs e)
    {
        this.fillDataGrid();
        lblname.Text = "";
    }
}