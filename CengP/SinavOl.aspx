<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.master" AutoEventWireup="true" CodeFile="SinavOl.aspx.cs" Inherits="SinavOl" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            if (Session["questions"] == null)
                Response.Redirect("../Homepage.aspx");
            else
            {
                DisplayQuestion();
            }
    }

    public void DisplayQuestion()
    {
        // get data from session object
        Examination e = (Examination)Session["questions"];
        // display data
        lblSubject.Text = e.sname;
        lblQno1.Text = e.curpos + 1 + "/" + e.SIZE;
        lblCtime.Text = DateTime.Now.ToString();
        lblStime.Text = e.StartTime.ToString();

        Question q = e.questions[e.curpos];
        // display details of question
        question.InnerHtml = q.question;
        ans1.InnerHtml = q.ans1;
        ans2.InnerHtml = q.ans2;
        ans3.InnerHtml = q.ans3;
        ans4.InnerHtml = q.ans4;

        // reset all radio buttons
        rbAns1.Checked = false;
        rbAns2.Checked = false;
        rbAns3.Checked = false;
        rbAns4.Checked = false;

        // disable and enable buttons
        if (e.curpos == 0)
            btnPrev.Enabled = false;
        else
            btnPrev.Enabled = true;

        if (e.curpos == e.SIZE - 1)
            lblNext.Text = "SınavıBitir";
        else
            lblNext.Text = "SonrakiSoru";
    }

    public void ProcessQuestion()
    {
        Examination exam = (Examination)Session["questions"];
        Question q = exam.questions[exam.curpos];
        String answer;
        // find out the answer and assign it to 
        if (rbAns1.Checked)
            answer = "1";
        else
            if (rbAns2.Checked)
            answer = "2";
        else
                if (rbAns3.Checked)
            answer = "3";
        else
                    if (rbAns4.Checked)
            answer = "4";
        else
            answer = "0";  // error
        q.answer = answer;
        exam.questions[exam.curpos] = q;
        Session.Add("questions", exam);
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        ProcessQuestion();
        Examination exam = (Examination)Session["questions"];
        if (exam.curpos == exam.SIZE - 1)
            Response.Redirect("SinavSonuc.aspx");
        else
        {
            exam.curpos++;
            Session.Add("questions", exam);
            DisplayQuestion();
        }
    }

    protected void btnPrev_Click(object sender, EventArgs e)
    {
        // ProcessQuestion();
        Examination exam = (Examination)Session["questions"];
        exam.curpos--;
        Session.Add("questions", exam);
        DisplayQuestion();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        // Examination exam = (Examination)Session["questions"];
        Session.Remove("questions");
        //exam = null;
        Response.Redirect("~/OnlineSinav.aspx");
    }

    protected void btnVazgec_Click(object sender, EventArgs e)
    {
        // Examination exam = (Examination)Session["questions"];
        Session.Remove("questions");
        //exam = null;
        Response.Redirect("~/OnlineSinav.aspx");
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <!-- Start Blog Detail -->
                <div class="row" style="background-color: lavender">
                    <div class="container blog-wrapper ">
                        <div class="row">
                            <!-- Start Left Column -->
                            <div class="col-sm-7 blog-left">
                                <ul class="blog-listing detail">
                                    <li>
                                        <h2><b>Konu :</b>
                                            <asp:Label ID="lblSubject" runat="server" Font-Bold="True" Font-Names="Verdana" ForeColor="Red"></asp:Label><br />
                                        </h2>
                                        <ul class="post-detail">
                                            <li><span class="icon-date-icon ico"></span><span class="bold">Başlangıç : 
                                    <asp:Label ID="lblStime" runat="server" Font-Bold="True" Font-Names="Verdana" ForeColor="Red"></asp:Label><br />
                                            </span></li>
                                            <li><span class="icon-date-icon ico"></span><span class="bold">Şu Ankİ : 
                                                                                <asp:Label ID="lblCtime" runat="server" Font-Bold="True" Font-Names="Verdana" ForeColor="Red"></asp:Label>
                                                <br />
                                            </span></li>
                                            <li><span class="icon-chat-icon ico"></span><span class="bold">Soru : 
                                            <asp:Label ID="lblQno1" runat="server" Font-Bold="True" Font-Names="Verdana" ForeColor="Red"></asp:Label>
                                            </span></li>
                                        </ul>
                                        <div class="imp-quote " style="height: 100%">

                                            <p>
                                                <b>
                                                    <pre runat="server" width="100%" height="100%" align="left" id="question" style="border-style: hidden; border-color: none; background-color: #EEF2F4;">question</pre>
                                                </b>
                                            </p>
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                        </div>
                                        <br />
                                    </li>
                                </ul>
                            </div>
                            <!-- End Left Column -->
                            <!-- Start Right Column -->
                            <div class="col-sm-5 padding-lg">
                                <div class="blog-right">

                                    <h3>cevabınız</h3>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <asp:Label ID="Label1" runat="server" Text="A" ForeColor="Black" Font-Bold="True"></asp:Label>
                                        </div>
                                        <div class="col-md-2">
                                            <asp:Label ID="Label5" runat="server" Text=" - " ForeColor="Black" Font-Bold="True"></asp:Label>

                                        </div>
                                        <div class="col-md-2">
                                            <asp:RadioButton ID="rbAns1" runat="server" GroupName="answer" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">

                                            <pre runat="server" id="ans1" style="border-style: hidden; border-color: #FFFFFF; background-color: #EEF2F4;"></pre>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <asp:Label ID="Label2" runat="server" Text="B" ForeColor="Black" Font-Bold="True"></asp:Label>
                                        </div>
                                        <div class="col-md-2">
                                            <asp:Label ID="Label6" runat="server" Text=" - " ForeColor="Black" Font-Bold="True"></asp:Label>

                                        </div>
                                        <div class="col-md-2">
                                            <asp:RadioButton ID="rbAns2" runat="server" GroupName="answer" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">

                                            <pre runat="server" id="ans2" style="border-style: hidden; border-color: #FFFFFF; background-color: #EEF2F4;"></pre>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <asp:Label ID="Label3" runat="server" Text="C" ForeColor="Black" Font-Bold="True"></asp:Label>
                                        </div>
                                        <div class="col-md-2">
                                            <asp:Label ID="Label7" runat="server" Text=" - " ForeColor="Black" Font-Bold="True"></asp:Label>

                                        </div>
                                        <div class="col-md-2">
                                            <asp:RadioButton ID="rbAns3" runat="server" GroupName="answer" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">

                                            <pre runat="server" id="ans3" style="border-style: hidden; border-color: #FFFFFF; background-color: #EEF2F4;"></pre>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <asp:Label ID="Label4" runat="server" Text="D" ForeColor="Black" Font-Bold="True"></asp:Label>
                                        </div>
                                        <div class="col-md-2">
                                            <asp:Label ID="Label8" runat="server" Text=" - " ForeColor="Black" Font-Bold="True"></asp:Label>

                                        </div>
                                        <div class="col-md-2">
                                            <asp:RadioButton ID="rbAns4" runat="server" GroupName="answer" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">

                                            <pre runat="server" id="ans4" style="border-style: hidden; border-color: #FFFFFF; background-color: #EEF2F4;"></pre>

                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class=" button-group">
                                                <asp:Label ID="lblPrev" runat="server" Text="ÖncekiSoru" ForeColor="#2c97ea" Font-Bold="true"></asp:Label>
                                                <asp:LinkButton ID="btnPrev" CssClass="btn-circle plus" runat="server" OnClick="btnPrev_Click"><i class="fa fa-chevron-circle-left" aria-hidden="true"></i></i></asp:LinkButton>
                                            </div>
                                        </div>
                                        <div class="col-md-4">

                                            <div class=" button-group">
                                                <asp:Label ID="lblNext" runat="server" Text="SonrakiSoru" ForeColor="#17a43b" Font-Bold="true"></asp:Label>
                                                <asp:LinkButton ID="btnNext" CssClass="btn-circle more" runat="server" OnClick="btnNext_Click"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i></asp:LinkButton>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <asp:Label ID="lnlCancel" runat="server" Text="SınavVazgeç" ForeColor="#ff9600" Font-Bold="true"></asp:Label>
                                            <asp:LinkButton ID="btnCancel" CssClass="btn-circle" runat="server" OnClick="btnCancel_Click"><i class="fa fa-times-circle" aria-hidden="true"></i></asp:LinkButton>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Label ID="lblHata" runat="server" Text="Label" Visible="False" Font-Bold="True"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Right Column -->
                        </div>
                    </div>
                </div>
                <!-- End Blog Detail -->
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>

