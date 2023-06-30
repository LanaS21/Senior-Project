<%@ Page Language="C#" %>

<!DOCTYPE html>
<%@ Import Namespace="System.Data" %>

<script runat="server">

    protected void Button_Close(object sender, EventArgs e)
    {
        Panel1.Visible = false;
    }

    void Page_Load(System.Object Sender, System.EventArgs Args)
    {
        if (!IsPostBack)
        {
            SqlDataSource1.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;


            SqlDataSource1.SelectCommand = $"Select * from Student";


            Repeater1.DataBind();
        }

        SqlDataSource ds = new SqlDataSource();
        ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        ds.SelectCommand = $"Select * from Employee where EmployeeId='{Session["EmployeeId"].ToString()}'";
        DataView dv = (DataView)ds.Select(DataSourceSelectArguments.Empty);
        Image2.ImageUrl = "assets/img/" + dv.Table.Rows[0]["Photo"].ToString();
    }


    protected void submitButton(object sender, EventArgs e)
    {
        SqlDataSource ds = new SqlDataSource();
        ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        int a = 0;

        if (typedrp.SelectedIndex == 0)
        {
            ds.SelectCommand = $"Select * from Student where name='{searchkey.Text }'";
            DataView dv = (DataView)ds.Select(DataSourceSelectArguments.Empty);

        }
    }

    protected void AttendButton(object sender, EventArgs e)
    {
        ImageButton btn = (ImageButton)sender;
        String StudentID = btn.CommandArgument;

        RepeaterItem itm = (RepeaterItem)btn.NamingContainer;
        DropDownList drp = (DropDownList)itm.FindControl("DropDownList1");
        String cls = drp.SelectedValue;
        SqlDataSource ds = new SqlDataSource();
        ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        ds.SelectCommand = $"Select * from Employee where EmployeeId='{Session["EmployeeId"].ToString()}'";
        DataView dv = (DataView)ds.Select(DataSourceSelectArguments.Empty);
        String name = dv.Table.Rows[0]["name"].ToString();

        ds.InsertCommand = $"insert into Attendance values('{StudentID}','{DateTime.Now.ToShortDateString()}','{name}','{cls}')";
        ds.Insert();
        Panel1.Visible = true;


    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        SqlDataSource1.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        if (typedrp.SelectedIndex == 1)
        {
            SqlDataSource1.SelectCommand = $"Select * from Student where name like '%{searchkey.Text }%'";
        }
        if (typedrp.SelectedIndex == 2)

        {
            SqlDataSource1.SelectCommand = $"Select * from Student where StudentId='{searchkey.Text }'";

        }
        Repeater1.DataBind();

    }



</script>
<style>
    .PoupupMsg {
        background: #e4e6fb;
        width: 360px;
        height: 250px;
        text-align: center;
        padding: initial;
        position: fixed;
        top: 38%;
        left: 48%;
        transform: translate(-150px, 0px);
        box-shadow: 6px 8px rgba(0, 0, 0, 0.1);
    }

    .Profpic {
        border-radius: 190px;
        width: 100%;
        height: max-content;
    }

    .r22 {
        content: "";
        padding: 21px;
        border: 10px;
        text-align: center;
        display: flex;
    }

    .button3 {
        padding: 5px;
        border: 0px solid black;
        background-color: grey; /*#6C439B;*/
        color: white;
        border-radius: 5px;
        font: inherit;
    }
</style>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Student Attendance</title>
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
                        <li><a href="StaffHomePage.aspx" style="color: #6C439B">Home page</a></li>
                        <li>Attendance</li>
                    </ol>
                </div>

            </div>
        </section>
        <!-- End Breadcrumbs -->

        <!-- ======= Attendence Section ======= -->
        <div id="blog" class="blog">
            <div class="container align-items-center" data-aos="fade-up">
                <div class="sidebar justify-content-sm-center">
                    <br />
                    <br />
                    <div class="row justify-content-sm-center">
                        <div class="cl-xl-7 col-lg-8 col-md-10">
                            <div class="section-tittle text-center">
                                <h2>Search For Student</h2>
                            </div>
                        </div>
                    </div>

                    <br />
                    <div class="search-form">

                        <div style="text-align: center">
                            <asp:Label ID="Label1" runat="server" Text="Search by:" Font-Bold="true" Font-Size="Medium"></asp:Label>
                            <asp:DropDownList ID="typedrp" runat="server" Height="26px" Width="100px">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>Name</asp:ListItem>
                                <asp:ListItem>ID</asp:ListItem>
                            </asp:DropDownList>

                            <asp:TextBox ID="searchkey" runat="server"></asp:TextBox>

                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/assets/img/srch.jpg"
                                Width="20" OnClick="ImageButton1_Click" />

                        </div>
                        <pre> 

                        </pre>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>

                        <div class="sidebar-item search-form">
                            <!-- from-->
                            <section id="team" class="team ">
                                <div class="container align-items-center">

                                    <div class="row">

                                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">

                                            <ItemTemplate>

                                                <div class="col-lg-4 d-flex" style="margin-bottom: 20px">
                                                    <div class="member d-flex align-items-start">
                                                        <div class="pic">
                                                    
                                                            <img src='../assets/img/<%# Eval("Photo") %>' class="img-fluid" alt="" style="border-radius: 6px;" />
                                                        </div>
                                                        <div class="member-info  ">

                                                            <label style="font-size: medium; font-weight: bold"><%# Eval("Name")  %>  </label>
                                                            <label style="font-size: medium; color: SteelBlue; margin-bottom: inherit">Choose place: </label>
                                                          
                                                            <pre> </pre>


                                                            <asp:DropDownList ID="DropDownList1" runat="server" Height="23px" Width="120px">
                                                                <asp:ListItem></asp:ListItem>
                                                                <asp:ListItem>Entering the center</asp:ListItem>
                                                                <asp:ListItem>Class 1</asp:ListItem>
                                                                <asp:ListItem>Class 2</asp:ListItem>
                                                                <asp:ListItem>Class 3</asp:ListItem>
                                                                <asp:ListItem>Class 4</asp:ListItem>
                                                                <asp:ListItem>Exit from the center</asp:ListItem>
                                                            </asp:DropDownList>

                                                            <asp:ImageButton ID="ImageButton2" Width="24" ImageUrl="~/assets/img/check00.png" ImageAlign="AbsBottom"
                                                                runat="server" CommandArgument='<%# Eval("StudentId") %>' OnClick="AttendButton" />
                                                        </div>
                                                        <!--  <span>Chief Executive Officer</span> -->

                                                    </div>
                                                    <%-- </div>--%>
                                                </div>

                                            </ItemTemplate>

                                        </asp:Repeater>
                                    </div>
                                    <!-- End row -->
                                </div>
                            </section>
                            <!-- section-->
                        </div>
                    </div>
                    <!-- End sidebar -->
                </div>
                <!-- End blog sidebar -->
            </div>
        </div>
        <!-- End Attendance Section -->

        <!-- ======= Poupup msg ======= -->
        <asp:Panel ID="Panel1" runat="server" Visible="false" class="PoupupMsg">
            <pre> 
           </pre>
            <img src="check.png" width="70" alt="" />
            <pre> </pre>
            <h4>The Student attendance recorded successfully</h4>
            <br />
            <asp:Button ID="Button2" runat="server" Class="button3" Text="Close" OnClick="Button_Close" /><br />
        </asp:Panel>

        <!-- End Poupup msg  -->

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
