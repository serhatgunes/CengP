using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CevapOku : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"];
        string kdurum = "1";
        string kdurumres = "message/okundu.png";
        SqlCommand com = new SqlCommand("UPDATE mesajCevap SET durum='" + kdurum + "', durumres='" + kdurumres + "' where id=@id", con);
        com.Parameters.Add("@id", System.Data.SqlDbType.Int).Value = id;
        con.Open();
        com.ExecuteNonQuery();
        com.Dispose();
        con.Close();
    }
}