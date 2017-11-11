<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Hakkinda.aspx.cs" Inherits="Hakkinda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Start Banner -->

<div class="inner-banner blog">
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <div class="content">
          <h1>Hakkında</h1>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- End Banner --> 

<!-- Start About -->
<section class="about inner padding-lg">
  <div class="container">
    <div class="row">
      <div class="col-md-7 left-block">
        <h2>CengP Online</h2>
          <h5>BİLGİSAYAR MÜHENDİSLERİ PLATFORMU</h5><br />
        <p>CengP platformu bilgisayar mühendisliği ve yazılım alanında kendini geliştirmek isteyen tüm mühendisleri bir araya toplamayı hedefleyen online bir platformdur. Bu platformda deneyimli yazarlarımızın içeriklerine ulaşabilir yazarlarımızın hazırladığı içerik ve test sorularıyla kendini geliştirebilirsin, içerikle ilgili yorum yapabilir ,fikirlerini paylaşabilirsin.  </p>
        <p>Çözdüğün online testler sonucu belli bir puana ulaştığında bu içerikleri paylaşan yazarlarımıza soru sorabilir ve sende içerik yazarı haline gelebilirsin.</p>
      </div>
      <div class="col-md-5 about-right"> <img src="images/about-walpaper.png" class="img-responsive" alt=""> </div>
    </div>
  </div>
</section>
<!-- End About --> 

<!-- Start Why Choose -->

<%--<section class="why-choose grey-bg padding-lg">
  <div class="container">
    <h2><span>The Numbers Say it All</span>Why Choose Us</h2>
    <ul class="our-strength opt2">
      <li>
        <div class="icon"><span class="icon-certification-icon"> </span></div>
        <span class="counter">36</span>
        <div class="title">Certified Courses</div>
      </li>
      <li>
        <div class="icon"><span class="icon-student-icon"></span></div>
        <span class="counter">258,658</span>
        <div class="title">Students Enrolled </div>
      </li>
      <li>
        <div class="icon"><span class="icon-book-icon"></span></div>
        <div class="couter-outer"><span class="counter">95</span><span>%</span></div>
        <div class="title">Passing to Universities</div>
      </li>
      <li>
        <div class="icon"><span class="icon-parents-icon"></span></div>
        <div class="couter-outer"><span class="counter">100</span><span>%</span></div>
        <div class="title">Satisfied Parents</div>
      </li>
    </ul>
  </div>
</section>--%>

<!-- End Why Choose --> 
        <!-- Start Our Importance Section -->

    <section class="our-impotance padding-lg">
        <div class="container">
            <ul class="row">
                <li class="col-sm-4 equal-hight">
                    <div class="inner">
                        <img src="images/study-time-ico.jpg" alt="Malleable Study Time">
                        <h3>YAZILIM DİLLERİ</h3>
                    </div>
                </li>
                <li class="col-sm-4 equal-hight">
                    <div class="inner">
                        <img src="images/placement-ico.jpg" alt="Placement Assistance">
                        <h3>ONLINE TESTLER</h3>
                    </div>
                </li>
                <li class="col-sm-4 equal-hight">
                    <div class="inner">
                        <img src="images/easy-access-ico.jpg" alt="Easy To Access">
                        <h3>MÜHENDİSLİK</h3>
                    </div>
                </li>
                <li class="col-sm-4 equal-hight">
                    <div class="inner">
                        <img src="images/study-go-ico.jpg" alt="Study on the Go">
                        <h3>ÜCRETSİZ ERİSİM</h3>
                    </div>
                </li>
                <li class="col-sm-4 equal-hight">
                    <div class="inner">
                        <img src="images/get-innovative-ico.jpg" alt="Get an Innovative, In-depth Transition">
                        <h3>GELİSMİS YAZI <span>EDİTÖRLERİ</span></h3>
                    </div>
                </li>
                <li class="col-sm-4 equal-hight">
                    <div class="inner">
                        <img src="images/practical-ico.jpg" alt="Practical & Interactive Participation">
                        <h3>PRATİK & İNTERAKTİF <span>KATILIM</span></h3>
                    </div>
                </li>
            </ul>
        </div>
    </section>

    <!-- End Our Importance Section -->
</asp:Content>

