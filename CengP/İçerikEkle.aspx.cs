using CKFinder;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class İçerikEkle : System.Web.UI.Page
{
    private string connectionString = WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString;
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);
    int toplamPuan = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["cookie"];


        if (TotalPuan() < 2500)
        {
            con.Open();
            Response.Redirect("Homepage.aspx");

            con.Close();
        }
        else
        {

        }


        lblResults.Visible = false;

        lnkClear.Visible = false;
        lnkEkle.Visible = false;
        lnkGuncelle.Visible = false;
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
        lblSubId.Text = "";
        txtIcerikEkle.Text = "";
        txtIcerikEkle.Visible = false;
        Button1.Visible = false;
        Button2.Visible = false;
        lblError.Visible = false;
        lblİcerik.Text = "";
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
                lblSubId.Text = itemSubject.Value;
                lblSubId.Visible = false;
                lblChoose.Visible = true;
                lblChoose.Text = ListLessons.SelectedItem.Text + " > " + ListClass.SelectedItem.Text;
                lnkClear.Visible = true;
                lnkEkle.Visible = true;
                lnkGuncelle.Visible = true;
                ListClass.Items.Clear();
                ListClass.Items.Clear();
                lblSec.Visible = false;
                ListLessons.SelectedValue = null;
                Label1.Visible = true;
                lblİcerik.Text = "";
            }
            reader.Close();
        }
        catch (Exception err)
        {
            lblResults.Visible = true;
            lblResults.Text = "Dersin alt konuları yüklenirken bir hata oluştu.";
            lblResults.Text += err.Message;
        }
        finally
        {
            con.Close();
        }
        HttpCookie subTopic = new HttpCookie("subTopic");
        subTopic["subtopic_ID"] = lblSubId.Text;
        subTopic.Expires = DateTime.Now.AddDays(1); // cookiesimiz 2 gün kalsın dedik.
        Response.Cookies.Add(subTopic);
        İcerik();
        if (lblİcerik.Text != "")
        {
            lnkEkle.Visible = false;
            Label3.Visible = true;
        }
        else
        {
            lnkGuncelle.Visible = false;
            Label3.Visible = false;
        }
    }
    protected void Clear_Click(object sender, EventArgs e)
    {
        //Response.Cookies["Adı"].Expires = DateTime.Now.AddMinutes(-2);//Cookie’yi expire edip siliyoruz.
        HttpCookie myCookie = Request.Cookies["subTopic"]; // cookiesimizi okuduk
        myCookie.Expires = DateTime.Now.AddMinutes(-2);
        Response.Cookies.Add(myCookie); // cookies ekledik
        Response.Redirect("İçerikekle.aspx");  //Silme işleminden sonra ana sayfaya yönlendiriyoruz.
    }
    protected void Add_Click(object sender, EventArgs e)
    {
        Button1.Visible = true;
        txtIcerikEkle.Visible = true;
    }
    protected void Guncelle_Click(object sender, EventArgs e)
    {
        txtIcerikEkle.Visible = true;
        txtIcerikEkle.Text = Server.HtmlDecode(lblİcerik.Text);
        Button2.Visible = true;
    }
    protected void AddContent_Click(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["cookie"];
        if (lblSubId.Text != "")
        {
            if (txtIcerikEkle.Text != "")
            {
                con.Open();
                //Öğretmenin ders konu alt konu seçtikten sonra içeriği eklediği kod
                SqlCommand cmd1 = new SqlCommand("insert into lectureContent (s_id,t_id,content,date) values (@s_id,@t_id,@content,@date)", con);

                cmd1.Parameters.AddWithValue("@s_id", lblSubId.Text);
                cmd1.Parameters.AddWithValue("@t_id", cookie["mid"]);
                cmd1.Parameters.AddWithValue("@content", txtIcerikEkle.Text);
                cmd1.Parameters.AddWithValue("@date", String.Format("{0:MM/dd/yyyy}", DateTime.Now));

                cmd1.ExecuteNonQuery();
                con.Close();
                lblError.Visible = true;
                lblError.ForeColor = System.Drawing.Color.Green;
                lblError.Text = "İçerikler Eklenmiştir.";
            }
            else
            {
                lblError.Visible = true;
                lblError.ForeColor = System.Drawing.Color.Red;
                lblError.Text = "İçerik Girin!";
            }
        }
        else
        {
            lblError.Visible = true;
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Text = "Konu Seçin!";
        }
    }
    protected void UpdateContent_Click(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["cookie"];
        if (lblSubId.Text != "")
        {
            if (txtIcerikEkle.Text != "")
            {
                con.Open();
                //Daha önceden eklenen içerik varsa güncellediğimiz kod 
                SqlCommand cmd1 = new SqlCommand("UPDATE lectureContent set content='" + txtIcerikEkle.Text + "',date=getdate() WHERE s_id='" + lblSubId.Text + "'", con);

                cmd1.Parameters.AddWithValue("@sid", lblSubId.Text);
                cmd1.Parameters.AddWithValue("@t_id", cookie["mid"]);
                cmd1.Parameters.AddWithValue("@content", txtIcerikEkle.Text);

                cmd1.ExecuteNonQuery();
                con.Close();
                lblError.Visible = true;
                lblError.ForeColor = System.Drawing.Color.Green;
                lblError.Text = "İçerikler Eklenmiştir.";
            }
            else
            {
                lblError.Visible = true;
                lblError.ForeColor = System.Drawing.Color.Red;
                lblError.Text = "İçerik Girin!";
            }
        }
        else
        {
            lblError.Visible = true;
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Text = "Konu Seçin!";
        }
    }
    protected void İcerik()
    {
        DataTable dt = new DataTable();
        string strQuery = "SELECT * FROM lectureContent WHERE s_id='" + lblSubId.Text + "'";

        SqlCommand cmd = new SqlCommand(strQuery);
        SqlConnection con = new SqlConnection(connectionString);
        SqlDataAdapter sda = new SqlDataAdapter();
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        SqlDataReader reader;
        try
        {
            con.Open();
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                lblİcerik.Text = "";
                lblİcerik.Text = Server.HtmlDecode(reader["content"].ToString());
            }
            reader.Close();
            sda.SelectCommand = cmd;
            sda.Fill(dt);

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
    public int TotalPuan()
    {
        HttpCookie cookie = Request.Cookies["cookie"];
        string stmt = "SELECT totalpoint,mid FROM members where mid='" + cookie["mid"] + "'";
        using (SqlConnection thisConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
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