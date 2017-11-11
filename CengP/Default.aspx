<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Start Banner Carousel -->
    <div class="banner-outer">
        <div class="banner-slider">
            <div class="slide1" style="background-image:url(../images/banner/bannerr1.jpg)">
                <div class="container">
                    <div class="content animated fadeInRight">
                        <div class="fl-right">
                            <h1 class="animated fadeInRight">BİLGİSAYAR MÜHENDİSLERİ <span class="animated fadeInRight">PLATFORMU</span> </h1>
                            <p class="animated fadeInRight"></p>
                            <a href="Hakkinda.aspx" class="btn animated fadeInRight">Daha Fazla <span class="icon-more-icon"></span></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="slide2" style="background-image:url(../images/banner/bannerr2.jpg)">
                <div class="container">
                    <div class="content">
                        <h1 class="animated fadeInUp">YAZILIM DİLLERİ</h1>
                        <p class="animated fadeInUp">Birden fazla yazılım dilleri ve mühendislik alanında kendini geliştirebilirsin.</p>
                        <a href="Hakkinda.aspx" class="btn animated fadeInUp">Daha Fazla <span class="icon-more-icon"></span></a>
                    </div>
                </div>
            </div>
            <div class="slide3" style="background-image:url(../images/banner/bannerr3.jpg)">
                <div class="container">
                    <div class="content animated fadeInRight">
                        <div class="fl-right">
                            <h1 class="animated fadeInRight">Online TESTLER</h1>
                            <p class="animated fadeInRight">Online testler ile bilgi ve becerilerini arttırabilir CengP platformunda yazar olabilirsin.</p>
                            <a href="Hakkinda.aspx" class="btn animated fadeInRight">Daha Fazla <span class="icon-more-icon"></span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Banner Carousel -->
    <!-- Start About Section -->
    <section class="about">
        <div class="container">
            <ul class="row our-links">
                <li class="col-sm-4 apply-online clearfix equal-hight">
                    <div class="icon">
                        <br />
                        <img src="images/apply-online-ico.png" class="img-responsive" alt="">
                    </div>
                    <div class="detail">
                        <br />
                        <h3><span>HEMEN</span>KAYIT OL</h3>
                        <a href="apply-online.html" class="more"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
                    </div>
                </li>
                <li class="col-sm-4 prospects clearfix equal-hight">
                    <div class="icon">
                        <br />
                        <img src="images/prospects-ico.png" class="img-responsive" alt="">
                    </div>
                    <div class="detail">
                        <br />
                        <h3><span>KENDİNİ</span>GELİŞTİR</h3>

                        <a href="#" class="more"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
                    </div>
                </li>
                <li class="col-sm-4 certification clearfix equal-hight">
                    <div class="icon">
                        <br />
                        <img src="images/certification-ico.png" class="img-responsive" alt="">
                    </div>
                    <div class="detail">
                        <br />
                        <h3><span>İÇERİK</span>YAZARI OL</h3>
                        <a href="#" class="more"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
                    </div>
                </li>
            </ul>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-sm-push-5 left-block">
                    <span class="sm-head">BİLGİSAYAR MÜHENDİSLERİ PORTALI</span>
                    <h2>CENGP Online</h2>
                    <p>
                        CengP platformu bilgisayar mühendisliği ve yazılım alanında kendini geliştirmek isteyen tüm mühendisleri bir araya toplamayı hedefleyen online bir platformdur.
                        Bu platformda deneyimli yazarlarımızın içeriklerine ulaşabilir yazarlarımızın hazırladığı içerik ve test sorularıyla kendini geliştirebilirsin, içerikle ilgili yorum yapabilir ,fikirlerini paylaşabilirsin. 
                        Çözdüğün online testler sonucu belli bir puana ulaştığında bu içerikleri paylaşan yazarlarımıza soru sorabilir ve sende içerik yazarı haline gelebilirsin.


                    </p>
                    <div class="know-more-wrapper"><a href="about.html" class="know-more">Kayıt Ol <span class="icon-more-icon"></span></a></div>
                </div>
                <div class="col-sm-5 col-sm-pull-7">
                    <div class="video-block">
                        <div id="thumbnail_container">
                            <img src="images/about-walpaper.png" id="thumbnail" class="img-responsive" alt="" height="350">
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End About Section -->
    <!-- Start Cources Section -->
    <section class="our-cources padding-lg">
        <div class="container">
            <h2><span>MÜHENDİSLİK VEYA YAZILIMLA İLGİLİ</span> Ne Öğrenmek İstİyorsun?</h2>
            <ul class="course-list owl-carousel">
                <li>
                    <div class="inner">
                        <figure>
                            <img src="images/course2.jpg" alt="">
                        </figure>
                        <h3>Android <span>Studio</span></h3>
                        <p>Android Studio, IntelliJ IDEA'ya dayalı olup Android geliştirme için özel ...</p>
                        <div class="bottom-txt clearfix">
                            <div class="duration">
                                <h4></h4>
                                <span></span>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="inner">
                        <figure>
                            <img src="images/course3.png" alt="">
                        </figure>
                        <h3>Java <span>
                            <br />
                        </span></h3>
                        <p>Java (programlama dili), dünyanın en yaygın programlama dillerinden biri...</p>
                        <div class="bottom-txt clearfix">
                            <div class="duration">
                                <h4></h4>
                                <span></span>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="inner">
                        <figure>
                            <img src="images/course4.png" alt="">
                        </figure>
                        <h3>IOS <span>
                            <br />
                        </span></h3>
                        <p>iOS (eski adıyla iPhone/iPad OS) Apple'ın başlangıçta iPhone için geliştirdiği ...</p>
                        <div class="bottom-txt clearfix">
                            <div class="duration">
                                <h4></h4>
                                <span></span>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="inner">
                        <figure>
                            <img src="images/course-img2.jpg" alt="">
                        </figure>
                        <h3>BİLGİSAYAR <span>MÜHENDİSLİĞİ
                        </span></h3>
                        <p>Bilgisayar mühendisliği temel olarak yazılım, programlama ve...</p>
                        <div class="bottom-txt clearfix">
                            <div class="duration">
                                <h4></h4>
                                <span></span>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="inner">
                        <figure>
                            <img src="images/course5.png" alt="">
                        </figure>
                        <h3>.NET <span>
                            <br />
                        </span></h3>
                        <p>.NET Framework, Microsoft tarafından geliştirilen yazılım....</p>
                        <div class="bottom-txt clearfix">
                            <div class="duration">
                                <h4></h4>
                                <span></span>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="inner">
                        <figure>
                            <img src="images/course1.png" alt="">
                        </figure>
                        <h3>Microsoft Sql <span>Server</span><span></span></h3>
                        <p>SQL verileri yönetmek ve tasarlamak için kullanılan bir...</p>
                        <div class="bottom-txt clearfix">
                            <div class="duration">
                                <h4></h4>
                                <span></span>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </section>
    <!-- End Cources Section -->

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

    <!-- Start Why Choose Section -->

    <%--<section class="why-choose padding-lg">
        <div class="container">
            <h2><span>The Numbers Say it All</span>Why Choose Us</h2>
            <ul class="our-strength">
                <li>
                    <div class="icon"><span class="icon-certification-icon"></span></div>
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

    <!-- End Why Choose Section -->

    <!-- Start Testimonial -->

<%--    <section class="testimonial padding-lg">
        <div class="container">
            <div class="wrapper">
                <h2>Alumini Testimonials</h2>
                <ul class="testimonial-slide">
                    <li>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley...<a href="#">Read more</a></p>
                        <span>Thomas, <span>London</span></span> </li>
                    <li>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley...<a href="#">Read more</a></p>
                        <span>Thomas, <span>London</span></span> </li>
                    <li>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley...<a href="#">Read more</a></p>
                        <span>Thomas, <span>London</span></span> </li>
                </ul>
                <div id="bx-pager"><a data-slide-index="0" href="#">
                    <img src="images/testimonial-thumb1.jpg" class="img-circle" alt="" /></a> <a data-slide-index="1" href="#">
                        <img src="images/testimonial-thumb2.jpg" class="img-circle" alt="" /></a> <a data-slide-index="2" href="#">
                            <img src="images/testimonial-thumb3.jpg" class="img-circle" alt="" /></a> </div>
            </div>
        </div>
    </section>--%>

    <!-- End Testimonial -->


</asp:Content>

