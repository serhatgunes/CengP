using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.Configuration;

public partial class Account : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["cookie"];
        if (cookie != null)
        {
            string mid = cookie["mid"];
        }
        else
        {
            Response.Redirect("Account/Logout.aspx");
        }
        lblBilgi.Visible = false;
        Foto();
        lblResults.Visible = false;
        lblError.Visible = false;
        lblPass.Visible = false;
        if (!this.IsPostBack)
        {
            FillStudentInfo();
        }
    }
    protected void Foto()
    {
        HttpCookie cookie = Request.Cookies["cookie"];
        DataTable dt = new DataTable();
        string strQuery = "select mid,FilePath from members WHERE mid='" + cookie["mid"] + "' ";
        SqlCommand cmd = new SqlCommand(strQuery);
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);
        SqlDataAdapter sda = new SqlDataAdapter();
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        try
        {
            con.Open();
            sda.SelectCommand = cmd;
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

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
    protected void PhotoUpload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.PostedFile != null)
        {
            string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);

            //Save files to disk
            FileUpload1.SaveAs(Server.MapPath("ProfilFotograf/" + FileName));
            HttpCookie cookie = Request.Cookies["cookie"];
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);
            string strQuery = "update members Set FileName='" + FileName + "', FilePath='" + "ProfilFotograf/" + FileName + "' WHERE mid='" + cookie["mid"] + "'";
            SqlCommand cmd = new SqlCommand(strQuery);


            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                lblBilgi.Visible = true;
                lblBilgi.ForeColor = System.Drawing.Color.Green;
                lblBilgi.Text = "Profil fotoğrafınız yüklenmiştir.";
            }
            catch (Exception ex)
            {
                lblBilgi.Visible = true;
                lblBilgi.ForeColor = System.Drawing.Color.Red;
                lblBilgi.Text = "Hata : " + ex.Message;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }
        Foto();
    }
    private void FillStudentInfo()
    {
        HttpCookie cookie = Request.Cookies["cookie"];
        string selectSQL = "SELECT * FROM members WHERE mid='" + cookie["mid"] + "'";

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);
        SqlCommand cmd = new SqlCommand(selectSQL, con);
        SqlDataReader reader;

        try
        {
            con.Open();
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                username.Text = reader["username"].ToString();
                fullname.Text = reader["fullname"].ToString();
                email.Text = reader["e_mail"].ToString();
                school.Text = reader["school"].ToString();
            }
            reader.Close();
        }
        catch (Exception err)
        {
            lblError.Visible = true;
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Text = "Bilgileriniz yüklenirken bir hata oluştu.";
            lblError.Text += err.Message;
        }
        finally
        {
            con.Close();
        }
    }
    protected void userinfoUpdate(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
            {
                string updateSQL;
                HttpCookie cookie = Request.Cookies["cookie"];
                updateSQL = "UPDATE members SET  fullname=@fullname,e_mail=@e_mail,school=@school  WHERE mid='" + cookie["mid"] + "'";

                SqlConnection con1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);
                SqlCommand cmd1 = new SqlCommand(updateSQL, con1);

                cmd1.Parameters.AddWithValue("@fullname", fullname.Text);
                cmd1.Parameters.AddWithValue("@e_mail", email.Text);
                cmd1.Parameters.AddWithValue("@school", school.Text);

                int updated = 0;
                try
                {
                    con1.Open();
                    updated = cmd1.ExecuteNonQuery();
                    lblResults.Visible = true;
                    lblResults.ForeColor = System.Drawing.Color.Green;
                    lblResults.Text = updated.ToString() + " kayıt güncellendi.";
                }
                catch (Exception err)
                {
                    lblResults.Visible = true;
                    lblResults.ForeColor = System.Drawing.Color.Red;
                    lblResults.Text = "Hata. ";
                    lblResults.Text += err.Message;
                }
                finally
                {
                    con1.Close();
                }

                if (updated > 0)
                {
                    FillStudentInfo();
                }
            }
        }
    }
    protected void userPassUpdate(object sender, EventArgs e)
    {

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update members set password = @password where mid = @mid and password = @oldpwd", con);
            HttpCookie cookie = Request.Cookies["cookie"];
            cmd.Parameters.Add("@password", SqlDbType.VarChar, 10).Value = newpassword.Text;
            cmd.Parameters.Add("@mid", SqlDbType.Int).Value = Int32.Parse(cookie["mid"].ToString());
            cmd.Parameters.Add("@oldpwd", SqlDbType.VarChar, 10).Value = oldpassword.Text;

            if (cmd.ExecuteNonQuery() > 0)
            {
                lblPass.Visible = true;
                lblPass.ForeColor = System.Drawing.Color.Green;
                lblPass.Text = "Parolanız güncellenmiştir.";
            }
            else
            {
                lblPass.Visible = true;
                lblPass.ForeColor = System.Drawing.Color.Red;
                lblPass.Text = "Parolanız güncellenemedi!";
            }

        }
        catch (Exception ex)
        {
            lblPass.Visible = true;
            lblPass.ForeColor = System.Drawing.Color.Red;
            lblPass.Text = "Hata --> " + ex.Message;
        }
        finally
        {
            con.Close();
        }
    }
}