using System;
using System.Collections.Generic;
using System;
using System.Web;
using System.Web.Security;

public partial class Admin_Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Clear();

        HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        HttpContext.Current.Response.Cache.SetNoServerCaching();
        HttpContext.Current.Response.Cache.SetNoStore();
        if (Request.Cookies["cookieAdmin"] != null)
        {
            //Admin çıkış yaptığında cookiye eklediğim bilgileri siliyorum
            Response.Cookies["cookieAdmin"].Expires = DateTime.Now.AddDays(-1);
        }
        Session.Abandon();
        FormsAuthentication.SignOut();


        Response.Redirect("Login.aspx");
    }
}