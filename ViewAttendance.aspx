<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html lang="en">

<%@ Import Namespace="System.Data" %>
<script runat="server">


    void Page_Load(System.Object Sender, System.EventArgs Args)
    {

        SqlDataSource ds = new SqlDataSource();
        ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        ds.SelectCommand = $"Select * from Attendance where studentid='{1}' and date='{DateTime.Now.ToShortDateString()}'";
        DataView dv = (DataView)ds.Select(DataSourceSelectArguments.Empty);


        entring.Text = "Absence";
        entring.ForeColor = System.Drawing.Color.Red;

        if (dv.Table == null)
        {

        }
        else
        {
            

            for(int i=0;i<dv.Table.Rows.Count;i++)
            {
                if (dv.Table.Rows[i]["Location"].ToString() == "Entering the center")
                {
                    entring.Text = "Attend";
                    entring.ForeColor = System.Drawing.Color.Green;
                }
                if (dv.Table.Rows[i]["Location"].ToString() == "Class 1")
                {
                    c1.Text = "Attend";
                    c1.ForeColor = System.Drawing.Color.Green;
                }
                if (dv.Table.Rows[i]["Location"].ToString() == "Class 2")
                {
                    c2.Text = "Attend";
                    c2.ForeColor = System.Drawing.Color.Green;

                    if (dv.Table.Rows[i]["Location"].ToString() == "Class 3")
                {
                    c3.Text = "Attend";
                    c3.ForeColor = System.Drawing.Color.Green;
                }
                    if (dv.Table.Rows[i]["Location"].ToString() == "Class 4")
                {
                    c4.Text = "Attend";
                    c4.ForeColor = System.Drawing.Color.Green;
                }
                    if (dv.Table.Rows[i]["Location"].ToString() == "Exit from the center")
                {
                    ex.Text = "Attend";
                    ex.ForeColor = System.Drawing.Color.Green;
                }

                }
            }
        }

        //if (dv.Table.Rows[0]["Entering"].ToString() == "Absence")
        //{
        //    entring.Text = "Absence";
        //    entring.ForeColor = System.Drawing.Color.Red;
        //}
        //else
        //{
        //    entring.Text = "Attend";
        //    entring.ForeColor = System.Drawing.Color.Green;

        //}



    }

</script>


