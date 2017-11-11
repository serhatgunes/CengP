using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Drawing;
using System.Web.Configuration;

public partial class Account_Login : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["cookie"] != null) //çerezimiz var ise
        {
            HttpCookie cookie = Request.Cookies["cookie"]; //ismini verdiğimiz çerezi yakalıyoruz
            Session["username"] = cookie.Values["username"]; //sessiona değeri atıyoruz
            Session["password"] = cookie.Values["password"]; //sessiona değeri atıyoruz
            Response.Redirect("~/Homepage.aspx");
        }
        lblgiris.Visible = false;
    }
    protected void login_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        //Kullanıcı adı kullanıcının onay durumunu ve şifreyi kontrol ediyorum
        cmd.CommandText = "SELECT* FROM members WHERE username = '" + recipientname.Text + "' and password = '" + pass_word.Text + "' and onay=1";
        cmd.ExecuteNonQuery();


        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        SqlDataReader reader;

        reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            mid.Text = reader["mid"].ToString();
        }
        reader.Close();


        da.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
                Session["mid"] = dr["mid"].ToString();//Öğrenci bilgilerini cookiye kaydediyorum
            HttpCookie cerez = new HttpCookie("cookie"); //çerezimize isim verdik
            cerez.Values.Add("mid", mid.Text);
            cerez.Values.Add("username", recipientname.Text); //eposta çerezine değeri atadık
            cerez.Values.Add("password", pass_word.Text); //şifre çerezine değeri atadık
            cerez.Expires = DateTime.Now.AddDays(30); //çerezimizin geçerli olacağı süreyi girdik 30 gün
            Response.Cookies.Add(cerez); //çerezi ekledik

            SqlDataReader dr1 = cmd.ExecuteReader();
            if (dr1.Read())
            {
                Session.Add("mid", dr1["mid"]);
                Session.Add("dlv", dr1["dlv"]);
                // update MEMBERS table for DLV
                dr1.Close();
                cmd.CommandText = "update members set dlv = getdate() where username ='" + recipientname.Text + "'";
                cmd.ExecuteNonQuery();
            }
            Response.Redirect("~/Homepage.aspx");
        }

        else
        {
            lblgiris.Visible = true;
            lblgiris.Text = "Bilgilerin hatalı veya üyeliğini aktif et.";
        }
        con.Close();

        recipientname.Text = "";
        pass_word.Text = "";
    }
}