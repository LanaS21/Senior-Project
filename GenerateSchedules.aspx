<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GenerateSchedules.aspx.cs" Inherits="GenerateSchedules" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Generate Schedule</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- Favicons -->
    <link href="../assets/img/favicon.png" rel="icon" />
    <link href="../assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
        rel="stylesheet" />

    <!-- Vendor CSS Files -->
    <link href="../assets/vendor/animate.css/animate.min.css" rel="stylesheet" />
    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
    <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link href="../assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
    <link href="../assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="../assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />


    <!-- Template Main CSS File -->
    <link href="../assets/css/style.css" rel="stylesheet" />
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" media="screen" />

    <!---->
    <link href="../assets/css/box/style1.css" rel="stylesheet" />


    <style>
        table {
            margin-top: 50px;
            margin-bottom: 150px;
            margin-left: 100px;
            border-spacing: 0;
            align-items: center;
        }

        td {
            width: 150px;
            border: 1px solid black;
            height: 40px;
            text-align: center;
        }

        .row1 {
            background-color: #ffff00;
            text-align: center;
        }

        th {
            height: 30px;
            border: 1px solid black;
        }

        .chekbox1 {
            padding-left: 6px;
            margin-right: 10px;
        }


        .button3 {
            padding: 10px 15px 10px 15px;
            border: 0px solid black;
            background-color: #6C439B;
            color: white;
            border-radius: 5px;
            font: inherit;
            font-size: large;
        }
    </style>

</head>

<body>
    <form id="form1" runat="server">

        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top d-flex align-items-center">
            <div class="container d-flex align-items-center">

                <a href="../AdminHomePage.aspx" class="logo me-auto">
                     <img src="../assets/img/Logo2.png" style="width:160px ; height: 250px"
                        alt="logo" class="img-fluid" /></a>

                <nav id="navbar" class="navbar">
                    <ul>
                        <li><a href="../ScheduleP1.aspx">Schedule</a></li>
                        <li><a href="../Attendance.aspx">Attendance</a></li>
                        <li><a href="../Block.aspx">Blocks</a></li>

                        <li class="dropdown"><a href="#"><span>Profiles</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <li><a href="../StudentProfiles.aspx">Student Profiles</a></li>
                                <li><a href="../StaffProfiles.aspx">Staff Profiles</a></li>
                            </ul>
                        </li>
                        <div >
                            <li class="dropdown">
                                <asp:Image ID="Image1" width="40" Height="40" runat="server" class="getstarted" />
                                <ul>
                                    <li><a href="../ViewMyProfile.aspx">View Profile</a></li>
                                    <li><a href="../Logout.aspx">Logout</a></li>
                                </ul>
                            </li>
                        </div>
                    </ul>
                </nav>
                <!-- .navbar -->
            </div>
        </header>
        <!-- End Header -->

          <!-- ======= Breadcrumbs ======= -->
        <section id="breadcrumbs" class="breadcrumbs">
            <div class="container">

                <div class="d-flex justify-content-between align-items-center">
                    <ol>
                        <li><a href="AdminHomePage.aspx" style="color:#6C439B">Home page</a></li>
                        <li><a href="ScheduleP1.aspx" style="color:#6C439B">Scheduling</a></li>
                        <li>Generate Schedules</li>
                    </ol>
                </div>

            </div>
        </section>
        <!-- End Breadcrumbs -->

        <!-- ======= Schedule Section ======= -->
        <div id="blog" class="blog">
            <div class="container align-items-center" data-aos="fade-up">
                <div class="sidebar justify-content-sm-center">
<br /> <br />
                    <div class="row justify-content-sm-center">
                        <div class="cl-xl-7 col-lg-8 col-md-10">
                            <div class="section-tittle text-center ">

                                <h2>Generate Schedules</h2>
                            </div>
                        </div>
                    </div>
                     
                    <div class="search-form">
                        <div style="text-align: center;">
                            <asp:Label ID="errorLabel" Visible="false" Text="No Block Selected!" ForeColor="Red" runat="server" Font-Bold="true" Font-Size="large"></asp:Label>
                            <br />
                            <br />
                            <label id="blockLabel" style="user-select: none; font-size: large; font-weight: bold;">
                                Choose Block:
                            <asp:DropDownList ID="ddlBlocks" runat="server" Height="26" Width="200" Font-Size="Medium" Style="margin-left: 10px;">
                            </asp:DropDownList>
                            </label>
                            <br />
                            <br />
                            <label id="generateAllSchedulesLabel" style="user-select: none;">
                                <asp:CheckBox ID="generateAllSchedulesCheck" runat="server" Style="margin-right: 10px;"></asp:CheckBox>
                                Generate All Schedules
                            </label>
                            <br />
                            <br />
                            <asp:Button ID="generateScheduleButton" class="button3" runat="server" Text="Generate" OnClick="redirectToSchedule" />

                            <br />
                            <br />
                            <br />
                            <br />
                        </div>
                    </div>
                </div> </div>

            </div>
            <!-- End Schedule Section -->

            <!-- End #main -->

            <!-- ======= Footer ======= -->
            <footer id="footer">
                <div class="container">
                    <div class="copyright">
                        &copy; Copyright <strong><span>Tammakan</span></strong>. All Rights Reserved
                    </div>
                </div>
            </footer>
            <!-- End Footer -->

            <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

            <!-- Vendor JS Files -->
            <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
            <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
            <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
            <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
            <script src="assets/vendor/php-email-form/validate.js"></script>

            <!-- Template Main JS File -->
            <script src="assets/js/main.js"></script>
    </form>
</body>

</html>
