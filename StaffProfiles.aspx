<%@ Page Language="C#" %>

<!DOCTYPE html>
<%@ Import Namespace="System.Data" %>
<script runat="server">

    void Page_Load(System.Object Sender, System.EventArgs Args)
    {
        if (!IsPostBack)
        {
            SqlDataSource1.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            SqlDataSource1.SelectCommand = $"Select * from Employee";



            Repeater1.DataBind();
        }

        SqlDataSource ds = new SqlDataSource();
        ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        ds.SelectCommand = $"Select * from Employee where EmployeeId='{Session["EmployeeId"].ToString()}'";
        DataView dv = (DataView)ds.Select(DataSourceSelectArguments.Empty);
        Image1.ImageUrl = "assets/img/" + dv.Table.Rows[0]["Photo"].ToString();

    }

    protected void SearchButton_Click(object sender, EventArgs e)
    {
        SqlDataSource1.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        if (typedrp.SelectedIndex == 1)
        {
            SqlDataSource1.SelectCommand = $"Select * from Employee where name like '%{searchkey.Text }%'";
        }
        if (typedrp.SelectedIndex == 2)

        {
            SqlDataSource1.SelectCommand = $"Select * from Emplyee where EmplyeetId='{searchkey.Text }'";

        }
        Repeater1.DataBind();

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        String Empid = btn.CommandArgument;
        Response.Redirect("ViewStaffProfile.aspx?id=" + Empid);

    }

</script>

<style>
    .button3 {
        padding: 5px;
        border: 0px solid black;
        background-color: #6C439B;
        color: white;
        border-radius: 5px;
        font: inherit;
    }
</style>

<html lang="en" />
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Staff Profile</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="../assets/img/managment.png" rel="icon" />
    <link href="../assets/img/managment (1).png" rel="small-icon" />

    <!-- Google Fonts -->
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
        rel="stylesheet">


    <!-- Vendor CSS Files -->
    <link href="../assets/vendor/animate.css/animate.min.css" rel="stylesheet">
    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="../assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="../assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="../assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">


    <!-- Template Main CSS File -->
    <link href="../assets/css/style.css" rel="stylesheet">
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" media="screen">

    <!---->
    <link href="../assets/css/box/style1.css" rel="stylesheet">
    <link href="../assets/css/all.css" rel="stylesheet">
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
                        <li><a href="AdminHomePage.aspx" style="color:#6C439B">Home page</a></li>
                        <li><a href="Profiles.aspx" style="color:#6C439B">Profiles</a></li>
                        <li>Staff Profiles</li>
                    </ol>
                </div>

            </div>
        </section>
        <!-- End Breadcrumbs -->

        <!-- ======= search section ======= -->
        <div id="blog" class="blog">
            <div class="container align-items-center" data-aos="fade-up">
                <div class="sidebar justify-content-sm-center">

                    <div class="row justify-content-sm-center">
                        <div class="cl-xl-7 col-lg-8 col-md-10">
                            <div class="section-tittle text-center">
                                <h2>Staff Profiles</h2>
                            </div>
                        </div>
                    </div>
                    <div class="search-form">

                        <div style="text-align: center">

                             <div class="link">
                                 <div class="cat-icon">
                                     <a href="CreateStaffProfile.aspx" class="logo me-auto">
                                         <img src="../assets/img/add-user.png" alt="add new profile" style="width: 100%;" /></a>
                                 </div>
                             </div>
                           <!-- <div class="col-lg-3 col-md-4 col-sm-10">
                                <div class="single-cat mb-50">
                                    <div class="cat-icon">
                                        <span class="fa-solid fa-address-book"></span>
                                        <a style="color: #000000" href="CreateStaffProfile.aspx">Create new Staff Profile</a>
                                    </div>
                                </div>
                            </div>-->
                            <pre> </pre>
                            <asp:Label ID="Label1" runat="server" Text="Search by:" Font-Bold="true" Font-Size="Medium"></asp:Label>
                            <asp:DropDownList ID="typedrp" runat="server" Height="26px" Width="100px">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>Name</asp:ListItem>
                                <asp:ListItem>ID</asp:ListItem>
                            </asp:DropDownList>

                            <asp:TextBox ID="searchkey" runat="server"></asp:TextBox>
                            <asp:Button ID="Button1" class="button3" runat="server" Text="Search" OnClick="SearchButton_Click" />
                        </div>
                        <pre> </pre>
                        <pre> </pre>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                        <section id="team" class="team ">
                            <div class="container align-items-center">

                                <div class="row">
                                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">

                                        <ItemTemplate>

                                            <div class="col-lg-4 " style="margin-bottom:20px">
                                                <div class="member d-flex align-items-start">
                                                    <div class="pic">
                                                        <img src='../assets/img/<%# Eval("Photo") %>' class="img-fluid" alt="" />
                                                        <%--<asp:Image ID="Image1" width="100" runat="server" class="img-fluid"  />--%>
                                                    </div>
                                                    <div class="member-info">
                                                        <label style="font-size: medium; font-weight: bold"><%# Eval("Name") %>  </label> <br>

                                                          <label style="font-size: medium" ><%# Eval("Specialization") %>  </label>                                                             
                                                                                                                                           <br> <br>
                                                        <asp:Button ID="Button2" class="button3" OnClick="Button2_Click" CommandArgument='<%# Eval("EmployeeID") %>' runat="server" Text="View Profile" />

                                                    </div>
                                                </div>

                                            </div>
                                            

                                        </ItemTemplate>

                                    </asp:Repeater>
                                </div>
                            </div>
                            <!-- End row -->
                        </section>
                    </div>
                    <!-- End Team Section -->
                </div>
            </div>
        </div>
        <!-- End sidebar search formn-->

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
    </form>

    <!-- Vendor JS Files -->
    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="../assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="../assets/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="../assets/vendor/waypoints/noframework.waypoints.js"></script>
    <script src="../assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="../assets/js/main.js"></script>
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/popper.js"></script>
    <script src="../assets/"></script>

</body>
</html>
