using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Drawing;
using System.Web.Configuration;

public partial class Account_ForgotPass : System.Web.UI.Page
{
    public SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        lblforgotpass.Visible = false;
    }
    public string SifreOlustur()
    {
        char[] karakter = "0123456789abcdefghijklmnoprstuvyz".ToCharArray(); //Şifrenin hangi harf ve sayılardan oluşacağını burada belirliyoruz
        string sonuc = "";
        Random rnd = new Random();
        for (int i = 0; i < 6; i++) //Şifremiz şuan 6 karakter içericek.
        {
            sonuc += karakter[rnd.Next(0, karakter.Length - 1)].ToString();
        }
        return sonuc;
    }
    protected void forgotpass_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand sorgu = new SqlCommand("SELECT * FROM members WHERE e_mail='" + txtEmail.Text + "'", con); //Girilen email adresi sistemde kayıtlımı kontrolü.

        SqlDataReader dr = sorgu.ExecuteReader();
        string yenisifre = SifreOlustur();//Yukarda oluşturduğumuz SifreOlusur metodumuzu çağırdık.
        if (dr.Read())//Eger sistemde girilen email varsa
        {
            MailMessage mesaj = new MailMessage();
            mesaj.To.Add(new MailAddress(txtEmail.Text)); //Mailin kime gönderileceği
            mesaj.From = new MailAddress("serhat.gunes.92@gmail.com", "Üyelik Sistemi", System.Text.Encoding.UTF8);//Mailin kimden gönderileceği.
            mesaj.Subject = "Yeni Şifreniz";//Mailin konusu.
            mesaj.Body = "Merhaba " + dr["fullname"].ToString() + " " + "\n" + "\n" + "E-Mail: " + dr["e_mail"].ToString() + "\n" + "Kullanıcı Adı: " + dr["username"].ToString() + "\n" + "Yeni Şifreniz: " + yenisifre + "\n"; //Mail içeriği.
            SmtpClient client = new SmtpClient();
            client.Host = "smtp.gmail.com";//Gmailin kullandığı adres.
            client.Port = 587;
            client.Credentials = new NetworkCredential("serhat.gunes.92@gmail.com", "saliismailagabey1907");
            client.EnableSsl = true;

            try
            {
                lblforgotpass.Visible = true;
                client.Send(mesaj);//Yukarıda oluşturdugumuz maili gönderiyoruz.
                lblforgotpass.ForeColor = Color.Green;
                lblforgotpass.Text = "Parolanız E-mail adresinize gönderildi.";
            }
            catch
            {
                lblforgotpass.Visible = true;
                lblforgotpass.ForeColor = Color.Red;
                lblforgotpass.Text = "Hata.";
            }
        }
        else
        {
            lblforgotpass.Visible = true;
            lblforgotpass.ForeColor = Color.Red;
            lblforgotpass.Text = "Kayıtlı e-mail adresi bulunamadı."; //Kayıtlı bir adres yoksa bilgi labelimize yazdırıyoruz.
        }
        dr.Close();
        //Son olarak üyemizin mailine gönderdiğimiz şifreyi veritabanındada güncellememiz gerekiyor.
        SqlCommand SifreGuncelle = new SqlCommand("UPDATE members SET password='" + yenisifre + "' WHERE e_mail='" + txtEmail.Text + "'", con);
        SifreGuncelle.ExecuteNonQuery();
        con.Close();
        txtEmail.Text = "";
        System.Threading.Thread.Sleep(2000);//İşlemi 2 saniyeliğine askıya alıyoruz.
    }
}