using CKFinder;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Yazar_SoruEkle : System.Web.UI.Page
{
    int toplamPuan = 0;
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {



        if (TotalPuan() < 2500)
        {
            con.Open();
            Response.Redirect("Homepage.aspx");

            con.Close();
        }
        else
        {

        }
        lblError.Visible = false;
        lblResults.Visible = false;
        lnkClear.Visible = false;
        lblSec.Visible = true;

        if (!IsPostBack)
        {
            if (Session["mid"] == null)
                Response.Redirect("~/Default.aspx");
            else
            {
                Response.ClearHeaders();
                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                Response.AddHeader("Pragma", "no-cache");
            }
            ListLessons.SelectedValue = null;
            FillLectureList();
        }
        HttpCookie cookie = Request.Cookies["cookie"];
        if (cookie != null)
        {
            string tid = cookie["mid"];
        }
        else
        {
            Response.Redirect("~/Default.aspx");
        }
        FileBrowser f1 = new FileBrowser();
        f1.BasePath = "../ckfinder";
        f1.SetupCKEditor(txtSoruEkle);
    }
    private void FillLectureList()
    {
        ListLessons.Items.Clear();
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
                ListLessons.Items.Add(newItem);
            }
            reader.Close();
        }
        catch (Exception err)
        {
            lblResults.Visible = true;
            lblResults.Text = "Hata. ";
            lblResults.Text += err.Message;
        }
        finally
        {
            con.Close();
        }

    }
    protected void ListLessons_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectSQL;
        selectSQL = "SELECT * FROM subject ";
        selectSQL += "WHERE c_id='" + ListLessons.SelectedItem.Value + "'";
        SqlCommand cmd = new SqlCommand(selectSQL, con);
        SqlDataReader reader;
        try
        {
            con.Open();
            reader = cmd.ExecuteReader();
            ListClass.Items.Clear();
            while (reader.Read())
            {
                ListItem itemSubject = new ListItem();
                itemSubject.Text = reader["subjectname"].ToString();
                itemSubject.Value = reader["s_id"].ToString();
                ListClass.Items.Add(itemSubject);
            }
            reader.Close();
            if (ListClass.Items.Count == 0)
            {
                ListClass.Items.Add("Hata.");
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
        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "Func()", true);
        string selectSQL;
        selectSQL = "SELECT * FROM subject ";
        selectSQL += "WHERE s_id='" + ListClass.SelectedItem.Value + "'";
        SqlCommand cmd = new SqlCommand(selectSQL, con);
        SqlDataReader reader;
        try
        {
            con.Open();
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                ListItem itemSubject = new ListItem();
                itemSubject.Text = reader["subjectname"].ToString();
                itemSubject.Value = reader["s_id"].ToString();
                ListClass.Items.Add(itemSubject);
                lblSubId.Visible = false;
                lblSubId.Text = itemSubject.Value;
                lblChoose.Visible = true;
                lblChoose.Text = ListLessons.SelectedItem.Text + " > " + ListClass.SelectedItem.Text;
            }
            reader.Close();
            ListClass.Items.Clear();
        }
        catch (Exception err)
        {
            lblResults.Visible = true;
            lblResults.Text = "Dersin konuları yüklenirken bir hata oluştu.";
            lblResults.Text += err.Message;
        }
        finally
        {
            con.Close();
        }
    }
    protected void Clear_Click(object sender, EventArgs e)
    {
        lblSubId.Text = null;
    }
    protected void Soruekle_Click(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["cookie"];
        string doğruCevap = string.Empty;
        if (cvpA.Checked)
        {
            doğruCevap = "1";
        }
        else if (cvpB.Checked)
        {
            doğruCevap = "2";
        }
        else if (cvpC.Checked)
        {
            doğruCevap = "3";
        }
        else if (cvpD.Checked)
        {
            doğruCevap = "4";
        }
        if (cvpA.Checked == true || cvpB.Checked == true || cvpC.Checked == true || cvpD.Checked == true)
        {
            if (lblSubId.Text != "")
            {
                con.Open();
                //Öğretmenin Soru eklediği algoritma
                SqlCommand cmd1 = new SqlCommand("insert into oe_questions (question,ans1,ans2,ans3,ans4,cans,sid,t_id) values (@question,@ans1,@ans2,@ans3,@ans4,@cans,@sid,@t_id)", con);

                cmd1.Parameters.AddWithValue("@question", txtSoruEkle.Text);
                cmd1.Parameters.AddWithValue("@ans1", cevapA.Text);
                cmd1.Parameters.AddWithValue("@ans2", cevapB.Text);
                cmd1.Parameters.AddWithValue("@ans3", cevapC.Text);
                cmd1.Parameters.AddWithValue("@ans4", cevapD.Text);
                cmd1.Parameters.AddWithValue("@cans", doğruCevap);
                cmd1.Parameters.AddWithValue("@sid", lblSubId.Text);
                cmd1.Parameters.AddWithValue("@t_id", cookie["mid"]);

                cmd1.ExecuteNonQuery();
                con.Close();
                lblError.Visible = true;
                lblError.ForeColor = System.Drawing.Color.Green;
                lblError.Text = "Soru Eklenmiştir.";
                txtSoruEkle.Text = "";
                cevapA.Text = "";
                cevapB.Text = "";
                cevapC.Text = "";
                cevapD.Text = "";
            }
            else
            {
                lblError.Visible = true;
                lblError.ForeColor = System.Drawing.Color.Red;
                lblError.Text = "Konu Seçin!";
            }
        }
        else
        {
            lblError.Visible = true;
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Text = "Doğru Cevabı Seçin!";
        }

    }
    public int TotalPuan()
    {
        HttpCookie cookie = Request.Cookies["cookie"];
        string stmt = "SELECT totalpoint,mid FROM members where mid='" + cookie["mid"] + "'";
        using (SqlConnection thisConnection = new SqlConnection("Data Source = SERHAT\\SERHAT; Initial Catalog = CengP; Integrated Security = True"))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                toplamPuan = Convert.ToInt32(cmdCount.ExecuteScalar());
            }
        }
        return toplamPuan;
    }
}