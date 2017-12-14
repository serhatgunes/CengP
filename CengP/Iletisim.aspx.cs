using System;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Iletisim : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Visible = false;
    }
    protected void SendMessage_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd1 = new SqlCommand("insert into contact(name,email,subject,message,date,durum) values(@name,@email,@subject,@message,getdate(),@durum)", con);

        cmd1.Parameters.AddWithValue("@name", txtName.Text);
        cmd1.Parameters.AddWithValue("@email", txtEmail.Text);
        cmd1.Parameters.AddWithValue("@subject", txtSubject.Text);
        cmd1.Parameters.AddWithValue("@message", txtMessage.Text);
        cmd1.Parameters.AddWithValue("@durum", 0);
        cmd1.ExecuteNonQuery();
        con.Close();
        lblError.Visible = true;
        lblError.ForeColor = System.Drawing.Color.Green;
        lblError.Text = "Mesajınız alınmıştır.İlginiz için Teşekkürler.";
    }
}