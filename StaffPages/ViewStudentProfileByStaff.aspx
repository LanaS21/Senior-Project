<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewStudentProfileByStaff.aspx.cs" Inherits="ViewStudentProfile" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Student Profile Page</title>
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
    <link href="../assets/css/styleAtt.css" rel="stylesheet" />
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" media="screen" />
    <link href="../assets/css/box/style1.css" rel="stylesheet" />



    <style>
        th {
            color: white;
        }

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
        .col55 {
            flex: 0 0 initial;
            width: 66.66666667%;
            text-align: left;
        }
    </style>
</head>

<body>
    <div id="cust_popup" class="custom_popup_view hide_popup">
        <span style="font-size: 20px; color: red; display: none;" id="error_popup">No Schedules Found</span>
        <table id="scheduleTable">
            <tr class="row1">
                <th bgcolor="pink"></th>
                <th id="time1"></th>
                <th id="time2"></th>
                <th id="time3"></th>
                <th id="time4"></th>
            </tr>
            <tr>
                <td bgcolor="yellow">Sunday</td>
                <td id="Sunday89" style="display: none;"></td>
                <td id="Sunday910" style="display: none;"></td>
                <td id="Sunday1011" style="display: none;"></td>
                <td id="Sunday1112" style="display: none;"></td>
                <td id="Sunday12" style="display: none;"></td>
                <td id="Sunday23" style="display: none;"></td>
                <td id="Sunday34" style="display: none;"></td>
                <td id="Sunday45" style="display: none;"></td>
            </tr>
            <tr>
                <td bgcolor="yellow">Monday</td>
                <td id="Monday89" style="display: none;"></td>
                <td id="Monday910" style="display: none;"></td>
                <td id="Monday1011" style="display: none;"></td>
                <td id="Monday1112" style="display: none;"></td>
                <td id="Monday12" style="display: none;"></td>
                <td id="Monday23" style="display: none;"></td>
                <td id="Monday34" style="display: none;"></td>
                <td id="Monday45" style="display: none;"></td>
            </tr>

            <tr>
                <td bgcolor="yellow">Tuesday</td>
                <td id="Tuesday89" style="display: none;"></td>
                <td id="Tuesday910" style="display: none;"></td>
                <td id="Tuesday1011" style="display: none;"></td>
                <td id="Tuesday1112" style="display: none;"></td>
                <td id="Tuesday12" style="display: none;"></td>
                <td id="Tuesday23" style="display: none;"></td>
                <td id="Tuesday34" style="display: none;"></td>
                <td id="Tuesday45" style="display: none;"></td>
            </tr>

            <tr>
                <td bgcolor="yellow">Wednesday</td>
                <td id="Wednesday89" style="display: none;"></td>
                <td id="Wednesday910" style="display: none;"></td>
                <td id="Wednesday1011" style="display: none;"></td>
                <td id="Wednesday1112" style="display: none;"></td>
                <td id="Wednesday12" style="display: none;"></td>
                <td id="Wednesday23" style="display: none;"></td>
                <td id="Wednesday34" style="display: none;"></td>
                <td id="Wednesday45" style="display: none;"></td>
            </tr>

            <tr>
                <td bgcolor="yellow">Thursday</td>
                <td id="Thursday89" style="display: none;"></td>
                <td id="Thursday910" style="display: none;"></td>
                <td id="Thursday1011" style="display: none;"></td>
                <td id="Thursday1112" style="display: none;"></td>
                <td id="Thursday12" style="display: none;"></td>
                <td id="Thursday23" style="display: none;"></td>
                <td id="Thursday34" style="display: none;"></td>
                <td id="Thursday45" style="display: none;"></td>
            </tr>
        </table>
        <button class="custom_popup_close cust_button" onclick="togglePopup()">Close</button>
    </div>
    <form id="form1" runat="server">


      <!-- ======= Header ======= -->
        <header id="header" class="fixed-top d-flex align-items-center">
            <div class="container d-flex align-items-center">

                <a href="StaffHomePage.aspx" class="logo me-auto">
                    <img src="../assets/img/Logo2.png" style="width: 160px; height: 250px"
                        alt="logo" class="img-fluid" /></a>

                <nav id="navbar" class="navbar">
                    <ul>
                        <li><a href="StaffAttendance.aspx">Attendance</a></li>
                        <li><a href="StudentProfilesByStaff.aspx">Student Profiles</a></li>

                        <li class="dropdown">
                            <asp:Image ID="Image2" Width="40" Height="40" runat="server" class="getstarted" />
                            <ul>
                              <li><a href="ViewMyProfileByStaff.aspx">View Profile</a></li>
                                <li><a href="../Logout.aspx">Logout</a></li>
                            </ul>
                        </li>
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
                        <li><a href="StaffAdminHomePage.aspx" style="color: #6C439B">Home page</a></li>
                        <li><a href="StudentProfilesByStaff.aspx" style="color: #6C439B">Student profiles</a></li>
                        <li>
                            <asp:Label ID="LabelSt" runat="server"></asp:Label>
                            Profile</li>
                    </ol>
                </div>

            </div>
        </section>
        <!-- End Breadcrumbs -->

        <main id="main" style="background-color: rgb(244, 248, 249)">

            <!-- ======= Student information Section ======= -->
            <div class="categories-area section-padding25">
                <div class="container">

                    <div class="main-body">
                        <div class="row gutters-sm">

                            <!-- Left section -->
                            <div class="col-md-5 mb-3">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex flex-column align-items-center text-center">
                                      
                                            <asp:Image ID="Image1" Width="200" Height="200" runat="server" class="rounded-circle" />
                                            <hr />

                                            <div class="col-sm-6">
                                                <h4 class="mb-0">Student id:</h4>
                                            </div>
                                            <asp:Label ID="Label1" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label>
                                            <hr />
                                            <a href="#" class="button3" onclick="togglePopup()">Schedule</a>
                                         
                                        </div>
                                    </div>
                                </div>
                                <br />


                                <div class="card">
                                    <div class="card-body">
                                        <div class="idance">
                                            <div class="schedule content-block">
                                                <div class="container">
                                           
                                                    <div class="timetable">

                                                        <!-- Schedule Top Navigation -->
                                                        <nav class="nav nav-tabs" style="background: #5e4183">
                                                            <a class="nav-link" style="color: white">Attendance</a>
                                                        </nav>

                                                        <div class="tab-content">
                                                            <div class="tab-pane show active">
                                                                <div class="row align-content-lg-start">

                                                                    <!-- Schedule Item 1 -->
                                                                    <div class="col-md-6">
                                                                        <div class="timetable-item">

                                                                            <div class="timetable-item-main">
                                                                                <div class="timetable-item-time">Entering the center</div>
                                                                                <asp:Label ID="entring" runat="server" Text="Absent" ForeColor="Red"></asp:Label>

                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <!-- Schedule Item 2 -->
                                                                    <div class="col-md-6">
                                                                        <div class="timetable-item">

                                                                            <div class="timetable-item-main">
                                                                                <div class="timetable-item-time">Class 3</div>
                                                                                <asp:Label ID="c3" runat="server" Text="Absent" ForeColor="Red"></asp:Label>

                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <!-- Schedule Item 3 -->
                                                                    <div class="col-md-6">
                                                                        <div class="timetable-item">

                                                                            <div class="timetable-item-main">
                                                                                <div class="timetable-item-time">Class 1</div>
                                                                                <asp:Label ID="c1" runat="server" Text="Absent" ForeColor="Red"></asp:Label>


                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <!-- Schedule Item 4 -->
                                                                    <div class="col-md-6">
                                                                        <div class="timetable-item">

                                                                            <div class="timetable-item-main">
                                                                                <div class="timetable-item-time">Class 4</div>
                                                                                <asp:Label ID="c4" runat="server" Text="Absent" ForeColor="Red"></asp:Label>


                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <!-- Schedule Item 5 -->
                                                                    <div class="col-md-6">
                                                                        <div class="timetable-item">

                                                                            <div class="timetable-item-main">
                                                                                <div class="timetable-item-time">Class 2</div>
                                                                                <asp:Label ID="c2" runat="server" Text="Absent" ForeColor="Red"></asp:Label>


                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <!-- Schedule Item 6 -->
                                                                    <div class="col-md-6">
                                                                        <div class="timetable-item">

                                                                            <div class="timetable-item-main">
                                                                                <div class="timetable-item-time">Exit from center</div>
                                                                                <asp:Label ID="ex" runat="server" Text="Absent" ForeColor="Red"></asp:Label>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>


                            <div class="col-md-7">
                                <div class="card mb-3">
                                    <div class="card-body">
                                        <div class="idance">
                                            <div class="schedule content-block">
                                                <div class="timetable">
                                                    <nav class="nav nav-tabs" style="background: #5e4183; text-align: center">
                                                        <a class="nav-link" style="color: white; text-align: center">PERSONAL INFORMATION </a>
                                                    </nav>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <br />
                                        <div class="row justify-content-lg-start">
                                            <div class="col55" style="text-align:left">
                                                <h4 class="mb-0">Full Name: 	&nbsp;  <asp:Label ID="Label2" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label></h4>
                                            </div>
                                           

                                        </div>

                                        <hr />
                                        <div class="row">
                                            <div class="col55"  style="text-align:left">
                                                <h4 class="mb-0">	&nbsp; Block: &nbsp;</> <asp:Label ID="Label20" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label></h4>
                                            </div>
                                            
                                        </div>


                                        <hr />
                                        <div class="row">
                                            <div class="col55">
                                                <h4 class="mb-0">&nbsp;   &nbsp;Address:	&nbsp; <asp:Label ID="Label3" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label></h4>
                                            </div>
                                           
                                        </div>

                                        <hr />
                                        <div class="row">
                                            <div class="col55">
                                                <h4 class="mb-0">Parent Phone Number: 	&nbsp;  <asp:Label ID="Label4" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label></h4>
                                            </div>
                                         
                                        </div>

                                        <hr />
                                        <div class="row">
                                            <div class="col55">
                                                <h4 class="mb-0">	&nbsp;   	&nbsp;Additional Parent Phone Number: 	&nbsp;  <asp:Label ID="Label10" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label></h4>
                                            </div>
                                          
                                        </div>

                                        <hr />
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <h4 class="mb-0">Birth Date: 	&nbsp;<asp:Label ID="Label5" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label></h4>
                                            </div>
                                           
                                        </div>

                                        <hr />
                                        <div class="row">
                                            <div class="col-sm-5">
                                                <h4 class="mb-0">Nationality:	&nbsp; <asp:Label ID="Label6" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label></h4>
                                            </div>
                                            
                                        </div>

                                        <hr />
                                        <div class="row">
                                            <div class="col-sm-5">
                                                <h4 class="mb-0">IQ Score: 	&nbsp;<asp:Label ID="Label7" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label></h4>
                                            </div>
                                            
                                        </div>

                                        <hr />
                                        <div class="row">
                                            <div class="col-sm-5">
                                                <h4 class="mb-0">National ID: &nbsp;<asp:Label ID="Label8" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label></h4>
                                            </div>
                                           
                                        </div>

                                        <hr />
                                        <div class="row">
                                            <div class="col-sm-5">
                                                <h4 class="mb-0">Gender:  <asp:Label ID="Label9" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label></h4>
                                            </div>
                                        </div>

                                        <hr />
                                        <div class="row">
                                            <div class="col-sm-5">
                                                <h4 class="mb-0">Allergy: 	&nbsp;                       <br />
                                                    <asp:Label ID="Label11" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label></h4>
                                            </div>
                                         
                                        </div>

                                        <hr />
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <h4 class="mb-0">	&nbsp;    &nbsp;Diagnosis: 	&nbsp;<asp:Label ID="Label12" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label></h4>
                                            </div>
                                            
                                        </div>
