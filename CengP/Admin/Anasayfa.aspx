<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Anasayfa.aspx.cs" Inherits="Admin_Anasayfa" %>
<%@ Import Namespace="System.Web.Configuration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>Anasayfa
       
                <small>Kontrol Paneli</small>
            </h1>
            <ol class="breadcrumb">
                <li class="active"><a href="Anasayfa.aspx"><i class="fa fa-dashboard"></i>Anasayfa</a></li>
            </ol>
        </section>
        <!-- Main content -->
        <section class="content">
            <%-- Kullanıcı Yazar Sayıları --%>
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-warning box-solid">
                        <div class="box-header with-border">

                            <h3 class="box-title">Onaylı ve Onaysız Üyeler</h3>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                    <i class="fa fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>

                            </div>
                        </div>
                        <div class="box-body">
                            <br />
                            <div class="col-lg-3 col-xs-6">
                                <div class="small-box bg-green">
                                    <div class="inner">
                                        <h3>
                                            <asp:Label ID="lblOnayliKullanici" runat="server"></asp:Label></h3>

                                        <p>Kayıtlı Kullanıcılar</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-person-add"></i>
                                    </div>
                                    <a href="OnayliKullanici.aspx" class="small-box-footer">Daha fazla <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                            <div class="col-lg-3 col-xs-6">
                                <div class="small-box bg-green">
                                    <div class="inner">
                                        <h3>
                                            <asp:Label ID="lblOnayliYazar" runat="server"></asp:Label></h3>

                                        <p>Kayıtlı Yazarlar</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-person-add"></i>
                                    </div>
                                    <a href="OnayliYazarlar.aspx" class="small-box-footer">Daha fazla <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                            <div class="col-lg-3 col-xs-6">
                                <div class="small-box bg-red">
                                    <div class="inner">
                                        <h3>
                                            <asp:Label ID="lblOnaysizKullanici" runat="server"></asp:Label></h3>

                                        <p>Onaysız Kullanıcılar</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-person-add"></i>
                                    </div>
                                    <a href="OnaysizKullanici.aspx" class="small-box-footer">Daha fazla <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                            <div class="col-lg-3 col-xs-6">
                                <div class="small-box bg-red">
                                    <div class="inner">
                                        <h3>
                                            <asp:Label ID="OnaysizYazar" runat="server"></asp:Label></h3>

                                        <p>Onaysız Yazarlar</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-person-add"></i>
                                    </div>
                                    <a href="YazarOnay.aspx" class="small-box-footer">Daha fazla <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                            <br />
                        </div>
                    </div>
                </div>
            </div>
            <%-- Konular --%>
            <%
                int countToplamKonuJava = 0;
                string countKonuJava = "SELECT COUNT(*) FROM subject WHERE c_id=1";


                using (System.Data.SqlClient.SqlConnection thisConnection = new System.Data.SqlClient.SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
                {
                    using (System.Data.SqlClient.SqlCommand cmdCount = new System.Data.SqlClient.SqlCommand(countKonuJava, thisConnection))
                    {
                        thisConnection.Open();
                        countToplamKonuJava = (int)cmdCount.ExecuteScalar();
                    }
                }
            %>
            <%
                int countToplamKonuNET = 0;
                string countKonuNET = "SELECT COUNT(*) FROM subject WHERE c_id=2";


                using (System.Data.SqlClient.SqlConnection thisConnection = new System.Data.SqlClient.SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
                {
                    using (System.Data.SqlClient.SqlCommand cmdCount = new System.Data.SqlClient.SqlCommand(countKonuNET, thisConnection))
                    {
                        thisConnection.Open();
                        countToplamKonuNET = (int)cmdCount.ExecuteScalar();
                    }
                }
            %>
            <%
                int countToplamKonuIOS = 0;
                string countKonuIOS = "SELECT COUNT(*) FROM subject WHERE c_id=13";


                using (System.Data.SqlClient.SqlConnection thisConnection = new System.Data.SqlClient.SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
                {
                    using (System.Data.SqlClient.SqlCommand cmdCount = new System.Data.SqlClient.SqlCommand(countKonuIOS, thisConnection))
                    {
                        thisConnection.Open();
                        countToplamKonuIOS = (int)cmdCount.ExecuteScalar();
                    }
                }
            %>
            <%
                int countToplamKonuAndroid = 0;
                string countKonuAndroid = "SELECT COUNT(*) FROM subject WHERE c_id=14";


                using (System.Data.SqlClient.SqlConnection thisConnection = new System.Data.SqlClient.SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
                {
                    using (System.Data.SqlClient.SqlCommand cmdCount = new System.Data.SqlClient.SqlCommand(countKonuAndroid, thisConnection))
                    {
                        thisConnection.Open();
                        countToplamKonuAndroid = (int)cmdCount.ExecuteScalar();
                    }
                }
            %>


            <%-- Sorular --%>
            <%
                int countToplamSoruMat = 0;
                string countMatSoru = "SELECT COUNT(*) FROM oe_questions WHERE sid=1";


                using (System.Data.SqlClient.SqlConnection thisConnection = new System.Data.SqlClient.SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
                {
                    using (System.Data.SqlClient.SqlCommand cmdCount = new System.Data.SqlClient.SqlCommand(countMatSoru, thisConnection))
                    {
                        thisConnection.Open();
                        countToplamSoruMat = (int)cmdCount.ExecuteScalar();
                    }
                }
            %>
            <%
                int countToplamSoruTur = 0;
                string countTurSoru = "SELECT COUNT(*) FROM oe_questions WHERE sid BETWEEN 46 AND 153";


                using (System.Data.SqlClient.SqlConnection thisConnection = new System.Data.SqlClient.SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
                {
                    using (System.Data.SqlClient.SqlCommand cmdCount = new System.Data.SqlClient.SqlCommand(countTurSoru, thisConnection))
                    {
                        thisConnection.Open();
                        countToplamSoruTur = (int)cmdCount.ExecuteScalar();
                    }
                }
            %>
            <%
                int countToplamSoruSos = 0;
                string countSosSoru = "SELECT COUNT(*) FROM oe_questions WHERE sid BETWEEN 154 AND 182";


                using (System.Data.SqlClient.SqlConnection thisConnection = new System.Data.SqlClient.SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
                {
                    using (System.Data.SqlClient.SqlCommand cmdCount = new System.Data.SqlClient.SqlCommand(countSosSoru, thisConnection))
                    {
                        thisConnection.Open();
                        countToplamSoruSos = (int)cmdCount.ExecuteScalar();
                    }
                }
            %>
            <%
                int countToplamSoruFen = 0;
                string countFenSoru = "SELECT COUNT(*) FROM oe_questions WHERE sid BETWEEN 183 AND 212";


                using (System.Data.SqlClient.SqlConnection thisConnection = new System.Data.SqlClient.SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
                {
                    using (System.Data.SqlClient.SqlCommand cmdCount = new System.Data.SqlClient.SqlCommand(countFenSoru, thisConnection))
                    {
                        thisConnection.Open();
                        countToplamSoruFen = (int)cmdCount.ExecuteScalar();
                    }
                }
            %>
            <%
                int countToplamSoruIng = 0;
                string countIngSoru = "SELECT COUNT(*) FROM oe_questions WHERE sid BETWEEN 213 AND 258";


                using (System.Data.SqlClient.SqlConnection thisConnection = new System.Data.SqlClient.SqlConnection(WebConfigurationManager.ConnectionStrings["CengP"].ConnectionString))
                {
                    using (System.Data.SqlClient.SqlCommand cmdCount = new System.Data.SqlClient.SqlCommand(countIngSoru, thisConnection))
                    {
                        thisConnection.Open();
                        countToplamSoruIng = (int)cmdCount.ExecuteScalar();
                    }
                }
            %>
            <%-- Konu Yüzdeliği --%>
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-warning box-solid">
                        <div class="box-header with-border">

                            <h3 class="box-title">Konu Yüzdelikleri</h3>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                    <i class="fa fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            <br />
                            <div class="col-md-12">
                                <div class="box-body">
                                    <div class="box-body text-center">
                                        <div class="sparkline" data-type="pie" data-offset="90" data-width="200px" data-height="200px">
                                            <%=countToplamKonuJava%>,<%=countToplamKonuNET%>,<%=countToplamKonuIOS%>,<%=countToplamKonuAndroid%>
                                        </div>
                                        <br />
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="box-body">
                                        <div class="box-body text-center">
                                            <img src="img/BlueUntitled.png" /><span><b>Java : <%=countToplamKonuJava%></b></span>&nbsp;&nbsp;&nbsp;
                                <img src="img/Red.png" /><span><b>.NET : <%=countToplamKonuNET%></b></span>&nbsp;&nbsp;&nbsp;
                                <img src="img/orange.png" /><span><b>IOS : <%=countToplamKonuIOS%></b></span>&nbsp;&nbsp;&nbsp;
                                <img src="img/darkgreen.png" /><span><b>Android : <%=countToplamKonuAndroid%></b></span>&nbsp;&nbsp;&nbsp;
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%-- Soru Yüzdeliği --%>
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-warning box-solid">
                        <div class="box-header with-border">

                            <h3 class="box-title">Soru Yüzdelikleri</h3>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                    <i class="fa fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            <br />
                            <div class="col-md-12">
                                <div class="box-body">
                                    <div class="box-body text-center">
                                        <div class="sparkline" data-type="pie" data-offset="90" data-width="200px" data-height="200px">

                                            <%=countToplamSoruMat%>,<%=countToplamSoruTur%>,<%=countToplamSoruSos%>,<%=countToplamSoruFen%>,<%=countToplamSoruIng%>
                                        </div>
                                        <br />
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="box-body">
                                        <div class="box-body text-center">
                                            <img src="img/BlueUntitled.png" /><span><b>Java</b></span>&nbsp;&nbsp;&nbsp;
                                <img src="img/Red.png" /><span><b>.NET</b></span>&nbsp;&nbsp;&nbsp;
                                <img src="img/orange.png" /><span><b>IOS</b></span>&nbsp;&nbsp;&nbsp;
                                <img src="img/darkgreen.png" /><span><b>Android</b></span>&nbsp;&nbsp;&nbsp;
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%-- Toplam Duyuru Yorum Upload --%>
            <div class="row">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box bg-red">
                        <span class="info-box-icon"><i class="fa fa-comments-o"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">Soru - Cevap</span>
                            <span class="info-box-number">
                                <asp:Label ID="lblSoruCevap" runat="server" Text="Label"></asp:Label></span>
                        </div>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box bg-aqua">
                        <span class="info-box-icon"><i class="ion ion-ios-pricetag-outline"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">Duyurular</span>
                            <span class="info-box-number">
                                <asp:Label ID="lblDuyuru" runat="server" Text="Label"></asp:Label></span>

                        </div>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box bg-green">
                        <span class="info-box-icon"><i class="ion-ios-chatbubble-outline"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">Yorumlar</span>
                            <span class="info-box-number">
                                <asp:Label ID="lblYorum" runat="server" Text="Label"></asp:Label></span>


                        </div>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box bg-yellow">
                        <span class="info-box-icon"><i class="fa fa-files-o"></i></span>

                        <div class="info-box-content">
                            <span class="info-box-text">Uploads</span>
                            <span class="info-box-number">
                                <asp:Label ID="lblUpload" runat="server" Text="Label"></asp:Label></span>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <!-- jQuery 2.2.3 -->
    <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
    <!-- Bootstrap 3.3.6 -->

    <script>
        $(function () {
            /* jQueryKnob */

            $(".knob").knob({
                /*change : function (value) {
                 //console.log("change : " + value);
                 },
                 release : function (value) {
                 console.log("release : " + value);
                 },
                 cancel : function () {
                 console.log("cancel : " + this.value);
                 },*/
                draw: function () {

                    // "tron" case
                    if (this.$.data('skin') == 'tron') {

                        var a = this.angle(this.cv)  // Angle
                            , sa = this.startAngle          // Previous start angle
                            , sat = this.startAngle         // Start angle
                            , ea                            // Previous end angle
                            , eat = sat + a                 // End angle
                            , r = true;

                        this.g.lineWidth = this.lineWidth;

                        this.o.cursor
                        && (sat = eat - 0.3)
                        && (eat = eat + 0.3);

                        if (this.o.displayPrevious) {
                            ea = this.startAngle + this.angle(this.value);
                            this.o.cursor
                            && (sa = ea - 0.3)
                            && (ea = ea + 0.3);
                            this.g.beginPath();
                            this.g.strokeStyle = this.previousColor;
                            this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, sa, ea, false);
                            this.g.stroke();
                        }

                        this.g.beginPath();
                        this.g.strokeStyle = r ? this.o.fgColor : this.fgColor;
                        this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, sat, eat, false);
                        this.g.stroke();

                        this.g.lineWidth = 2;
                        this.g.beginPath();
                        this.g.strokeStyle = this.o.fgColor;
                        this.g.arc(this.xy, this.xy, this.radius - this.lineWidth + 1 + this.lineWidth * 2 / 3, 0, 2 * Math.PI, false);
                        this.g.stroke();

                        return false;
                    }
                }
            });
            /* END JQUERY KNOB */

            //INITIALIZE SPARKLINE CHARTS
            $(".sparkline").each(function () {
                var $this = $(this);
                $this.sparkline('html', $this.data());
            });

            /* SPARKLINE DOCUMENTATION EXAMPLES http://omnipotent.net/jquery.sparkline/#s-about */
            drawDocSparklines();
            drawMouseSpeedDemo();

        });
        function drawDocSparklines() {

            // Bar + line composite charts
            $('#compositebar').sparkline('html', { type: 'bar', barColor: '#aaf' });
            $('#compositebar').sparkline([4, 1, 5, 7, 9, 9, 8, 7, 6, 6, 4, 7, 8, 4, 3, 2, 2, 5, 6, 7],
                { composite: true, fillColor: false, lineColor: 'red' });


            // Line charts taking their values from the tag
            $('.sparkline-1').sparkline();

            // Larger line charts for the docs
            $('.largeline').sparkline('html',
                { type: 'line', height: '2.5em', width: '4em' });

            // Customized line chart
            $('#linecustom').sparkline('html',
                {
                    height: '1.5em', width: '8em', lineColor: '#f00', fillColor: '#ffa',
                    minSpotColor: false, maxSpotColor: false, spotColor: '#77f', spotRadius: 3
                });

            // Bar charts using inline values
            $('.sparkbar').sparkline('html', { type: 'bar' });

            $('.barformat').sparkline([1, 3, 5, 3, 8], {
                type: 'bar',
                tooltipFormat: '{{value:levels}} - {{value}}',
                tooltipValueLookups: {
                    levels: $.range_map({ ':2': 'Low', '3:6': 'Medium', '7:': 'High' })
                }
            });

            // Tri-state charts using inline values
            $('.sparktristate').sparkline('html', { type: 'tristate' });
            $('.sparktristatecols').sparkline('html',
                { type: 'tristate', colorMap: { '-2': '#fa7', '2': '#44f' } });

            // Composite line charts, the second using values supplied via javascript
            $('#compositeline').sparkline('html', { fillColor: false, changeRangeMin: 0, chartRangeMax: 10 });
            $('#compositeline').sparkline([4, 1, 5, 7, 9, 9, 8, 7, 6, 6, 4, 7, 8, 4, 3, 2, 2, 5, 6, 7],
                { composite: true, fillColor: false, lineColor: 'red', changeRangeMin: 0, chartRangeMax: 10 });

            // Line charts with normal range marker
            $('#normalline').sparkline('html',
                { fillColor: false, normalRangeMin: -1, normalRangeMax: 8 });
            $('#normalExample').sparkline('html',
                { fillColor: false, normalRangeMin: 80, normalRangeMax: 95, normalRangeColor: '#4f4' });

            // Discrete charts
            $('.discrete1').sparkline('html',
                { type: 'discrete', lineColor: 'blue', xwidth: 18 });
            $('#discrete2').sparkline('html',
                { type: 'discrete', lineColor: 'blue', thresholdColor: 'red', thresholdValue: 4 });

            // Bullet charts
            $('.sparkbullet').sparkline('html', { type: 'bullet' });

            // Pie charts
            $('.sparkpie').sparkline('html', { type: 'pie', height: '1.0em' });

            // Box plots
            $('.sparkboxplot').sparkline('html', { type: 'box' });
            $('.sparkboxplotraw').sparkline([1, 3, 5, 8, 10, 15, 18],
                { type: 'box', raw: true, showOutliers: true, target: 6 });

            // Box plot with specific field order
            $('.boxfieldorder').sparkline('html', {
                type: 'box',
                tooltipFormatFieldlist: ['med', 'lq', 'uq'],
                tooltipFormatFieldlistKey: 'field'
            });

            // click event demo sparkline
            $('.clickdemo').sparkline();
            $('.clickdemo').bind('sparklineClick', function (ev) {
                var sparkline = ev.sparklines[0],
                    region = sparkline.getCurrentRegionFields();
                value = region.y;
                alert("Clicked on x=" + region.x + " y=" + region.y);
            });

            // mouseover event demo sparkline
            $('.mouseoverdemo').sparkline();
            $('.mouseoverdemo').bind('sparklineRegionChange', function (ev) {
                var sparkline = ev.sparklines[0],
                    region = sparkline.getCurrentRegionFields();
                value = region.y;
                $('.mouseoverregion').text("x=" + region.x + " y=" + region.y);
            }).bind('mouseleave', function () {
                $('.mouseoverregion').text('');
            });
        }

        /**
         ** Draw the little mouse speed animated graph
         ** This just attaches a handler to the mousemove event to see
         ** (roughly) how far the mouse has moved
         ** and then updates the display a couple of times a second via
         ** setTimeout()
         **/
        function drawMouseSpeedDemo() {
            var mrefreshinterval = 500; // update display every 500ms
            var lastmousex = -1;
            var lastmousey = -1;
            var lastmousetime;
            var mousetravel = 0;
            var mpoints = [];
            var mpoints_max = 30;
            $('html').mousemove(function (e) {
                var mousex = e.pageX;
                var mousey = e.pageY;
                if (lastmousex > -1) {
                    mousetravel += Math.max(Math.abs(mousex - lastmousex), Math.abs(mousey - lastmousey));
                }
                lastmousex = mousex;
                lastmousey = mousey;
            });
            var mdraw = function () {
                var md = new Date();
                var timenow = md.getTime();
                if (lastmousetime && lastmousetime != timenow) {
                    var pps = Math.round(mousetravel / (timenow - lastmousetime) * 1000);
                    mpoints.push(pps);
                    if (mpoints.length > mpoints_max)
                        mpoints.splice(0, 1);
                    mousetravel = 0;
                    $('#mousespeed').sparkline(mpoints, { width: mpoints.length * 2, tooltipSuffix: ' pixels per second' });
                }
                lastmousetime = timenow;
                setTimeout(mdraw, mrefreshinterval);
            };
            // We could use setInterval instead, but I prefer to do it this way
            setTimeout(mdraw, mrefreshinterval);
        }
    </script>
</asp:Content>

