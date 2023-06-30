<%@ Page Language="C#" %>

<!DOCTYPE html>
<%@ Import Namespace="System.Data" %>

<script runat="server">


    void Page_Load(System.Object Sender, System.EventArgs Args)
    {

        SqlDataSource ds = new SqlDataSource();
        ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        ds.SelectCommand = $"Select * from Employee where EmployeeId='{Session["EmployeeId"].ToString()}'";
        DataView dv = (DataView)ds.Select(DataSourceSelectArguments.Empty);
        Image1.ImageUrl = "assets/img/" + dv.Table.Rows[0]["Photo"].ToString();
        Image2.ImageUrl = "assets/img/" + dv.Table.Rows[0]["Photo"].ToString();
        Label1.Text = dv.Table.Rows[0]["EmployeeId"].ToString();
        Label2.Text = dv.Table.Rows[0]["name"].ToString();
        Label3.Text = dv.Table.Rows[0]["Gender"].ToString();
        Label4.Text = dv.Table.Rows[0]["PhoneNumber"].ToString();
        Label5.Text = dv.Table.Rows[0]["Email"].ToString();
        Label6.Text = dv.Table.Rows[0]["Address"].ToString();
        Label7.Text = dv.Table.Rows[0]["BirthDate"].ToString();
        Label8.Text = dv.Table.Rows[0]["Nationality"].ToString();
        Label9.Text = dv.Table.Rows[0]["Role"].ToString();
        Label10.Text = dv.Table.Rows[0]["DateJoined"].ToString();
        Label11.Text = dv.Table.Rows[0]["NationalID"].ToString();
        Label12.Text = dv.Table.Rows[0]["Specialization"].ToString();
        String b = dv.Table.Rows[0]["BlockId"].ToString();
        int Bid = Convert.ToInt32(b);
        Label13.Text = ((char)(Bid + 64)).ToString();

        LabelEm.Text = dv.Table.Rows[0]["name"].ToString();
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditMyProfile.aspx?id=" + Request.QueryString["id"]);
    }
</script>

<style>
     .btn-send1 {
            border: 0;
            background-color: #53335a;
            color: #FFF;
            border-radius: 50px;
            padding: 10px 60px;
            cursor: pointer;
        }

        .card1 {
            background-color: #FFF;
            border-radius: 10px;
            box-shadow: 1px 1px 1px 1px rgb(0, 0, 0/15%);
            padding: 1em;
            position: absolute;
            top: -100%;
            left: 50%;
            text-align: center;
            width: 400px;
            transform: translate(-50%,-50%);
            transition: all .5s;
            opacity: 0;
        }

            .card1.open1 {
                opacity: 1;
                top: 50%;
            }

            .card1 img1 {
                width: 100px;
                height: 100px;
                border-radius: 50px;
                margin-top: -50px;
            }

            .card1 h2 {
                font-size: 22px;
                font-weight: bold;
                margin-bottom: 5px;
            }

            .card1 .btn-close1 {
                width: 100%;
                border-radius: 50px;
                border: 0;
                padding: 15px;
                margin-top: 20px;
                background-color: #53335a;
                color: #FFF;
                cursor: pointer;
            }
  
