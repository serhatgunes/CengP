<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Iletisim.aspx.cs" Inherits="Iletisim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <!-- Start Banner -->

    <div class="inner-banner contact">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-lg-9">
                    <div class="content">
                        <h1>İLETİSİM</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- End Banner -->

    <!-- Start Contact Us -->
    <section class="form-wrapper padding-lg">
        <div class="container">
            <form name="contact-form" id="ContactForm">
                <div class="row input-row">
                    <div class="form-group col-md-4">
                        <asp:TextBox ID="txtName" CssClass="form-control" placeholder="Adınız" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ErrorMessage="Lütfen Adınızı Giriniz." Font-Bold="True" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-md-4">
                        <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="E-Mail" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ErrorMessage="Lütfen E-Mail Giriniz." Font-Bold="True" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-md-4">
                        <asp:TextBox ID="txtSubject" CssClass="form-control" placeholder="Konu" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" runat="server" ErrorMessage="Lütfen Konu Giriniz." Font-Bold="True" ControlToValidate="txtSubject"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row input-row">
                    <div class="form-group col-md-12">
                        <asp:TextBox ID="txtMessage" CssClass="form-control" placeholder="Mesajınız" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" runat="server" ErrorMessage="Lütfen Mesajınızı Giriniz." Font-Bold="True" ControlToValidate="txtMessage"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <asp:LinkButton ID="LinkButton4" runat="server" CssClass="btn">
                                      <span class="icon-more-icon"></span> Mesaj Gönder                                  
                        </asp:LinkButton>
                        <br />
                        <asp:Label ID="lblError" runat="server" Text="Label" Font-Bold="True" ForeColor="Red"></asp:Label>
                    </div>
        </div>
        </form>
        </div>
    </section>

    <!-- end Contact Us -->
</asp:Content>

