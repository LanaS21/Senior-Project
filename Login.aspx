<%@ Page Language="C#" AutoEventWireup="true"   %>

<%@ Import Namespace="System.Data" %>

<!DOCTYPE html>
<script runat="server">


    protected void Button1_Click(object sender, EventArgs e)
    {

        SqlDataSource ds = new SqlDataSource();
        ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;



        ds.SelectCommand = $"Select * from Employee where email='{Email.Text}' and password='{Password.Text}'" ;
        DataView dv = (DataView)ds.Select(DataSourceSelectArguments.Empty);
        if (dv.Table.Rows.Count == 1)
        {
            Session["EmployeeId"] = dv.Table.Rows[0][0].ToString();
            Session["Role"]=dv.Table.Rows[0]["Role"].ToString();
            if (Session["Role"].ToString() == "Admin")
            {
                Response.Redirect("AdminHomePage.aspx");
            }
            if (Session["Role"].ToString() == "Specialist")
            {
               Response.Redirect("StaffPages/StaffHomePage.aspx");
            }
        }

        Label1.Visible = true;

    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" >
 <meta charset="utf-8"/>
  <meta content="width=device-width, initial-scale=1.0" name="viewport"/>

  <title>Tammakan System - Index</title>
  <meta content="" name="description"/>
  <meta content="" name="keywords"/>

  <!-- Favicons -->
  <link href="../assets/img/favicon.png" rel="icon"/>
  <link href="../assets/img/apple-touch-icon.png" rel="apple-touch-icon"/>

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet"/>

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
  <link  href="../assets/css/stylelogin.css" rel="stylesheet"/>

  <!-- =======================================================
  * Template Name: Sailor - v4.9.1
  * Template URL: https://bootstrapmade.com/sailor-free-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<body>
        <form id="form1" runat="server">
      
   

  <!-- ======= Header ======= --> 

  <header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center">

      <!--<h1 class="logo me-auto"><a href="index.html">S</a></h1>
       Uncomment below if you prefer to use an image logo -->
      <a href="../pages/index.html" class="logo me-auto">
           <img src="../assets/img/Logo2.png" style="width:160px ; height: 250px"
                        alt="logo" class="img-fluid" /></a>

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero">
    <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

    <!--  <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>-->

      <div class="carousel-inner" role="listbox">

        <!-- Welcome massage -->
        <div class="carousel-item active" style="background-image: url(../assets/img/background1.jpg)">
          <div class="carousel-container">
            <div class="container">
              <h2 class="animate__animated animate__fadeInDown">Welcome to <span>Tammakan System</span></h2>
              <p class="animate__animated animate__fadeInUp"> Tammakan System is designed to Facilitates management processes that include creating and coordinating schedules for students and specialists, supervising student attendance, and managing student and staff accounts.</p>
              <a href="#about" class="btn-get-started animate__animated animate__fadeInUp scrollto">Login</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section><!-- End Hero -->

  <main id="main">

      <!-- ======= Login Section ======= -->
   <div id="about" class="about">
    <div class="img js-fullheight" style="background-color: rgb(124, 96, 169);">
    <section  class="ftco-section">
      <div class="container">

        <div class="row justify-content-center">
          <div class="col-md-6 text-center mb-5">
              
            <h2 class="heading-section">Login</h2>
          </div>
        </div>

          <%--<div class="col-lg-4" style="margin-bottom:20px; background-color:white" >
              <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
          </div>--%>

        <div class="row justify-content-center">
          <div class="col-md-6 col-lg-4">
            <div class="login-wrap p-0">
                <asp:Label ID="Label1" runat="server" ForeColor="Red" Visible="false" Text="Please Enter Email"></asp:Label>
                <div class="form-group">
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="^[a-zA-Z0-9._%+-]+@+tamakkan.sa$" runat="server"  ControlToValidate="Email"  ForeColor="Red" ErrorMessage="Invalid email"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="Email"  runat="server"  class="form-control" placeholder="Email"></asp:TextBox>
                                      
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" ForeColor="Red" Visible="false" Text="Please Enter Password"></asp:Label>
                     <asp:TextBox ID="Password" runat="server"  class="form-control" placeholder="Password" type="Password" ></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Button ID="Button1" OnClick="Button1_Click" runat="server" type="Password" Text="Login" class="form-control btn btn-primary submit px-3"  />
                </div>
                
                <div class="form-group ">
                 <%-- <div class="w-50">
                    <label class="checkbox-wrap checkbox-primary">Remember Me
                      <input type="checkbox" checked>
                      <span class="checkmark"></span>
                    </label>
                  </div> 
                  <div class="w-50 ml-50">
                    <a href="asp.aspx" >Forgot Password ?</a>
                  </div>--%>
                </div>
              
            </div>
          </div>
        </div>
      </div>
    </section> 
</div>   
</div>
<!-- ======= End Login Section ======= -->
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Tammakan</span></strong>. All Rights Reserved
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
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
	<script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
</body>

</html>
