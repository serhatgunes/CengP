using System;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Account_RegisterComplete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string UyeKod1, UyeKod2;
        UyeKod1 = Request.QueryString["kd1"];
        UyeKod2 = Request.QueryString["kd2"];
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("Update members Set onay=1 Where uyekod1=@uyekod1 and uyekod2=@uyekod2", con);
        cmd.Parameters.AddWithValue("uyekod1", UyeKod1);
        cmd.Parameters.AddWithValue("uyekod2", UyeKod2);
        cmd.ExecuteNonQuery();
        con.Close();
        lblOnay.Text = "Üyeliğiniz onaylanmıştır.";
    }
}