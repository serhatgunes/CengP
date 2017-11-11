using System;
using System.Web;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.Configuration;

public partial class OnlineSinav : System.Web.UI.Page
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
            Response.Redirect("~/Default.aspx");
        }
        lblResults.Visible = false;
        if (!IsPostBack)
        {
            FillClastList();
        }
    }
    private void FillClastList()
    {
        string selectSQL = "SELECT * FROM courses";

        SqlCommand cmd = new SqlCommand(selectSQL, con);
        SqlDataReader reader;

        try
        {
            con.Open();
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                ListItem newItem = new ListItem();
                newItem.Text = reader["coursename"].ToString();
                newItem.Value = reader["c_id"].ToString();
                ListClass.Items.Add(newItem);
            }
            reader.Close();
        }
        catch (Exception err)
        {
            lblResults.Visible = true;
            lblResults.Text = "Dersler yüklenirken hata. ";
            lblResults.Text += err.Message;
        }
        finally
        {
            con.Close();
        }
    }
    protected void ListClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectSQL;
        selectSQL = "SELECT * FROM subject ";
        selectSQL += "WHERE c_id='" + ListClass.SelectedItem.Value + "'";
        SqlCommand cmd = new SqlCommand(selectSQL, con);
        SqlDataReader reader;
        try
        {
            con.Open();
            reader = cmd.ExecuteReader();
            ListSubject.Items.Clear();
            while (reader.Read())
            {
                ListItem itemSubject = new ListItem();
                itemSubject.Text = reader["subjectname"].ToString();
                itemSubject.Value = reader["s_id"].ToString();
                ListSubject.Items.Add(itemSubject);
            }
            reader.Close();
            if (ListSubject.Items.Count == 0)
            {
                ListSubject.Items.Add("Konu Bulunmamaktadır.");
            }
        }
        catch (Exception err)
        {
            lblResults.Visible = true;
            lblResults.Text = "Ders konuları yüklenirken bir hata oluştu.";
            lblResults.Text += err.Message;
        }
        finally
        {
            con.Close();
        }
    }
    protected void ListSubject_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}