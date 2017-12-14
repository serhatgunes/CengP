using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Login : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);
    string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Visible = false;
        if (Request.Cookies["cookieAdmin"] != null) //çerezimiz var ise
        {
            HttpCookie cookie = Request.Cookies["cookieAdmin"]; //ismini verdiğimiz çerezi yakalıyoruz
            Session["email"] = cookie.Values["email"]; //sessiona değeri atıyoruz
            Session["password"] = cookie.Values["password"]; //sessiona değeri atıyoruz
            Response.Redirect("Anasayfa.aspx");
        }
    }
    protected void Login_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        //Admin bilgilerini kontrol ettiğim sorgu
        cmd.CommandText = "SELECT * FROM admin WHERE email = '" + txtEmail.Text + "' and password = '" + txtPassword.Text + "'";
        cmd.ExecuteNonQuery();


        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        SqlDataReader reader;

        reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            id = reader["id"].ToString();
        }
        reader.Close();


        da.Fill(dt);

        if (dt.Rows.Count > 0)
        {

            foreach (DataRow dr in dt.Rows)
                Session["id"] = dr["id"].ToString();
            //Giriş bilgileri doğruysa cookiye bilgilerini ekliyorum
            HttpCookie cerez = new HttpCookie("cookieAdmin"); //çerezimize isim verdik
            cerez.Values.Add("id", id);
            cerez.Values.Add("email", txtEmail.Text); //eposta çerezine değeri atadık
            cerez.Values.Add("password", txtPassword.Text); //şifre çerezine değeri atadık
            cerez.Expires = DateTime.Now.AddDays(30); //çerezimizin geçerli olacağı süreyi girdik 30 gün
            Response.Cookies.Add(cerez); //çerezi ekledik



            Response.Redirect("Anasayfa.aspx");

        }
        else
        {
            lblError.Visible = true;
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Text = "Email veya şifren hatalı.";
        }


    }
}