</style>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>My Profile Page</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- Favicons -->
    <link href="../assets/img/managment.png" rel="icon" />
    <link href="../assets/img/managment (1).png" rel="small-icon" />


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

                <a href="../AdminHomePage.aspx" class="logo me-auto">
                    <img src="../assets/img/Logo2.png" style="width: 160px; height: 250px"
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

                        <li class="dropdown">

                            <asp:Image ID="Image2" Width="40" Height="40" runat="server" class="getstarted" />
                            <ul>
                                <li><a href="ViewMyProfile.aspx">View Profile</a></li>
                                <li><a href="Logout.aspx">Logout</a></li>
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
                        <li><a href="AdminHomePage.aspx" style="color: #6C439B">Home page</a></li>
                        <li><a href="Profiles.aspx" style="color: #6C439B">Profiles</a></li>
                        <li><a href="StaffProfiles.aspx" style="color: #6C439B">Staff profiles</a></li>
                        <li>
                            <asp:Label ID="LabelEm" runat="server"></asp:Label>
                            Profile</li>
                    </ol>
                </div>

            </div>
        </section>
        <!-- End Breadcrumbs -->

        <main id="main" style="background-color: rgb(244, 248, 249)">

            <!-- ======= staff information Section ======= -->
            <div class="categories-area section-padding25" />
            <div class="container">

                <div class="main-body">
                    <div class="row gutters-sm">

                        <!-- Left section -->
                        <div class="col-md-5 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex flex-column align-items-center text-center">
                                        <%--<img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin" class="rounded-circle" width="150" />--%>
                                        <asp:Image ID="Image1" Width="200" Height="200" runat="server" class="rounded-circle" />
                                        <hr />
                                        <div class="col-sm-6">

                                            <asp:Label ID="Label2" runat="server" class="col-sm-9 text-secondary" Text="Label" Font-Size="Larger" Font-Bold="true"></asp:Label>
                                           <br/>
                                           <br/>
                                            <h4 class="mb-0">Specialization: </h4>
                                             <asp:Label ID="Label15" runat="server" class="col-sm-9 text-secondary" Text="Label" ></asp:Label>
                                            
                                        <br/>
                                           <br/>
                                       
                                            <h4 class="mb-0">Employee id:
                                            <asp:Label ID="Label1" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label></h4>


                                        </div>
                                     
                                        <hr />
                                        <button class="btn btn-outline-primary">Schedule</button>

                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="col-md-7 align-content-end">
                            <div class="card mb-3">
                                <div class="card-body">
                                   <br />
                                    <br />

                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h4 class="mb-0">Block:  </h4>
                                                <asp:Label ID="Label14" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label>
                                        </div>
                                        <asp:Label ID="Label13" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label>
                                    </div>

                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Gender</h6>
                                        </div>
                                        <asp:Label ID="Label3" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label>
                                    </div>

                                    <hr />
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Role</h6>
                                        </div>
                                        <asp:Label ID="Label9" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label>
                                    </div>

                                    <hr />
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Specialization</h6>
                                        </div>
                                        <asp:Label ID="Label12" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label>
                                    </div>

                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Phone Number</h6>
                                        </div>
                                        <asp:Label ID="Label4" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label>
                                    </div>

                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Email</h6>
                                        </div>
                                        <asp:Label ID="Label5" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label>
                                    </div>


                                    <hr />
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Address</h6>
                                        </div>
                                        <asp:Label ID="Label6" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label>
                                    </div>


                                    <hr />
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Birth Date</h6>
                                        </div>
                                        <asp:Label ID="Label7" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label>
                                    </div>

                                    <hr />
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Nationality</h6>
                                        </div>
                                        <asp:Label ID="Label8" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label>
                                    </div>



                                    <hr />
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Date Joined</h6>
                                        </div>
                                        <asp:Label ID="Label10" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label>
                                    </div>

                                    <hr />
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">National Id</h6>
                                        </div>
                                        <asp:Label ID="Label11" runat="server" class="col-sm-9 text-secondary" Text="Label"></asp:Label>
                                    </div>


                                    <hr />
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <asp:Button ID="Button1" runat="server" Text="Edit" OnClick="Button1_Click" class="btn btn-info " />
                                            <a href="#" onclick="show_popup()" class="btn btn-info ">Delete</a>

                                        </div>



                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- End  Section -->
        </main>
        <!-- End #main -->

        <div class="container1">
            <div class="card1" id="popup">
                <img src="check.png" alt="" style="width: 150px !important" />
                <h2>Are you want do delete?</h2>
                <p></p>
                <a class="btn-close1" onclick="hide_popup()">No</a>
                <a class="btn-close1" onclick="hide_popup()">Yes</a>

            </div>
        </div>

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

        <script>
            function show_popup() {
                document.getElementById('popup').classList.add('open1');
            }
            function hide_popup() {
                document.getElementById('popup').classList.remove('open1');
                const searchParams = window.location.search.searchParams;
                window.location.href = "deleteEmp.aspx?id=" + searchParams.get('id');

            }
        </script>


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
