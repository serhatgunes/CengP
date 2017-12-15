using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_KonuDuzenle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {

            e.Row.Cells[1].ForeColor = System.Drawing.Color.White;
            e.Row.Cells[2].ForeColor = System.Drawing.Color.White;

            e.Row.Cells[1].Text = "ID";
            e.Row.Cells[2].Text = "Konu Adı";

            e.Row.Cells[0].Width = 170;
            e.Row.Cells[1].Width = 60;
            e.Row.Cells[2].Width = 350;
        }
    }
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {

            e.Row.Cells[1].ForeColor = System.Drawing.Color.White;
            e.Row.Cells[2].ForeColor = System.Drawing.Color.White;

            e.Row.Cells[1].Text = "ID";
            e.Row.Cells[2].Text = "Konu Adı";

            e.Row.Cells[0].Width = 170;
            e.Row.Cells[1].Width = 60;
            e.Row.Cells[2].Width = 350;
        }
    }
    protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {

            e.Row.Cells[1].ForeColor = System.Drawing.Color.White;
            e.Row.Cells[2].ForeColor = System.Drawing.Color.White;

            e.Row.Cells[1].Text = "ID";
            e.Row.Cells[2].Text = "Konu Adı";

            e.Row.Cells[0].Width = 170;
            e.Row.Cells[1].Width = 60;
            e.Row.Cells[2].Width = 350;
        }
    }
    protected void GridView4_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {

            e.Row.Cells[1].ForeColor = System.Drawing.Color.White;
            e.Row.Cells[2].ForeColor = System.Drawing.Color.White;

            e.Row.Cells[1].Text = "ID";
            e.Row.Cells[2].Text = "Konu Adı";

            e.Row.Cells[0].Width = 170;
            e.Row.Cells[1].Width = 60;
            e.Row.Cells[2].Width = 350;
        }
    }
}