<head runat="server">
    <meta charset="utf-8">
    <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
    <!--  All snippets are MIT license http://bootdey.com/license -->
    <title>schedule table - Bootdey.com</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
        rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
        rel="stylesheet">

    <div class="idance">
        <div class="schedule content-block">
            <div class="container">
                <h2 data-aos="zoom-in-up" class="aos-init aos-animate">Attendance</h2>

                <div class="timetable">

                    <!-- Schedule Top Navigation -->
                    <nav class="nav nav-tabs">

                        <a class="nav-link active">Sunday</a>
                        <a class="nav-link">Monday</a>
                        <a class="nav-link ">Tuesday</a>
                        <a class="nav-link">Wednesday</a>
                        <a class="nav-link">Thursday</a>

                    </nav>

                    <div class="tab-content">
                        <div class="tab-pane show active">
                            <div class="row">

                                <!-- Schedule Item 1 -->
                                <div class="col-md-6">
                                    <div class="timetable-item">

                                        <div class="timetable-item-main">
                                            <div class="timetable-item-time">Entering the center</div>
                                            <asp:Label ID="entring" runat="server" Text="Absece" ForeColor="Red"></asp:Label>

                                        </div>
                                    </div>
                                </div>

                                <!-- Schedule Item 2 -->
                                <div class="col-md-6">
                                    <div class="timetable-item">

                                        <div class="timetable-item-main">
                                            <div class="timetable-item-time">Class 3</div>
                                            <asp:Label ID="c1" runat="server" Text="Absece" ForeColor="Red"></asp:Label>

                                        </div>
                                    </div>
                                </div>

                                <!-- Schedule Item 3 -->
                                <div class="col-md-6">
                                    <div class="timetable-item">

                                        <div class="timetable-item-main">
                                            <div class="timetable-item-time">Class 1</div>
                                            <asp:Label ID="c2" runat="server" Text="Absece" ForeColor="Red"></asp:Label>


                                        </div>
                                    </div>
                                </div>

                                <!-- Schedule Item 4 -->
                                <div class="col-md-6">
                                    <div class="timetable-item">

                                        <div class="timetable-item-main">
                                            <div class="timetable-item-time">Class 4</div>
                                            <asp:Label ID="c3" runat="server" Text="Absece" ForeColor="Red"></asp:Label>


                                        </div>
                                    </div>
                                </div>

                                <!-- Schedule Item 5 -->
                                <div class="col-md-6">
                                    <div class="timetable-item">

                                        <div class="timetable-item-main">
                                            <div class="timetable-item-time">Class 2</div>
                                            <asp:Label ID="c4" runat="server" Text="Absece" ForeColor="Red"></asp:Label>


                                        </div>
                                    </div>
                                </div>

                                <!-- Schedule Item 6 -->
                                <div class="col-md-6">
                                    <div class="timetable-item">

                                        <div class="timetable-item-main">
                                            <div class="timetable-item-time">Exit from center</div>
                                            <asp:Label ID="ex" runat="server" Text="Absece" ForeColor="Red"></asp:Label>

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

    <style type="text/css">
        body {
            margin-top: 20px;
        }

        .idance .classes-details ul.timetable {
            margin: 0 0 22px;
            padding: 0;
        }

            .idance .classes-details ul.timetable li {
                list-style: none;
                font-size: 15px;
                color: #7f7f7f;
            }

        idance .timetable {
            max-width: 900px;
            margin: 0 auto;
        }

        .idance .timetable-item {
            border: 1px solid #d8e3eb;
            padding: 15px;
            margin-top: 20px;
            position: relative;
            display: block;
        }

        @media (min-width: 768px) {
            .idance .timetable-item {
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
            }
        }

        .idance .timetable-item-img {
            overflow: hidden;
            height: 100px;
            width: 100px;
            display: none;
        }

            .idance .timetable-item-img img {
                height: 100%;
            }

        @media (min-width: 768px) {
            .idance .timetable-item-img {
                display: block;
            }
        }

        .idance .timetable-item-main {
            -webkit-box-flex: 1;
            -ms-flex: 1;
            flex: 1;
            position: relative;
            margin-top: 12px;
        }

        @media (min-width: 768px) {
            .idance .timetable-item-main {
                margin-top: 0;
                padding-left: 15px;
            }
        }

        .idance .timetable-item-time {
            font-weight: 500;
            font-size: 16px;
            margin-bottom: 4px;
        }

        .idance .timetable-item-name {
            font-size: 14px;
            margin-bottom: 19px;
        }

        .idance .btn-book {
            padding: 6px 30px;
            width: 100%;
        }

        .idance .timetable-item-like {
            position: absolute;
            top: 3px;
            right: 3px;
            font-size: 20px;
            cursor: pointer;
        }

            .idance .timetable-item-like .fa-heart-o {
                display: block;
                color: #b7b7b7;
            }

            .idance .timetable-item-like .fa-heart {
                display: none;
                color: #f15465;
            }

            .idance .timetable-item-like:hover .fa-heart {
                display: block;
            }

            .idance .timetable-item-like:hover .fa-heart-o {
                display: none;
            }

        .idance .timetable-item-like-count {
            font-size: 12px;
            text-align: center;
            padding-top: 5px;
            color: #7f7f7f;
        }

        .idance .timetable-item-book {
            width: 200px;
        }

            .idance .timetable-item-book .btn {
                width: 100%;
            }

        .idance .schedule .nav-tabs {
            border-bottom: 2px solid #104455;
        }

        .idance .schedule .nav-link {
            -webkit-box-flex: 1;
            -ms-flex: 1;
            flex: 1;
            font-size: 12px;
            text-align: center;
            text-transform: uppercase;
            color: #3d3d3d;
            font-weight: 500;
            -webkit-transition: none;
            -o-transition: none;
            transition: none;
            border-radius: 2px 2px 0 0;
            padding-left: 0;
            padding-right: 0;
            cursor: pointer;
        }

        @media (min-width: 768px) {
            .idance .schedule .nav-link {
                font-size: 16px;
            }
        }

        .idance .schedule .nav-link.active {
            background: #104455;
            border-color: #104455;
            color: #fff;
        }

            .idance .schedule .nav-link.active:focus {
                border-color: #104455;
            }

        .idance .schedule .nav-link:hover:not(.active) {
            background: #46c1be;
            border-color: #46c1be;
            color: #fff;
        }

        .idance .schedule .tab-pane {
            padding-top: 10px;
        }
    </style>

    <script type="text/javascript">

</script>
</body>
</html>
