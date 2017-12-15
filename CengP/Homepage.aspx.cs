using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Homepage : System.Web.UI.Page
{
    int toplamYorum = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        İçerikAl();
        TotalComment();

    }
    protected void İçerikAl()
    {
        DataTable dt = new DataTable();
        //string strQuery = "SELECT [content_id], [s_id],[t_id],REPLACE([s_id], ' ', '-') [SLUG], left(content, 200) [content] FROM [lectureContent]";
        string strQuery = "SELECT C.c_id,C.FilePath,M.mid,M.fullname,S.subjectname, L.content_id, L.s_id, L.t_id,LEFT(L.date,10) [date],  LEFT(L.content,250) [content] ,REPLACE([subjectname], ' ', '-') [SLUG] from subject S, lectureContent L, members M, courses C where S.s_id=L.s_id AND M.mid=L.t_id AND C.c_id=S.c_id  ORDER BY L.date DESC ";

        SqlCommand cmd = new SqlCommand(strQuery);
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);
        SqlDataAdapter sda = new SqlDataAdapter();
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        try
        {
            con.Open();
            sda.SelectCommand = cmd;
            sda.Fill(dt);
            ListView1.DataSource = dt;
            ListView1.DataBind();

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
            con.Close();
            sda.Dispose();
            con.Dispose();
        }
    }
    public int TotalComment()
    {
        string stmt = "SELECT COUNT(*) from lectureContent L, comment C  where C.alan=L.content_id";
        using (SqlConnection thisConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                toplamYorum = Convert.ToInt32(cmdCount.ExecuteScalar());
            }
        }
        return toplamYorum;
    }
}