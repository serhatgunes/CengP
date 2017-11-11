using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Clear();

        HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        HttpContext.Current.Response.Cache.SetNoServerCaching();
        HttpContext.Current.Response.Cache.SetNoStore();
        if (Request.Cookies["cookie"] != null)
        {
            Response.Cookies["cookie"].Expires = DateTime.Now.AddDays(-1);
        }
        Session.Abandon();
        FormsAuthentication.SignOut();
        Response.Redirect("~/Default.aspx");
    }
}