<%@ Page Language="C#" %>

<!DOCTYPE html>
<%@ Import Namespace="System.Data" %>

<script runat="server">

    void Page_Load(System.Object Sender, System.EventArgs Args)
    {
        if (!IsPostBack)
        {
            //load_Block();
            load_Data();
        }

        SqlDataSource ds = new SqlDataSource();
        ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        ds.SelectCommand = $"Select * from Employee where EmployeeId='{Session["EmployeeId"].ToString()}'";
        DataView dv = (DataView)ds.Select(DataSourceSelectArguments.Empty);
        Image3.ImageUrl = "assets/img/" + dv.Table.Rows[0]["Photo"].ToString();
    }

    void load_Block()
    {

        SqlDataSource ds = new SqlDataSource();
        ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        ds.SelectCommand = $"Select * from TeamBlock where BlockId='{Request.QueryString["id"]}'";
        DataView dv = (DataView)ds.Select(DataSourceSelectArguments.Empty);

        //LabelBlock.Text = dv.Table.Rows[0]["BlockName"].ToString();

    }

    protected void load_Data()
    {
        SqlDataSource1.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlDataSource2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;


        SqlDataSource2.SelectCommand = $"Select * from Employee where BlockId='{Request.QueryString["bid"]}' and Not Specialization='Adminstrarion' ";
        SqlDataSource1.SelectCommand = $"Select * from Student where BlockId={Request.QueryString["bid"]}";


        Repeater1.DataBind();
        Repeater2.DataBind();

        SqlDataSource ds = new SqlDataSource();
        ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        ds.SelectCommand = $"Select count(StudentId) as c from Student where BlockId='{Request.QueryString["bid"]}'";
        DataView dv1 = (DataView)ds.Select(DataSourceSelectArguments.Empty);

        //LabelBlock.Text = dv1.Table.Rows[0]["BlockName"].ToString();
        stdnum.Text = dv1.Table.Rows[0][0].ToString();


       
        ds.SelectCommand = $"Select count(EmployeeId) as c from Employee where BlockId='{Request.QueryString["bid"]}'";
        DataView dv2 = (DataView)ds.Select(DataSourceSelectArguments.Empty);
        Stufnum.Text = dv2.Table.Rows[0][0].ToString();

        ds.SelectCommand = $"Select * from Employee where BlockId='{Request.QueryString["bid"]}'";
        DataView dv0 = (DataView)ds.Select(DataSourceSelectArguments.Empty);
        Admin.Text = dv0.Table.Rows[0]["Name"].ToString();

        ds.SelectCommand = $"Select * from TeamBlock where BlockId='{Request.QueryString["bid"]}'";
        DataView dv3 = (DataView)ds.Select(DataSourceSelectArguments.Empty);
        BlockLetter.Text = dv3.Table.Rows[0]["BlockName"].ToString();
        LabelBl.Text = BlockLetter.Text;

    }

    protected void SearchButton_Click(object sender, EventArgs e)
    {

        SqlDataSource1.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlDataSource2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        if (typedrp.SelectedIndex == 1)
        {
            SqlDataSource1.SelectCommand = $"Select * from Student where name like '%{searchkey.Text }%'";
            Repeater1.DataBind();
        }
        if (typedrp.SelectedIndex == 2)

        {
            SqlDataSource2.SelectCommand = $"Select * from Employee where name like'%{searchkey.Text }%' and Not Specialization='Adminstrarion'";
            Repeater2.DataBind();

        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        String Empid = btn.CommandArgument;
        Response.Redirect("ViewStaffProfile.aspx?id=" + Empid);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        String stdid = btn.CommandArgument;
        Response.Redirect("ViewStudentProfile.aspx?id=" + stdid);

    }

    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        RepeaterItem itm = (RepeaterItem)e.Item;
        Button btn = (Button)itm.FindControl("btn");
        string id = btn.CommandArgument;

        Label att = (Label)itm.FindControl("att");

        SqlDataSource ds = new SqlDataSource();
        ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        ds.SelectCommand = $"Select * from Attendance where StudentId='{id}' ORDER BY AttendanceId DESC";
        try
        {
            DataView dv1 = (DataView)ds.Select(DataSourceSelectArguments.Empty);
            att.Text = dv1.Table.Rows[0]["Location"].ToString();

            }
        
        catch
        {
            att.Text = " -";
            att.ForeColor = System.Drawing.Color.Red;

        }

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

<html xmlns="http://www.w3.org/1999/xhtml" />


<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Block A</title>
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

                            <asp:Image ID="Image3" Width="40" Height="40" runat="server" class="getstarted" />
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

        <asp:SqlDataSource ID="SqlDataSource" runat="server"></asp:SqlDataSource>
        <!-- ======= Breadcrumbs ======= -->
        <section id="breadcrumbs" class="breadcrumbs">
            <div class="container">

                <div class="d-flex justify-content-between align-items-center">
                    <ol>
                        <li><a href="AdminHomePage.aspx" style="color: #6C439B">Home page</a></li>
                        <li><a href="Block.aspx" style="color: #6C439B">Blocks</a></li>
                        <li>Block 
                            <asp:Label ID="LabelBl" runat="server"></asp:Label>
                        </li>
                    </ol>
                </div>

            </div>
        </section>
        <!-- End Breadcrumbs -->



        <!-- ======= Block section ======= -->
        <div id="blog" class="blog">
            <div class="container align-items-center" data-aos="fade-up">
                <div class="sidebar justify-content-sm-center">

                    <div class="row justify-content-sm-center">
                        <div class="cl-xl-7 col-lg-8 col-md-10">
                            <div class="section-tittle text-center">
                                <h2>Block  
                                     
                                    <asp:Label ID="BlockLetter" runat="server" Text="Label" Style="color: black; font-size: 30px"
                                        Font-Bold="true"></asp:Label>
                                </h2>

                            </div>
                        </div>
                    </div>

                    <pre> </pre>

                    <div style="border: 2px solid #6C439B; background-color: white; text-align: center; padding: 1em 0;">


                        <asp:Label ID="Label4" runat="server" Text="Admin:"
                            Font-Bold="true" Font-Size="Medium"></asp:Label>
                        <asp:Label ID="Admin" runat="server" Text="Label"
                            Style="margin-right: 80px"></asp:Label>


                        <asp:Label ID="Label1" runat="server" Text="Number of the student:"
                            Font-Bold="true" Font-Size="Medium"></asp:Label>
                        <asp:Label ID="stdnum" runat="server" Text="Label"
                            Style="margin-right: 60px"></asp:Label>

                        <asp:Label ID="Label3" runat="server" Text="Number of the staff:"
                            Font-Bold="true" Font-Size="Medium"></asp:Label>
                        <asp:Label ID="Stufnum" runat="server" Text="Label"></asp:Label>

                    </div>

                    <pre> </pre>

                    <pre> </pre>
                    <!-- ======= search section ======= -->
                    <div class="search-form">

                        <div style="text-align: center">
                            <asp:Label ID="Label2" runat="server" Text="Search for:" Font-Bold="true" Font-Size="Medium"></asp:Label>
                            <asp:DropDownList ID="typedrp" runat="server" Height="26px" Width="100px">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>Student</asp:ListItem>
                                <asp:ListItem>Staff</asp:ListItem>
                            </asp:DropDownList>

                            <asp:TextBox ID="searchkey" runat="server"></asp:TextBox>
                            <asp:Button ID="Button3" class="button3" runat="server" Text="Search" OnClick="SearchButton_Click" />
                        </div>

                        <br />
                        <hr />

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>

                        <!-- ======= Staff  section ======= -->
                        <pre>   
                </pre>
                        <div class="row  justify-content-sm-center">
                            <div class="section-tittle-header text-lg-start">
                                <h3 style="font-size: x-large; font-weight: bold">Staff Profiles</h3>
                            </div>
                        </div>


                        <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                        <section id="team" class="team ">
                            <div class="container align-items-center">

                                <div class="row">
                                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">

                                        <ItemTemplate>

                                            <div class="col-lg-4 " style="margin-bottom: 20px">
                                                <div class="member d-flex align-items-start">
                                                    <div class="pic">
                                                        <%--<img src="../assets/img/man1.png" class="img-fluid" alt="" />--%>
                                                        <img src='../assets/img/<%# Eval("Photo") %>' class="img-fluid" alt="" />
                                                    </div>
                                                    <div class="member-info">
                                                        <label style="font-size: medium; font-weight: bold"><%# Eval("Name") %>  </label>
                                                        <br>

                                                        <label style="font-size: medium"><%# Eval("Specialization") %>  </label>
                                                            <label style="font-size: medium ;"> </label>
                                                        <br>
                                                        <br>
                                                        <asp:Button ID="Button2" class="button3" OnClick="Button1_Click" CommandArgument='<%# Eval("EmployeeID") %>'
                                                            runat="server" Text="View Profile" />

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
                    <!-- End Staff Section -->
                    <hr>

                    <!-- ======= student section ======= -->
                    <pre>

                    </pre>
                    <div class="row justify-content-sm-center">
                        <div class="section-tittle-header text-lg-start">
                            <h3 style="font-size: x-large; font-weight: bold">Students Profiles</h3>
                        </div>
                    </div>
                    <div class="search-form">

                        <section id="team" class="team ">
                            <div class="container align-items-center">
                                <div class="row">

                                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound">

                                        <ItemTemplate>
                                            <div class="col-lg-4" style="margin-bottom: 20px">
                                                <div class="member d-flex align-items-start">
                                                    <div class="pic">
                                                        <%--<img src="../assets/img/man1.png" class="img-fluid" alt="" />--%>
                                                        <img src='../assets/img/<%# Eval("Photo") %>' class="img-fluid" alt="" />
                                                    </div>

                                                    <div class="member-info">
                                                        <!-- <h3 style="font-size:medium; font-weight: bold">T</h3><label style="font-size:medium; font-weight: bold" ><%# Eval("StudentId") %>  </label>-->
                                                        <label style="font-size: medium; font-weight: bold"><%# Eval("Name") %>  </label>
                                                        <label style="font-size: medium ; color:SteelBlue">The Student now in: </label>
                                                       <%-- <asp:Label ID="Label5" runat="server" Text="Now in:" ForeColor="SteelBlue"></asp:Label>--%>

                                                        <asp:Label ID="att" runat="server" Text="Label"></asp:Label>

                                                        <asp:Button ID="btn" OnClick="Button2_Click" class="button3" CommandArgument='<%# Eval("StudentID") %>'
                                                            runat="server" Text="View Profile" />
                                                    </div>
                                                </div>
                                            </div>


                                        </ItemTemplate>

                                    </asp:Repeater>

                                </div>

                            </div>


                        </section>
                        <!-- End Team Section -->
                    </div>
                    <!-- End student section -->

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

        <!-- Vendor JS Files -->
        <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="../assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="../assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="../assets/vendor/waypoints/noframework.waypoints.js"></script>
        <script src="../assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="../assets/js/main.js"></script>
    </form>
</body>
</html>
