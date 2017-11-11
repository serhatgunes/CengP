using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Drawing;
using System.Net;
using System.Net.Mail;
using System.Web.Configuration;

public partial class Account_Register : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand comm;
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Visible = false;
    }

    protected void register_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString)) 
            {
                con.Open();
                bool exists = false;
                // eğer kullanıcı adı varsa 
                using (SqlCommand cmd = new SqlCommand("select count(*) from [members] where username = @username", con))
                {
                    cmd.Parameters.AddWithValue("username", username.Text);
                    exists = (int)cmd.ExecuteScalar() > 0;
                }
                if (exists)
                {
                    lblError.Visible = true;
                    lblError.ForeColor = Color.Red;
                    lblError.Text = "Kullanıcı adı seçili.";
                }
                else
                {
                    string UyeKod1, UyeKod2;
                    Random rastgele = new Random();
                    UyeKod1 = System.DateTime.Now.Millisecond.ToString();
                    UyeKod2 = rastgele.Next(1000, 99999999).ToString();
                    //SQL bağlantımı açıyorum.. Bağlantı bilgimi WEB configden alıyorum. 
                    conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);
                    //Veri kaydetmek için SQL komutumu yazıyorum, verim Calisanlar tablosuna kaydedilecek.
                    comm = new SqlCommand("INSERT INTO members (username,fullname,e_mail,password,school,uyekod1,uyekod2,onay,dlv,dv,FileName,FilePath,totalpoint) VALUES (@username,@fullname,@e_mail,@password,@school,@uyekod1,@uyekod2,@onay,null,getdate(),@FileName,@FilePath,@totalpoint)", conn);
                    //Her bir alan için parametremin tipini belirtiyor ve bu parametrenin hangi alandan alınacağını gösteriyorum.
                    comm.Parameters.Add("@username", System.Data.SqlDbType.NVarChar, 50);
                    comm.Parameters["@username"].Value = username.Text;
                    comm.Parameters.Add("@fullname", System.Data.SqlDbType.NVarChar, 50);
                    comm.Parameters["@fullname"].Value = fullname.Text;
                    comm.Parameters.Add("@e_mail", System.Data.SqlDbType.NVarChar, 50);
                    comm.Parameters["@e_mail"].Value = email.Text;
                    comm.Parameters.Add("@password", System.Data.SqlDbType.NVarChar, 50);
                    comm.Parameters["@password"].Value = password.Text;
                    comm.Parameters.Add("@school", System.Data.SqlDbType.NVarChar, 200);
                    comm.Parameters["@school"].Value = school.Text;


                    comm.Parameters.Add("@uyekod1", System.Data.SqlDbType.NVarChar);
                    comm.Parameters["@uyekod1"].Value = UyeKod1;
                    comm.Parameters.Add("@uyekod2", System.Data.SqlDbType.NVarChar);
                    comm.Parameters["@uyekod2"].Value = UyeKod2;
                    comm.Parameters.Add("@onay", System.Data.SqlDbType.NChar, 1);
                    comm.Parameters["@onay"].Value = 0;

                    comm.Parameters.Add("@FileName", System.Data.SqlDbType.NVarChar, 50);
                    comm.Parameters["@FileName"].Value = "user.png";
                    comm.Parameters.Add("@FilePath", System.Data.SqlDbType.NVarChar);
                    comm.Parameters["@FilePath"].Value = "ProfilFotograf/user.png";

                    comm.Parameters.Add("@totalpoint", System.Data.SqlDbType.Int);
                    comm.Parameters["@totalpoint"].Value = 0;

                    try
                    {
                        conn.Open();
                        //Burada ExcuteNonQuery kullanıyorum, çünkü bana geriye herhangi bir veri listesi geri dönmeyecek.
                        comm.ExecuteNonQuery();

                        //Öğrenciye onay maili yolluyorum.
                        SmtpClient mlClient = new SmtpClient();
                        MailMessage mlMessage = new MailMessage();
                        mlMessage.To.Add(email.Text);
                        mlMessage.From = new MailAddress("serhat.gunes.92@gmail.com", "Site Üye onayı");
                        mlMessage.Subject = "Üye Kayıt Onayı";
                        mlMessage.IsBodyHtml = true;
                        mlMessage.Body = "Sayın Kullanıcımız CengP'ye Hoşgeldiniz." + username.Text + "<br/>" + "Kullanıcı İsimli Üyeyi Aktif Hale Getirmek İçin <a href='http://localhost:54640/Account/RegisterComplete.aspx?kd1=" + UyeKod1 + "&kd2=" + UyeKod2 + "'>Tıklayınız.</a>";
                        NetworkCredential guvenlikKarti = new NetworkCredential("serhat.gunes.92", "saliismailagabey1907");
                        mlClient.Credentials = guvenlikKarti;
                        mlClient.Port = 587;
                        mlClient.Host = "smtp.gmail.com";
                        mlClient.EnableSsl = true;
                        mlClient.Send(mlMessage);


                        lblError.Visible = true;
                        lblError.ForeColor = Color.Green;
                        lblError.Text = "Mailinize gelen linke tıklayarak üyeliğinizi aktifleştirin.";

                    }
                    catch
                    {
                        lblError.Visible = true;
                        lblError.ForeColor = Color.Red;
                        lblError.Text = "Bağlantı hatası, kayıt başarısız.";
                    }
                    finally
                    {
                        conn.Close();
                    }

                }
                con.Close();
            }
        }
    }
}