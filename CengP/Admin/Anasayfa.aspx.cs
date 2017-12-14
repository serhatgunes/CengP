using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;
using System.Web.Script.Services;
using System.Web.Services;

public partial class Admin_Anasayfa : System.Web.UI.Page
{
    private string connectionString = WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString;

    int countOnaysizYazar = 0;
    int countOnaylıYazar = 0;

    int countOnaysizKullanici = 0;
    int countOnayliKullanici = 0;

    int countSoru = 0;
    int countCevap = 0;

    int countDuyuru = 0;
    int countYorum = 0;
    int countUpload = 0;


    protected void Page_Load(object sender, EventArgs e)
    {
        OnaysızYazarlar();
        OnaylıYazarlar();
        OnaysızKullanicilar();
        OnaylıKullanicilar();
        ToplamCevap();
        ToplamSoru();
        ToplamDuyuru();
        ToplamYorum();
        ToplamUpload();


        lblOnayliYazar.Text = countOnaylıYazar.ToString();
        OnaysizYazar.Text = countOnaysizYazar.ToString();
        lblOnayliKullanici.Text = countOnayliKullanici.ToString();
        lblOnaysizKullanici.Text = countOnaysizKullanici.ToString();
        lblSoruCevap.Text = (countSoru + countCevap).ToString();
        lblDuyuru.Text = countDuyuru.ToString();
        lblYorum.Text = countYorum.ToString();
        lblUpload.Text = countUpload.ToString();
    }
    public int OnaysızYazarlar()
    {
        string stmt = "SELECT COUNT(*) FROM members where onay=0 and totalpoint >= 2500";


        using (SqlConnection thisConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countOnaysizYazar = (int)cmdCount.ExecuteScalar();
            }
        }
        return countOnaysizYazar;
    }
    public int OnaylıYazarlar()
    {
        string stmt = "SELECT COUNT(*) FROM members where onay=1 and totalpoint >= 2500";


        using (SqlConnection thisConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countOnaylıYazar = (int)cmdCount.ExecuteScalar();
            }
        }
        return countOnaylıYazar;
    }
    public int OnaysızKullanicilar()
    {
        string stmt = "SELECT COUNT(*) FROM members where onay=0 and totalpoint < 2500";


        using (SqlConnection thisConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countOnaysizKullanici = (int)cmdCount.ExecuteScalar();
            }
        }
        return countOnaysizKullanici;
    }
    public int OnaylıKullanicilar()
    {
        string stmt = "SELECT COUNT(*) FROM members where onay=1 and totalpoint < 2500";


        using (SqlConnection thisConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countOnayliKullanici = (int)cmdCount.ExecuteScalar();
            }
        }
        return countOnayliKullanici;
    }
    public int ToplamSoru()
    {
        string stmt = "SELECT COUNT(*) FROM mesajlar";


        using (SqlConnection thisConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countSoru = (int)cmdCount.ExecuteScalar();
            }
        }
        return countSoru;
    }
    public int ToplamCevap()
    {
        string stmt = "SELECT COUNT(*) FROM mesajCevap";


        using (SqlConnection thisConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countCevap = (int)cmdCount.ExecuteScalar();
            }
        }
        return countCevap;
    }
    public int ToplamDuyuru()
    {
        string stmt = "SELECT COUNT(*) FROM duyuru";


        using (SqlConnection thisConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countDuyuru = (int)cmdCount.ExecuteScalar();
            }
        }
        return countDuyuru;
    }
    public int ToplamYorum()
    {
        string stmt = "SELECT COUNT(*) FROM comment";


        using (SqlConnection thisConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countYorum = (int)cmdCount.ExecuteScalar();
            }
        }
        return countYorum;
    }
    public int ToplamUpload()
    {
        string stmt = "SELECT COUNT(*) FROM lectureContent";


        using (SqlConnection thisConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countUpload = (int)cmdCount.ExecuteScalar();
            }
        }
        return countUpload;
    }
}