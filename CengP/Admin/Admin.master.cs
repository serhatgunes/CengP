using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;

public partial class Admin_Admin : System.Web.UI.MasterPage
{
    private string connectionString = WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString;

    int countOnaysizYazar = 0;
    int countOnaylıYazar = 0;
    int countOnaysizYorum = 0;
    int countOnaysizDuyuru = 0;
    int countOnaysizKullanici = 0;
    int countOnayliKullanici = 0;
    int countToplamIcerik = 0;
    int countToplamSoru = 0;
    int Toplam = 0;
    int countToplamIletisim = 0;

    int countToplamIcerikJava = 0;
    int countToplamIcerikNET = 0;
    int countToplamIcerikIOS = 0;
    int countToplamIcerikAndroid = 0;

    int countToplamSoruJava = 0;
    int countToplamSoruNET = 0;
    int countToplamSoruIOS = 0;
    int countToplamSoruAndroid = 0;

    int counttoplamKonu = 0;

    int countToplamKonuJava = 0;
    int countToplamKonuNET = 0;
    int countToplamKonuIOS = 0;
    int countToplamKonuAndroid = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["email"] == null)
                Response.Redirect("Login.aspx");
            else
            {
                Response.ClearHeaders();
                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                Response.AddHeader("Pragma", "no-cache");
            }
        }
        HttpCookie cookie = Request.Cookies["cookieAdmin"];
        if (cookie != null)
        {
            string id = cookie["id"];
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
        OnaysızYazarlar();
        OnaylıYazarlar();
        OnaysizYorum();
        OnaysizDuyuru();
        OnaysızKullanıcılar();
        OnaylıKullanıcılar();
        ToplamIcerik();

        ToplamSoru();
        //ToplamIletisim();

        ToplamIcerikJava();
        ToplamIcerikNET();
        ToplamIcerikIOS();
        ToplamIcerikAndroid();



        ToplamSoruJava();
        ToplamSoruNET();
        ToplamSoruIOS();
        ToplamSoruAndroid();



        lblOnaysızYazar.Text = countOnaysizYazar.ToString();
        lblOnayliYazar.Text = countOnaylıYazar.ToString();
        lblOnaysizYorum.Text = countOnaysizYorum.ToString();
        lblOnaysizDuyuru.Text = countOnaysizDuyuru.ToString();
        OnaysizYazar.Text = countOnaysizYazar.ToString();
        lblOnayliKullanici.Text = countOnayliKullanici.ToString();
        lblOnaysizKullanici.Text = countOnaysizKullanici.ToString();
        lblToplamIcerik.Text = countToplamIcerik.ToString();

        lblToplamSoru.Text = countToplamSoru.ToString();
        Toplam = (countToplamIcerik + countToplamSoru);
        lblToplam.Text = Toplam.ToString();
        lblIletisim.Text = countToplamIletisim.ToString();
        Iletisim.Text = countToplamIletisim.ToString();
        Iletisim1.Text = countToplamIletisim.ToString() + " yeni mesajın var.";

        lblToplamIcerikJava.Text = countToplamIcerikJava.ToString();
        lblToplamIcerikNET.Text = countToplamIcerikNET.ToString();
        lblToplamIcerikIOS.Text = countToplamIcerikIOS.ToString();
        lblToplamIcerikAndroid.Text = countToplamIcerikAndroid.ToString();


        lblToplamSoruJava.Text = countToplamSoruJava.ToString();
        lblToplamSoruNET.Text = countToplamSoruNET.ToString();
        lblToplamSoruIOS.Text = countToplamSoruIOS.ToString();
        lblToplamSoruAndroid.Text = countToplamSoruAndroid.ToString();


        Message();
        lblNotificaion1.Text = (countOnaysizYazar + countOnaysizYorum + countOnaysizDuyuru).ToString();
        lblNotificaion.Text = (countOnaysizYazar + countOnaysizYorum + countOnaysizDuyuru).ToString() + " yeni göreviniz var.";

        lblOgrOnay.Text = countOnaysizYazar.ToString() + " onay bekleyen yazar.";
        lblYorum.Text = countOnaysizYorum.ToString() + " onaylanmamış yorum.";
        lblDuyuru.Text = countOnaysizDuyuru.ToString() + " onaylanmamış duyuru.";

        lblOnaylanmamisUye.Text = (countOnaysizKullanici + countOnaysizYazar).ToString() + " onay bekleyen üye.";
        lblOnaylanmamisUye1.Text = (countOnaysizKullanici + countOnaysizYazar).ToString();
        lblOnaysizUyeYazar.Text = countOnaysizYazar.ToString() + " yazar.";
        lblOnaysizUyeKullanici.Text = countOnaysizKullanici.ToString() + " kullanıcı.";

    }
    public int OnaysızYazarlar()
    {
        string stmt = "SELECT COUNT(*) FROM members where onay=0 and totalpoint>=2500";


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
        string stmt = "SELECT COUNT(*) FROM members where onay=1 and totalpoint>=2500";


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
    public int OnaysızKullanıcılar()
    {
        string stmt = "SELECT COUNT(*) FROM members where onay=0 and totalpoint<2500";


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
    public int OnaylıKullanıcılar()
    {
        string stmt = "SELECT COUNT(*) FROM members where onay=1 and totalpoint<2500";


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
    public int OnaysizYorum()
    {
        string stmt = "SELECT COUNT(*) FROM comment where onay=0";


        using (SqlConnection thisConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countOnaysizYorum = (int)cmdCount.ExecuteScalar();
            }
        }
        return countOnaysizYorum;
    }
    public int OnaysizDuyuru()
    {
        string stmt = "SELECT COUNT(*) FROM duyuru where onay=0";


        using (SqlConnection thisConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countOnaysizDuyuru = (int)cmdCount.ExecuteScalar();
            }
        }
        return countOnaysizDuyuru;
    }
    public int ToplamIcerik()
    {
        string stmt = "SELECT COUNT(*) FROM lectureContent";


        using (SqlConnection thisConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countToplamIcerik = (int)cmdCount.ExecuteScalar();
            }
        }
        return countToplamIcerik;
    }

    public int ToplamSoru()
    {
        string stmt = "SELECT COUNT(*) FROM oe_questions";


        using (SqlConnection thisConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countToplamSoru = (int)cmdCount.ExecuteScalar();
            }
        }
        return countToplamSoru;
    }
    //public int ToplamIletisim()
    //{
    //    string stmt = "SELECT COUNT(*) FROM contact WHERE durum=0";


    //    using (SqlConnection thisConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
    //    {
    //        using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
    //        {
    //            thisConnection.Open();
    //            countToplamIletisim = (int)cmdCount.ExecuteScalar();
    //        }
    //    }
    //    return countToplamIletisim;
    //}
    public int ToplamIcerikJava()
    {
        string stmt = "SELECT COUNT(*) FROM subject where c_id=1";


        using (SqlConnection thisConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countToplamIcerikJava = (int)cmdCount.ExecuteScalar();
            }
        }
        return countToplamIcerikJava;
    }
    public int ToplamIcerikNET()
    {
        string stmt = "SELECT COUNT(*) FROM subject where c_id=2";


        using (SqlConnection thisConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countToplamIcerikNET = (int)cmdCount.ExecuteScalar();
            }
        }
        return countToplamIcerikNET;
    }
    public int ToplamIcerikIOS()
    {
        string stmt = "SELECT COUNT(*) FROM subject where c_id=14";


        using (SqlConnection thisConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countToplamIcerikIOS = (int)cmdCount.ExecuteScalar();
            }
        }
        return countToplamIcerikIOS;
    }
    public int ToplamIcerikAndroid()
    {
        string stmt = "SELECT COUNT(*) FROM subject where c_id=13";


        using (SqlConnection thisConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countToplamIcerikAndroid = (int)cmdCount.ExecuteScalar();
            }
        }
        return countToplamIcerikAndroid;
    }

    public int ToplamSoruJava()
    {
        string stmt = "SELECT COUNT(*) FROM oe_questions WHERE sid=1";


        using (SqlConnection thisConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countToplamSoruJava = (int)cmdCount.ExecuteScalar();
            }
        }
        return countToplamSoruJava;
    }
    public int ToplamSoruNET()
    {
        string stmt = "SELECT COUNT(*) FROM oe_questions WHERE sid=2";


        using (SqlConnection thisConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countToplamSoruNET = (int)cmdCount.ExecuteScalar();
            }
        }
        return countToplamSoruNET;
    }
    public int ToplamSoruIOS()
    {
        string stmt = "SELECT COUNT(*) FROM oe_questions WHERE sid=14";


        using (SqlConnection thisConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countToplamSoruIOS = (int)cmdCount.ExecuteScalar();
            }
        }
        return countToplamSoruIOS;
    }
    public int ToplamSoruAndroid()
    {
        string stmt = "SELECT COUNT(*) FROM oe_questions WHERE sid=13";


        using (SqlConnection thisConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
        {
            using (SqlCommand cmdCount = new SqlCommand(stmt, thisConnection))
            {
                thisConnection.Open();
                countToplamSoruAndroid = (int)cmdCount.ExecuteScalar();
            }
        }
        return countToplamSoruAndroid;
    }
    protected void Message()
    {
        DataTable dt = new DataTable();
        string strQuery = "select TOP 5 subject,message,date from contact WHERE durum=0 ORDER BY id DESC";
        SqlCommand cmd = new SqlCommand(strQuery);
        SqlConnection con = new SqlConnection(connectionString);
        SqlDataAdapter sda = new SqlDataAdapter();
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        try
        {
            con.Open();
            sda.SelectCommand = cmd;
            sda.Fill(dt);
            ListView1.DataSource = dt;
            ListView1.DataBind();

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
}
