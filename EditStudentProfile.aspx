<%@ Page Language="C#" %>

<%--<a href="CreateStudentProfile%20(1).aspx">CreateStudentProfile (1).aspx</a>--%>


<!DOCTYPE html>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>

<script runat="server">
        protected void Button_Close(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Response.Redirect("ViewStudentProfile.aspx?id=" + Request.QueryString["id"]);
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            load_data();
            loadBlocksDropDown();
        }
    }

    protected void load_data()
    {
        SqlDataSource ds2 = new SqlDataSource();
        ds2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        ds2.SelectCommand = $"Select * from Employee where EmployeeId='{Session["EmployeeId"].ToString()}'";
        DataView dv2 = (DataView)ds2.Select(DataSourceSelectArguments.Empty);
        Image1.ImageUrl = "assets/img/" + dv2.Table.Rows[0]["Photo"].ToString();

        SqlDataSource ds = new SqlDataSource();
        ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        ds.SelectCommand = $"Select * from Student where StudentId='{Request.QueryString["id"]}'";
        DataView dv = (DataView)ds.Select(DataSourceSelectArguments.Empty);

        studentName.Text = dv.Table.Rows[0]["name"].ToString();
        address.Text = dv.Table.Rows[0]["Address"].ToString();
        phone_Number1.Text = dv.Table.Rows[0]["ParentPhoneNumber"].ToString();
        Birthdate.Text = dv.Table.Rows[0]["BirthDate"].ToString();
        Nationality.Text = dv.Table.Rows[0]["Nationality"].ToString();
        IQ_Score.Text = dv.Table.Rows[0]["IQScore"].ToString();
        National_Id.Text = dv.Table.Rows[0]["NationalId"].ToString();
        Gender.Text = dv.Table.Rows[0]["Gender"].ToString();
        Phone_Number2.Text = dv.Table.Rows[0]["ParentPhoneNumber2"].ToString();
        Allergy.Text = dv.Table.Rows[0]["Allergy"].ToString();
        diagnosis.Text = dv.Table.Rows[0]["diagnosis"].ToString();

        LabelSt.Text = dv.Table.Rows[0]["name"].ToString();
    }

    protected void loadBlocksDropDown()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM TeamBlock", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        Block.DataSource = dt;
        Block.DataTextField = "BlockName";
        Block.DataValueField = "BlockId";
        Block.DataBind();
        Block.Items.Insert(0, new ListItem("Select a Block", "0"));
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource ds = new SqlDataSource();
        ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        int rr = new Random().Next(999, 99999999);
        string file = rr.ToString() + ".png";
        if (ff1.HasFile)
        {

            string image = Server.MapPath("assets/img/" + file);
            ff1.SaveAs(image);
        }
        else
        {
            file = "PicPro.png";
        }

        ds.UpdateCommand = $"Update Student Set name='{studentName.Text}',address='{address.Text}',ParentPhoneNumber='{phone_Number1.Text}',BirthDate='{Birthdate.Text}',Nationality= '{Nationality.Text}',BlockId='{Block.Text}',IQScore='{IQ_Score.Text}',NationalID='{National_Id.Text}',Gender='{Gender.Text}',ParentPhoneNumber2='{Phone_Number2.Text}',Allergy='{Allergy.Text}',Photo='{file}',Diagnosis='{diagnosis.Text}' where StudentId='{Request.QueryString["id"]}'";
        ds.Update();
        Panel1.Visible = true;
    }
    protected void Button_Profile(object sender, EventArgs e)
    {
        Response.Redirect("ViewStudentProfile.aspx?id=" + Request.QueryString["id"]);

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

    .BtnClose {
        padding: 5px;
        border: 0px solid black;
        background-color: grey; /*#6C439B;*/
        color: white;
        border-radius: 5px;
        font: inherit;
    }

    .r22 {
        content: "";
        padding: 21px;
        border: 10px;
        text-align: center;
        display: flex;
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

    }
</style>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Edit Student Profile</title>
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
    <link href="../assets/css/style.css" rel="stylesheet">
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" media="screen">

    <!---->
    <link href="../assets/css/box/style1.css" rel="stylesheet">
    <link href="../assets/css/all.css" rel="stylesheet">
</head>

<body>
    <form id="form12" runat="server">


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
                            <asp:Image ID="Image1" Width="40" Height="40" runat="server" class="getstarted" />
                            <ul>
                                <li><a href="ViewMyProfile.aspx">View Profile</a></li>
                                <li><a href="Logout.aspx">Logout</a></li>
                            </ul>
                        </li>
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
                        <li><a href="StudentProfiles.aspx" style="color: #6C439B">Student profiles</a></li>
                        <li>
                            <asp:LinkButton ID="LinkButton1" OnClick="Button_Profile" runat="server" Style="color: #6C439B">
                                <asp:Label ID="LabelSt" runat="server"></asp:Label>
                                Profile</asp:LinkButton></li>
                        <li>Edit Profile</li>
                    </ol>
                </div>

            </div>
        </section>
        <!-- End Breadcrumbs -->

        <!-- ======= Student Form Section ======= -->
        <div id="blog" class="blog">
            <div class="container align-items-center" data-aos="fade-up">
                <div class="sidebar justify-content-sm-center">

                    <div class="row justify-content-sm-center">
                        <div class="cl-xl-7 col-lg-8 col-md-10">
                            <div class="section-tittle text-center ">
                                <br />
                                <br />
                                <h2>Edit Student Profile</h2>
                            </div>
                        </div>
                    </div>

                    <br />
                    <div class="r22 justify-content-center">

                        <div class="col-md-4 form-group" style="text-align: left; margin-right: 52px;">
                            <label for="Name" class="colleft1" style="margin-bottom: 5px;">Student Full Name<span>*</span></label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="studentName"
                                ForeColor="Red"
                                runat="server" ErrorMessage="Please enter student name"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="studentName" runat="server" placeholder="Student Name" class="form-control"
                                Style="font-size: 10pt"></asp:TextBox>
                        </div>

                        <div class="col-md-4 form-group mt-3 mt-md-0" style="text-align: left;">
                            <label for="Birth Date" class="colleft1" style="margin-bottom: 5px;">Birth Date<span>*</span></label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="Birthdate"
                                ForeColor="Red"
                                runat="server" ErrorMessage="Please enter the birth date"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="Birthdate" runat="server" class="form-control"
                                placeholder="Enter Student Birthdate" Style="font-size: 10pt" type="date"></asp:TextBox>
                        </div>
                    </div>

                    <div class="r22 justify-content-center">

                        <div class="col-md-4 form-group" style="text-align: left; margin-right: 52px;">
                            <label for="Gender" class="colleft1" style="margin-bottom: 5px;">Gender<span>*</span></label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="Gender" ForeColor="Red" runat="server"
                                ErrorMessage="Please enter the gender"></asp:RequiredFieldValidator>
                            <asp:DropDownList ID="Gender" class="form-control" runat="server" Style="font-size: 10pt">
                                <asp:ListItem> Select a gender </asp:ListItem>
                                <asp:ListItem> Male </asp:ListItem>
                                <asp:ListItem> Female </asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="col-md-4 form-group mt-3 mt-md-0" style="text-align: left;">
                            <label for="Nationality" class="colright1" style="margin-bottom: 5px;">Nationality<span>*</span></label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="Nationality"
                                ForeColor="Red" runat="server" ErrorMessage="Please enter the nationality"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="Nationality" runat="server" class="form-control"
                                placeholder="Enter Student Nationality" Style="font-size: 10pt"></asp:TextBox>
                        </div>
                    </div>

                    <div class="r22 justify-content-center">

                        <div class="col-md-4 form-group" style="text-align: left; margin-right: 52px;">
                            <label for="National Id" class="colright1" style="margin-bottom: 5px;">National ID / Resident ID<span>*</span></label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="National_Id" ForeColor="Red"
                                runat="server" ErrorMessage="Please enter the national Id"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="National_Id" runat="server" class="form-control"
                                placeholder="Enter Student National Id" Style="font-size: 10pt"></asp:TextBox>
                            <asp:Label ID="National_IdERORR" runat="server" Text="The national id already exists"
                                Visible="false"></asp:Label>

                        </div>

                        <div class="col-md-4 form-group mt-3 mt-md-0" style="text-align: left;">
                            <label for="Address" class="colright1" style="margin-bottom: 5px;">Address<span>*</span></label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="address" ForeColor="Red"
                                runat="server" ErrorMessage="Please enter the address"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="address" runat="server" class="form-control"
                                placeholder="Enter Student Address" Style="font-size: 10pt"></asp:TextBox>
                        </div>
                    </div>


                    <div class="r22 justify-content-center">

                        <div class="col-md-4 form-group" style="text-align: left; margin-right: 52px;">
                            <label for="Name" class="colleft1" style="margin-bottom: 5px;">Parent Phone Number<span>*</span></label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="phone_Number1" ForeColor="Red"
                                runat="server" ErrorMessage="Please enter a phone number"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="phone_Number1" runat="server" class="form-control" placeholder="Enter Parent Phone Number"
                                Style="font-size: 10pt"></asp:TextBox>

                        </div>

                        <div class="col-md-4 form-group mt-3 mt-md-0" style="text-align: left;">
                            <label for="Phone Number" class="colleft1" style="margin-bottom: 5px;">Additional Parent Phone Number</label>
                            <asp:TextBox ID="Phone_Number2" runat="server" class="form-control"
                                placeholder="Enter Parent Phone Number (optional)" Style="font-size: 10pt"></asp:TextBox>
                        </div>
                    </div>


                    <div class="r22 justify-content-center">

                        <div class="col-md-4 form-group" style="text-align: left; margin-right: 52px;">
                            <label for="IQ Score" class="colright1" style="margin-bottom: 5px;">Student IQ Score (optional)</label>
                            <asp:TextBox ID="IQ_Score" runat="server" class="form-control"
                                placeholder="Enter Student IQ Score" Style="font-size: 10pt"></asp:TextBox>
                        </div>

                        <div class="col-md-4 form-group mt-3 mt-md-0" style="text-align: left;">
                            <label for="Block" class="colleft1" style="margin-bottom: 5px;">Block<span>*</span></label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ControlToValidate="Block"
                                ForeColor="Red" runat="server" ErrorMessage="Please choose a block"></asp:RequiredFieldValidator>
                            <asp:DropDownList ID="Block" class="form-control" runat="server" Style="font-size: 10pt">
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="r22 justify-content-center">

                        <div class="col-md-4 form-group" style="text-align: left; margin-right: 52px;">
                            <label for="diagnosis" class="colright1" style="margin-bottom: 5px;">Student Diagnosis </label>
                            <asp:TextBox ID="diagnosis" TextMode="MultiLine" runat="server" class="form-control"
                                placeholder="Enter Student diagnosis" Style="font-size: 10pt;"></asp:TextBox>
                        </div>
                        <div class="col-md-4 form-group mt-3 mt-md-0" style="text-align: left;">
                            <label for="Allergy" class="colright1" style="margin-bottom: 5px;">Student Allergy (if any)</label>
                            <asp:TextBox ID="Allergy" TextMode="MultiLine" runat="server" class="form-control"
                                placeholder="Enter Student Allergy (if any)" Style="font-size: 10pt"></asp:TextBox>
                        </div>
                    </div>

                    <div class="r22 justify-content-center">

                        <div class="col-md-4 form-group mt-3 mt-md-0" style="text-align: left;">
                            <label for="Photo" class="colright1" style="margin-bottom: 5px;">Profile Photo </label>
                            <asp:FileUpload ID="ff1" runat="server" class="form-control" Style="font-size: 10pt" />
                        </div>
                    </div>

                    <asp:Button ID="Button1" runat="server" Class="button3" OnClick="Button1_Click" Text="Edit profile" />
            

                </div>
            </div>
        </div>
        <!-- End Form Section -->

        <!-- ======= Poupup msg ======= -->
        <asp:Panel ID="Panel1" runat="server" Visible="false" class="PoupupMsg">
            <pre> 
</pre>
            <img src="check.png" width="70" alt="" />
            <pre> </pre>
            <h4>The Profile edited successfully</h4>
            <br />
     
            <asp:Button ID="Button2" runat="server" Class="BtnClose" Text="Close" OnClick="Button_Close" CausesValidation="false" />
            <br />
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