<hr />
                                        
                                        <br />
                               
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <asp:Button ID="Button1" runat="server" Text="Edit" OnClick="Button1_Click" class="button3" />
                                            </div>
                                        </div>

                                        <br />
                                        <br />
                                    </div>
                                </div>
                            </div>


                        </div>











                        <script type="text/javascript">
                            function togglePopup() {
                                document.getElementById("cust_popup").classList.toggle("hide_popup");

                            }
                            function getStudentSchedule() {
                                $.ajax({
                                    method: "POST",
                                    url: "ViewStudentProfile.aspx/get_schedule",
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
                                            updateSchedule(response.d);
                                        }
                                    },
                                    failure: function (response) {
                                        console.log(response);
                                    }
                                });
                            }

                            function get_instructor_name(employeeId) {
                                var data = { employeeId: employeeId };
                                var name = "";
                                $.ajax({
                                    async: false,
                                    method: "POST",
                                    url: "ViewStudentProfile.aspx/get_instructor_name",
                                    contentType: "application/json; charset=utf-8",
                                    data: JSON.stringify(data),
                                    dataType: "json",
                                    success: function (response) {
                                        name = response.d;
                                    },
                                    failure: function (response) {
                                        console.log(response);
                                    }
                                });
                                return name;

                            }

                            function updateSchedule(schedule) {
                                var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday"];
                                var times = ["89", "910", "1011", "1112", "12", "23", "34", "45"];
                                var times1 = ["8-9", "9-10", "10-11", "11-12", "12-1", "2-3", "3-4", "4-5"];
                                var subjectsDict = {
                                    "1": "SPED",
                                    "2": "ABA",
                                    "3": "SLP",
                                    "4": "OT",
                                    "5": "PSYCH",
                                }
                                var subjectsColors = {
                                    "1": "red",
                                    "2": "blue",
                                    "3": "green",
                                    "4": "orange",
                                    "5": "purple",
                                }
                                var j = 0;
                                if (schedule[22] == "0") {
                                    j = 0;
                                }
                                else {
                                    j = 4;
                                }
                                for (var i = 0; i < 4; i++) {
                                    var id = "time" + (i + 1).toString();
                                    document.getElementById(id).innerHTML = times1[i + j];
                                    document.getElementById(id).style.display = "table-cell";
                                }
                                for (var i = 0; i < days.length; i++) {
                                    var id = "";
                                    var ins_name = "";
                                    if (schedule[23] == 0) {
                                        ins_name = get_instructor_name(schedule[11]);
                                        id = days[i] + times[j];
                                        document.getElementById(id).innerHTML = subjectsDict["1"] + "<br>" + ins_name + " (" + schedule[11] + ")";
                                        document.getElementById(id).style.backgroundColor = subjectsColors["1"];
                                        document.getElementById(id).style.color = "white";
                                        document.getElementById(id).style.display = "table-cell";
                                        id = days[i] + times[j + 1];
                                        document.getElementById(id).innerHTML = subjectsDict["1"] + "<br>" + ins_name + " (" + schedule[11] + ")";
                                        document.getElementById(id).style.backgroundColor = subjectsColors["1"];
                                        document.getElementById(id).style.color = "white";
                                        document.getElementById(id).style.display = "table-cell";
                                        ins_name = get_instructor_name(schedule[2 * i + 1 + 11]);
                                        id = days[i] + times[j + 2];
                                        document.getElementById(id).innerHTML = subjectsDict[schedule[2 * i + 1]] + "<br>" + ins_name + " (" + schedule[2 * i + 1 + 11] + ")";
                                        document.getElementById(id).style.backgroundColor = subjectsColors[schedule[2 * i + 1]];
                                        document.getElementById(id).style.color = "white";
                                        document.getElementById(id).style.display = "table-cell";
                                        ins_name = get_instructor_name(schedule[2 * i + 2 + 11]);
                                        id = days[i] + times[j + 3];
                                        document.getElementById(id).innerHTML = subjectsDict[schedule[2 * i + 2]] + "<br>" + ins_name + " (" + schedule[2 * i + 2 + 11] + ")";
                                        document.getElementById(id).style.backgroundColor = subjectsColors[schedule[2 * i + 2]];
                                        document.getElementById(id).style.color = "white";
                                        document.getElementById(id).style.display = "table-cell";
                                    }
                                    else {
                                        ins_name = get_instructor_name(schedule[2 * i + 1 + 11]);
                                        id = days[i] + times[j];
                                        document.getElementById(id).innerHTML = subjectsDict[schedule[2 * i + 1]] + "<br>" + ins_name + " (" + schedule[2 * i + 1 + 11] + ")";
                                        document.getElementById(id).style.backgroundColor = subjectsColors[schedule[2 * i + 1]];
                                        document.getElementById(id).style.color = "white";
                                        document.getElementById(id).style.display = "table-cell";
                                        ins_name = get_instructor_name(schedule[2 * i + 2 + 11]);
                                        id = days[i] + times[j + 1];
                                        document.getElementById(id).innerHTML = subjectsDict[schedule[2 * i + 2]] + "<br>" + ins_name + " (" + schedule[2 * i + 2 + 11] + ")";
                                        document.getElementById(id).style.backgroundColor = subjectsColors[schedule[2 * i + 2]];
                                        document.getElementById(id).style.color = "white";
                                        document.getElementById(id).style.display = "table-cell";
                                        ins_name = get_instructor_name(schedule[11]);
                                        id = days[i] + times[j + 2];
                                        document.getElementById(id).innerHTML = subjectsDict["1"] + "<br>" + ins_name + " (" + schedule[11] + ")";
                                        document.getElementById(id).style.backgroundColor = subjectsColors["1"];
                                        document.getElementById(id).style.color = "white";
                                        document.getElementById(id).style.display = "table-cell";
                                        id = days[i] + times[j + 3];
                                        document.getElementById(id).innerHTML = subjectsDict["1"] + "<br>" + ins_name + " (" + schedule[11] + ")";
                                        document.getElementById(id).style.backgroundColor = subjectsColors["1"];
                                        document.getElementById(id).style.color = "white";
                                        document.getElementById(id).style.display = "table-cell";
                                    }
                                }
                            }

                            function updateError() {
                                document.getElementById("error_popup").style.display = "block";
                            }

                            $(document).ready(function () {
                                getStudentSchedule();
                            });

                        </script>

                    </div>
                </div>

            </div>
            </div>
                    </div>
                <!-- End attendance Section -->
        </main>
        <!-- End profile -->


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
