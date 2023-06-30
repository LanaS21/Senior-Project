<%@ Page Language="C#" %>

<!DOCTYPE html>

<%@ Import Namespace="System.Data" %>
<script runat="server">

    void Page_Load(System.Object Sender, System.EventArgs Args)
    {
        if (!IsPostBack)
        {
            SqlDataSource1.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            SqlDataSource1.SelectCommand = $"Select * from TeamBlock";

            Repeater1.DataBind();
        }

        SqlDataSource ds = new SqlDataSource();
        ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        ds.SelectCommand = $"Select * from Employee where EmployeeId='{Session["EmployeeId"].ToString()}'";
        DataView dv = (DataView)ds.Select(DataSourceSelectArguments.Empty);
        Image2.ImageUrl = "assets/img/" + dv.Table.Rows[0]["Photo"].ToString();
    }

    protected void Block_Button(object sender, EventArgs e)
    {

        LinkButton btn = (LinkButton)sender;

        Response.Redirect("BlockPage.aspx?bid="+btn.CommandArgument);

    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8"/>
  <meta content="width=device-width, initial-scale=1.0" name="viewport"/>

  <title>Block Page</title>
  <meta content="" name="description"/>
  <meta content="" name="keywords"/>

  <!-- Favicons -->
  <link href="../assets/img/managment.png" rel="icon"/>
  <link href="../assets/img/managment (1).png" rel="small-icon"/>

  <!-- Google Fonts -->
  <link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
    rel="stylesheet"/>

  <!-- Vendor CSS Files -->
  <link href="../assets/vendor/animate.css/animate.min.css" rel="stylesheet"/>
  <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"/>
  <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet"/>
  <link href="../assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet"/>
  <link href="../assets/vendor/remixicon/remixicon.css" rel="stylesheet"/>
  <link href="../assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet"/>


  <!-- Template Main CSS File -->
  <link href="../assets/css/style.css" rel="stylesheet"/>
  <link href="../assets/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
  <link href="../assets/css/box/style1.css" rel="stylesheet"/>
  <link href="../assets/css/all.css" rel="stylesheet"/>

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
         
          <li class="dropdown">
          
              <asp:Image ID="Image2" width="40" Height="40" runat="server" class="getstarted"  />
            <ul>
              
                <li><a href="ViewMyProfile.aspx">View Profile</a></li>
              <li><a href="Logout.aspx">Logout</a></li>
            </ul>
          </li>
       

      </nav><!-- .navbar -->
    </div>
  </header><!-- End Header -->

   <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container" >

        <div class="d-flex justify-content-between align-items-center">
          <ol>
            <li><a href="AdminHomePage.aspx" style="color:#6C439B">Home page</a></li>
            <li>Blocks</li>
          </ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs -->

 <!-- ======= Homepage Section ======= -->
  <section id="main" style="background-color: rgb(244, 248, 249)">
    <br />
                    
      <!-- Type of services -->
        <div class="carousel-item active">
          <div class="carousel-container">
            <div class="container">

              <div class="categories-area section-padding60"> <!-- this in style1.css -->
                <div class="container align-items-center">

                            <div class="row justify-content-sm-center">
                                    <div class="section-tittle text-center mb-10">
                                        <h2>Blocks</h2>
                                    </div>
                            </div>
                    <br />
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                    <div class="row justify-content-sm-center">

                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">

                            <ItemTemplate>


                                <div class="col-lg-3 col-md-3 col-sm-4" style="margin-bottom: 20px; margin-left:5px; margin-right:5px;">
                                    <div class="single-cat-block ">
                                        <div class="cat-cap" style="padding:initial">
                                            <h5 style="width:auto; padding:inherit">
                                                <asp:LinkButton ID="LinkButton1"  CommandArgument='<%# Eval("BlockId") %>' OnClick="Block_Button" runat="server"><%# Eval("BlockName") %></asp:LinkButton></h5>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    

                    </div>  <!-- end row-->      <br />
                    <br />
                </div>
              </div>
            </div>
          </div>  <!-- End services -->
        </div>
  </section><!-- End Homepage section -->


  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Tammakan</span></strong>. All Rights Reserved
      </div>
    </div>
  </footer><!-- End Footer -->

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
