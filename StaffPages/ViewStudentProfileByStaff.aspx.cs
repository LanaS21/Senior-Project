using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Threading.Tasks;
using System.Runtime.CompilerServices;
using System.Web.Script.Services;

/// <summary>
/// Summary description for ViewStudentProfile
/// </summary>
public partial class ViewStudentProfile : Page
{
	static string studentId;
	void Page_Load(System.Object Sender, System.EventArgs Args)
	{
		if (!IsPostBack)
		{
			load_data();
			Load_att();
		}

	}
	protected void load_data() {
		studentId = Request.QueryString["id"];

		SqlDataSource ds2 = new SqlDataSource();
		ds2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
		ds2.SelectCommand = $"Select * from Employee where EmployeeId='{Session["EmployeeId"].ToString()}'";
		DataView dv2 = (DataView)ds2.Select(DataSourceSelectArguments.Empty);
		Image2.ImageUrl = "assets/img/" + dv2.Table.Rows[0]["Photo"].ToString();

		SqlDataSource ds = new SqlDataSource();
		ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;



		ds.SelectCommand = $"Select * from student where StudentId='{studentId}'";
		DataView dv = (DataView)ds.Select(DataSourceSelectArguments.Empty);
		Image1.ImageUrl = "assets/img/" + dv.Table.Rows[0]["Photo"].ToString();
		
		Label1.Text = dv.Table.Rows[0]["StudentId"].ToString();
		Label2.Text = dv.Table.Rows[0]["name"].ToString();
		Label3.Text = dv.Table.Rows[0]["address"].ToString();
		Label4.Text = dv.Table.Rows[0]["ParentPhoneNumber"].ToString();
		Label5.Text = dv.Table.Rows[0]["BirthDate"].ToString();
		Label6.Text = dv.Table.Rows[0]["Nationality"].ToString();
		Label7.Text = dv.Table.Rows[0]["IQScore"].ToString();
		Label8.Text = dv.Table.Rows[0]["NationalID"].ToString();
		Label9.Text = dv.Table.Rows[0]["Gender"].ToString();
		Label10.Text = dv.Table.Rows[0]["ParentPhoneNumber2"].ToString();
		Label11.Text = dv.Table.Rows[0]["Allergy"].ToString();
		Label12.Text = dv.Table.Rows[0]["Diagnosis"].ToString();
		String b = dv.Table.Rows[0]["BlockId"].ToString();
		int Bid = Convert.ToInt32(b);
		Label20.Text = ((char)(Bid + 64)).ToString();

		LabelSt.Text = dv.Table.Rows[0]["name"].ToString();
	}
	protected void Button1_Click(object sender, EventArgs e)
	{
		Response.Redirect("EditStudentProfile.aspx?id=" + Request.QueryString["id"]);
	}
	[WebMethod]
	public static string get_schedule()
	{
		SqlDataSource ds = new SqlDataSource();
		ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
		ds.SelectCommand = $"Select * from student where StudentId='{studentId}'";
		DataView dv = (DataView)ds.Select(DataSourceSelectArguments.Empty);
		if (dv.Table.Rows[0]["Schedule"].ToString() == "")
		{
			return "No Schedule";
		}
		else
		{
			return dv.Table.Rows[0]["Schedule"].ToString();
		}
	}

	[WebMethod]
	public static string get_instructor_name(string employeeId)
	{
		SqlDataSource ds = new SqlDataSource();
		ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
		ds.SelectCommand = $"Select * from Employee where EmployeeId='{employeeId}'";
		DataView dv = (DataView)ds.Select(DataSourceSelectArguments.Empty);
		return dv.Table.Rows[0]["Name"].ToString();
	}
	protected void Load_att()
	{

		SqlDataSource ds = new SqlDataSource();
		ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
		ds.SelectCommand = $"Select * from Attendance where studentid='{studentId}' and date='{DateTime.Now.ToShortDateString()}'";
		DataView dv = (DataView)ds.Select(DataSourceSelectArguments.Empty);


		entring.Text = "Absence";
		entring.ForeColor = System.Drawing.Color.Red;

		if (dv.Table == null)
		{

		}

		else
		{
			for (int i = 0; i < dv.Table.Rows.Count; i++)
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
				}
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
}