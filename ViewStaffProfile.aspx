<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewStaffProfile.aspx.cs" Inherits="ViewStaffProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Staff Profile Page</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- Favicons -->
    <link href="../assets/img/managment.png" rel="icon" />
    <link href="../assets/img/managment (1).png" rel="small-icon" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

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
        th {
            color: white;
        }
        .button3 {
        padding: 10px;
        border: 0px solid black;
        background-color: #6C439B;
        color: white;
        border-radius: 5px;
        font: inherit;
        margin: 25px 500px 25px 500px;
    }
    </style>
</head>

<body>
    <div id="cust_popup_vs" class="custom_popup_view_vs hide_popup_vs">
        <span style="font-size: 20px; color: red; display: none;" id="error_popup">No Schedules Found</span>
        <table id="scheduleTable">
            <tr class="row1">
                <th bgcolor="grey"></th>
                <th>8-9</th>
                <th>9-10</th>
                <th>10-11</th>
                <th>11-12</th>
                <th>12-1</th>
                <th>1-2</th>
                <th>2-3</th>
                <th>3-4</th>
                <th>4-5</th>
            </tr>
            <tr>
                <td bgcolor="e5e6e4">Sunday</td>
                <td id="Sunday89"></td>
                <td id="Sunday910"></td>
                <td id="Sunday1011"></td>
                <td id="Sunday1112"></td>
                <td bgcolor="yellow">FREE</td>
                <td id="Sunday12"></td>
                <td id="Sunday23"></td>
                <td id="Sunday34"></td>
                <td id="Sunday45"></td>
            </tr>
            <tr>
                <td bgcolor="e5e6e4">Monday</td>
                <td id="Monday89"></td>
                <td id="Monday910"></td>
                <td id="Monday1011"></td>
                <td id="Monday1112"></td>
                <td bgcolor="yellow">FREE</td>
                <td id="Monday12"></td>
                <td id="Monday23"></td>
                <td id="Monday34"></td>
                <td id="Monday45"></td>
            </tr>

            <tr>
                <td bgcolor="e5e6e4">Tuesday</td>
                <td id="Tuesday89"></td>
                <td id="Tuesday910"></td>
                <td id="Tuesday1011"></td>
                <td id="Tuesday1112"></td>
                <td bgcolor="yellow">FREE</td>
                <td id="Tuesday12"></td>
                <td id="Tuesday23"></td>
                <td id="Tuesday34"></td>
                <td id="Tuesday45"></td>
            </tr>

            <tr>
                <td bgcolor="e5e6e4">Wednesday</td>
                <td id="Wednesday89"></td>
                <td id="Wednesday910"></td>
                <td id="Wednesday1011"></td>
                <td id="Wednesday1112"></td>
                <td bgcolor="yellow">FREE</td>
                <td id="Wednesday12"></td>
                <td id="Wednesday23"></td>
                <td id="Wednesday34"></td>
                <td id="Wednesday45"></td>
            </tr>

            <tr>
                <td bgcolor="e5e6e4">Thursday</td>
                <td id="Thursday89"></td>
                <td id="Thursday910"></td>
                <td id="Thursday1011"></td>
                <td id="Thursday1112"></td>
                <td bgcolor="yellow">FREE</td>
                <td id="Thursday12"></td>
                <td id="Thursday23"></td>
                <td id="Thursday34"></td>
                <td id="Thursday45"></td>
            </tr>
        </table>
        <button class="custom_popup_close cust_button" onclick="togglePopup()">Close</button>
    </div>
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
                               
                                <asp:Image ID="Image2" width="40" Height="40" runat="server" class="getstarted"  />
                                <ul>
                                    <li><a href="ViewMyProfile.aspx">View Profile</a></li>
                                    <li><a href="Logout.aspx">Logout</a></li>
                                </ul>
                            </li>
                        </div>
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
                        <li><a href="AdminHomePage.aspx" style="color: #6C439B">Home page</a></li>
                        <li><a href="Profiles.aspx" style="color: #6C439B">Profiles</a></li>
                        <li><a href="StaffProfiles.aspx" style="color: #6C439B">Staff profiles</a></li>
                        <li>
                            <asp:LinkButton ID="LinkButton1"  runat="server" >
                                <asp:Label ID="LabelEm" runat="server"></asp:Label> Profile</asp:LinkButton></li>
                    </ol>
                </div>

            </div>
        </section>
        <!-- End Breadcrumbs -->

        <main id="main" style="background-color: rgb(244, 248, 249)">
            
            <!-- ======= staff information Section ======= -->
            <div class="categories-area section-padding25">
                <div class="container">

                    <div class="main-body">

                        <!-- /Breadcrumb -->

                        <div class="row gutters-sm">
                            <div class="col-md-5 mb-3">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex flex-column align-items-center text-center">
                                            <%--<img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin" class="rounded-circle" width="150">--%>
                                            <asp:Image ID="Image1" width="200" Height="200" runat="server" class="rounded-circle"  />

                                            <hr>

                                            <div class="col-sm-6">
                                                <h4 class="mb-0">Emplyee id:</h4>
                                            </div>
                                            <asp:Label ID="Label1" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label>
                                            <hr>
                                            <a href="#" class="button3" onclick="togglePopup()">Schedule</a>
                                   
                                        </div>
                                    </div>
                                </div>

                            </div>



                            <div class="col-md-7">
                                <div class="card mb-3">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-sm-8">
                                                <h4 class="mb-0" font-bold="true" font-size="large">Full Name:&nbsp;  <asp:Label ID="Label2" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label></h4>
                                            </div>
                                          
                                        </div>

                                        <hr/>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <h4 class="mb-0">Block:  &nbsp; <asp:Label ID="Label20" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label></h4>
                                            </div>
        
                                        </div>

                                        <hr/>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <h4 class="mb-0">Gender: &nbsp;  <asp:Label ID="Label3" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label></h4>
                                            </div>
                                          
                                        </div>

                                        <hr/>
                                        <div class="row">
                                            <div class="col-sm-8">
                                                <h4 class="mb-0">Phone Number: &nbsp; <asp:Label ID="Label4" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label></h4>
                                            </div>
                                           
                                        </div>

                                        <hr/>
                                        <div class="row">
                                            <div class="col-sm-8">
                                                <h4 class="mb-0">Email: &nbsp;<asp:Label ID="Label5" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label></h4>
                                            </div>
                                            
                                        </div>


                                        <hr/>
                                        <div class="row">
                                            <div class="col-sm-8">
                                                <h4 class="mb-0">Address: &nbsp;   <asp:Label ID="Label6" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label></h4>
                                            </div>
                             
                                        </div>


                                        <hr/>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <h4 class="mb-0">Birth Date:&nbsp;  <asp:Label ID="Label7" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label></h4>
                                            </div>
                                          
                                        </div>

                                        <hr/>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <h4 class="mb-0">Nationality: &nbsp;<asp:Label ID="Label8" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label></h4>
                                            </div>
                                            
                                        </div>

                                        <hr/>
                                        <div class="row">
                                            <div class="col-sm-8">
                                                <h4 class="mb-0">Role:&nbsp; <asp:Label ID="Label9" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label></h4>
                                            </div>
                                           
                                        </div>

                                        <hr/>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <h4 class="mb-0">Date Joined:&nbsp;  <asp:Label ID="Label10" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label></h4>
                                            </div>
                                          
                                        </div>

                                        <hr/>
                                        <div class="row">
                                            <div class="col-sm-8">
                                                <h4 class="mb-0">National ID: &nbsp;<asp:Label ID="Label11" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label></h4>
                                            </div>
                                            
                                        </div>



                                        <hr/>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <h4 class="mb-0">Specialization: &nbsp; <asp:Label ID="Label12" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label></h4>
                                            </div>
                                          
                                        </div>

                                        
                                        <hr/>
                                      
                                        <br />
                                           <div class="row justify-content-center">
                                            <div class="col-sm-10">
                                                <asp:Button ID="Button1" runat="server" Text="Edit" OnClick="Button1_Click" class="button3" />
                                                 <a href="#" onclick="show_popup()" class="button3">Delete</a>
                                            </div>
                                        </div>

                                        <br />
                                        <br />

                                    </div>
                                </div>



                            </div>
                        </div>

                        <style type="text/css">
                            body {
                                margin-top: 20px;
                                color: #1a202c;
                                text-align: left;
                                background-color: #e2e8f0;
                            }

                            .main-body {
                                padding: 15px;
                            }

                            .card {
                                box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
                            }

                            .card {
                                position: relative;
                                display: flex;
                                flex-direction: column;
                                min-width: 0;
                                word-wrap: break-word;
                                background-color: #fff;
                                background-clip: border-box;
                                border: 0 solid rgba(0,0,0,.125);
                                border-radius: .25rem;
                            }

                            .card-body {
                                flex: 1 1 auto;
                                min-height: 1px;
                                padding: 1rem;
                            }

                            .gutters-sm {
                                margin-right: -8px;
                                margin-left: -8px;
                            }

                                .gutters-sm > .col, .gutters-sm > [class*=col-] {
                                    padding-right: 8px;
                                    padding-left: 8px;
                                }

                            .mb-3, .my-3 {
                                margin-bottom: 1rem !important;
                            }

                            .bg-gray-300 {
                                background-color: #e2e8f0;
                            }

                            .h-100 {
                                height: 100% !important;
                            }

                            .shadow-none {
                                box-shadow: none !important;
                            }
                            button {
                                padding: 10px;
                                border: 0px solid black;
                                background-color: #6C439B;
                                color: white;
                                border-radius: 5px;
                                font: inherit;
                                margin: 25px 500px 25px 500px;
                            }
                        </style>

                        <script type="text/javascript">
                            function togglePopup() {
                                document.getElementById("cust_popup_vs").classList.toggle("hide_popup_vs");

                            }
                            function getStaffSchedule() {
                                $.ajax({
                                    method: "POST",
                                    url: "ViewStaffProfile.aspx/get_schedule",
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (response) {
                                        if (response.d == null || response.d == '') {
                                            return;
                                        }
                                        else if (response.d == 'No Schedule') {
                                            document.getElementById("scheduleTable").style.display = "none";
                                            updateError();
                                        }
                                        else {
                                            document.getElementById("scheduleTable").style.display = "table";
                                            var schedule = JSON.parse(response.d);
                                            updateSchedule(schedule);
                                        }
                                    },
                                    failure: function (response) {
                                        console.log(response);
                                    }
                                });
                            }

                            function updateSchedule(schedule) {
                                console.log(schedule);
                                var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday"];
                                var times = ["89", "910", "1011", "1112", "12", "23", "34", "45"];
                                for (var i = 0; i < days.length; i++) {
                                    for (var j = 0; j < times.length; j++) {
                                        var id = days[i] + times[j];
                                        var cell = document.getElementById(id);
                                        cell.innerHTML = schedule[days[i]][j];
                                        cell.style.color = "white";
                                        if (schedule[days[i]][j] == "Admin") {
                                            cell.style.backgroundColor = "Khaki";
                                        }
                                        else {
                                            cell.style.backgroundColor = "DarkSeaGreen";
                                        }
                                    }
                                }
                            }

                            function updateError() {
                                document.getElementById("error_popup").style.display = "block";
                            }

                            $(document).ready(function () {
                                getStaffSchedule();
                            });
                        </script>

                    </div>
                </div>
                <!-- End بلا بلا Section -->
        </main>
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

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center">
            <i class="bi bi-arrow-up-short"></i>
        </a>

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
