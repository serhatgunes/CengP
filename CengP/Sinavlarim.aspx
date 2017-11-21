<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.master" AutoEventWireup="true" CodeFile="Sinavlarim.aspx.cs" Inherits="Sinavlarim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        body {
            font-family: Arial;
            font-size: 10pt;
        }

        .GridPager a, .GridPager span {
            display: block;
            height: 30px;
            width: 30px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
        }

        .GridPager a {
            background-color: #f5f5f5;
            color: #969696;
            border: 2px solid #969696;
        }

        .GridPager span {
            background-color: #A1DCF2;
            color: #000;
            border: 2px solid #3AC0F2;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Start Banner -->
    <div class="inner-banner blog">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="content">
                        <h1>Sınavlarım</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Banner -->
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <section class="testimonial padding-lg">
                    <div class="container">
                        <div class="wrapper">
                            <div class="col-md-12 col-sm-12"><br /><br />
                                <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1"
                                    PageSize="5" BorderColor="Black" Width="100%" AllowPaging="True" RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000" OnRowDataBound="GridView1_RowDataBound" AutoGenerateColumns="False">
                                    <RowStyle Font-Names="Verdana" Font-Size="10pt" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#000000" />
                                    <Columns>
                                        <asp:BoundField DataField="subjectname" HeaderText="subjectname" SortExpression="subjectname" />
                                        <asp:BoundField DataField="noq" HeaderText="noq" SortExpression="noq" />
                                        <asp:BoundField DataField="nocans" HeaderText="nocans" SortExpression="nocans" />
                                        <asp:BoundField DataField="nwans" HeaderText="nwans" ReadOnly="True" SortExpression="nwans" />
                                        <asp:BoundField DataField="std" HeaderText="std" ReadOnly="True" SortExpression="std" />
                                        <asp:BoundField DataField="nomin" HeaderText="nomin" ReadOnly="True" SortExpression="nomin" />
                                        <asp:BoundField DataField="not" HeaderText="not" SortExpression="not" />
                                        <asp:BoundField DataField="puan" HeaderText="puan" SortExpression="puan" />
                                    </Columns>
                                    <HeaderStyle BackColor="#3AC0F2" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt"
                                        ForeColor="White" />
                                    <PagerStyle HorizontalAlign="Right" CssClass="GridPager" BorderColor="White" />

                                </asp:GridView>
                                <asp:Label ID="lblHata" runat="server" Text="Label" Visible="False" Font-Bold="True"></asp:Label>
                                <br />
                                <div class="block align-left">
                                    <asp:Label ID="lblToplaPuan" runat="server" ForeColor="LightGreen" Font-Bold="True"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CengP %>"
                    SelectCommand="SELECT subjectname, e.noq , nocans, e.noq - nocans nwans, std=convert(varchar(10),stdate,103),&#13;&#10;nomin = datediff(mi,stdate,enddate),e.[not],e.puan   FROM  oe_exams e, subject s&#13;&#10;where  e.sid = s.s_id and   mid = @mid&#13;&#10;order by  stdate desc">
                    <SelectParameters>
                        <asp:SessionParameter Name="mid" SessionField="mid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>



