<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GenerateSchedulesMain.aspx.cs" Inherits="GenerateSchedulesMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Generate Schedule Main</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- Favicons -->
    <link href="../assets/img/favicon.png" rel="icon" />
    <link href="../assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

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
</head>
<body>
    <form id="form1" runat="server">

        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top d-flex align-items-center">
            <div class="container d-flex align-items-center">

                <a href="AdminHomePage.aspx" class="logo me-auto">
                    <img src="../assets/img/Logo2.png" style="width: 160px; height: 250px"
                        alt="logo" class="img-fluid" /></a>

                <nav id="navbar" class="navbar">
                    <ul>
                        <li><a href="ScheduleP1.aspx">Schedule</a></li>
                        <li><a href="Attendance.aspx">Attendance</a></li>
                        <li><a href="Block.aspx">Blocks</a></li>

                        <li class="dropdown"><a href="#"><span>Profiles</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <li><a href="StudentProfiles.aspx">Student Profiles</a></li>
                                <li><a href="StaffProfiles.aspx">Staff Profiles</a></li>
                            </ul>
                        </li>
                        <div>
                            <li class="dropdown">
                                <asp:Image ID="Image1" Width="40" Height="40" runat="server" class="getstarted" />
                                <ul>
                                    <li><a href="ViewMyProfile.aspx">View Profile</a></li>
                                    <li><a href="Logout.aspx">Logout</a></li>
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
                        <li><a href="AdminHomePage.aspx" style="color: #6C439B">Home page</a></li>
                        <li><a href="ScheduleP1.aspx" style="color: #6C439B">Scheduling</a></li>
                        <li><a href="GenerateSchedules.aspx" style="color: #6C439B">Generate Schedules</a></li>
                        <li>Assign Schedule</li>
                    </ol>
                </div>

            </div>
        </section>
        <!-- End Breadcrumbs -->

        <!-- ======= Schedule Section ======= -->
        <div id="blog" class="blog">
          
                <div class="sidebar justify-content-sm-center">
                        <div class=" col-lg-8-5">
                            <div class="section-tittle text-center ">
                                <br />
                                <br />
                                <h2>Generate Schedule</h2>
                            </div>
                        </div>

                    <div class="container generateSchedule" style="background-color: rgb(244, 248, 249)">
                        <label id="error" style="color: red; display: none;">This Schedule is already assigned!!</label>
                        <span>
                            <asp:Label ID="assignedLabel" Text="" runat="server" Visible="false" CssClass="cust_assign_message" />
                            <asp:Button ID="closeAssignedLabel" Text="Close" runat="server" OnClick="closeAssignedLabel_Click" Visible="false" CssClass="cust_assign_message_button" />
                        </span>
                        <br />

                        <div class="generateSchedule1">
                            <asp:DropDownList ID="ddlStudents" runat="server" CssClass="cust_dropdown">
                            </asp:DropDownList>
                            <asp:Button ID="generateSchedule" runat="server" Text="Assign" OnClick="assign_schedule" class="cust_button" AutoPostBack="true" />
                        </div>

                        <div class="cust_schedule_display">
                            <div class="cust_button_display">
                                <button id="prevSchedule" onclick="getStudentSchedule(-1)">&lt;</button>
                            </div>
                            <table id="scheduleTable">
                                <tr class="row1">
                                    <th bgcolor="grey"></th>
                                    <th id="time1"></th>
                                    <th id="time2"></th>
                                    <th id="time3"></th>
                                    <th id="time4"></th>
                                </tr>
                                <tr>
                                    <td bgcolor="e5e6e4">Sunday</td>
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
                                    <td bgcolor="e5e6e4">Monday</td>
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
                                    <td bgcolor="e5e6e4">Tuesday</td>
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
                                    <td bgcolor="e5e6e4">Wednesday</td>
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
                                    <td bgcolor="e5e6e4">Thursday</td>
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
                            <div class="cust_button_display">
                                <button id="nextSchedule" text="" onclick="getStudentSchedule(1)">&gt;</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <!-- End Schedule Section -->
        


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
    <script>
        function getStudentSchedule(item) {
            updateError(false);
            var request = { "item": item }
            $.ajax({
                method: "POST",
                url: "GenerateSchedulesMain.aspx/get_schedule",
                data: JSON.stringify(request),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d == null || response.d == '') {
                        return;
                    }
                    else if (response.d == 'False') {
                        document.getElementById("scheduleTable").style.display = "none";
                        updateError(true);
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
                url: "GenerateSchedulesMain.aspx/get_instructor_name",
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
                "1": "DarkSeaGreen",
                "2": "LightSteelBLue",
                "3": "Khaki",
                "4": "RosyBrown",
                "5": "IndianRed",
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

        function updateError(isVisible) {
            if (isVisible) {
                document.getElementById("error").style.display = "block";
            }
            else {
                document.getElementById("error").style.display = "none";
            }
        }

        $(document).ready(function () {
            showHideButtons();
            getStudentSchedule(0);
        });

        function showHideButtons() {
            var url = window.location.href;
            var all = url.split("?")[1].split("&")[1].split("=")[1];
            if (all != "true") {
                document.getElementById("prevSchedule").style.display = "none";
                document.getElementById("nextSchedule").style.display = "none";
            }
        }

    </script>
</body>
</html>
