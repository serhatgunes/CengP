using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["cookie"] != null) //çerezimiz var ise
        {
            HttpCookie kayitlicerez = Request.Cookies["cookie"]; //ismini verdiğimiz çerezi yakalıyoruz
            Session["username"] = kayitlicerez.Values["username"]; //sessiona değeri atıyoruz
            Session["password"] = kayitlicerez.Values["password"]; //sessiona değeri atıyoruz
            Response.Redirect("Homepage.aspx");
        }
    }
}