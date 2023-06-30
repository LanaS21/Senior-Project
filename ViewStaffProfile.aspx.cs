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
using Newtonsoft.Json;

/// <summary>
/// Summary description for ViewStaffProfile
/// </summary>
public partial class ViewStaffProfile : Page
{
	static string staffId;
	void Page_Load(System.Object Sender, System.EventArgs Args)
	{
		if (!IsPostBack)
		{
			load_data();
		}

		SqlDataSource ds = new SqlDataSource();
		ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
		ds.SelectCommand = $"Select * from Employee where EmployeeId='{Session["EmployeeId"].ToString()}'";
		DataView dv = (DataView)ds.Select(DataSourceSelectArguments.Empty);
		Image2.ImageUrl = "assets/img/" + dv.Table.Rows[0]["Photo"].ToString();
	}

	protected void load_data()
	{
		staffId = Request.QueryString["id"];
		SqlDataSource ds = new SqlDataSource();
		ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;



		ds.SelectCommand = $"Select * from Employee where EmployeeId='{staffId}'";
		DataView dv = (DataView)ds.Select(DataSourceSelectArguments.Empty);
		Image1.ImageUrl = "assets/img/" + dv.Table.Rows[0]["Photo"].ToString();
		
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
		Label20.Text = ((char)(Bid + 64)).ToString();

		LabelEm.Text = dv.Table.Rows[0]["name"].ToString();

	}
	protected void Button_Profile(object sender, EventArgs e)
	{
		Response.Redirect("ViewStaffProfile.aspx?id=" + Request.QueryString["id"]);

	}
	protected void Button1_Click(object sender, EventArgs e)
	{
		Response.Redirect("EditStaffProfile.aspx?id=" + Request.QueryString["id"]);
	}

	[WebMethod]
	public static string get_schedule()
	{
		SqlDataSource ds = new SqlDataSource();
		ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
		ds.SelectCommand = $"Select * from Session where EmployeeId='{staffId}'";
		DataView dv = (DataView)ds.Select(DataSourceSelectArguments.Empty);
		if (dv.Table.Rows.Count < 0)
		{
			return "No schedule";
		}
		return make_detailed_schedule(dv);
	}

	public static string make_detailed_schedule(DataView dv)
	{
		Dictionary<string, string[]> schedule = new Dictionary<string, string[]>();
		string[] days = new string[] {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday"};
		string[] times = new string[] { "8-9", "9-10", "10-11", "11-12", "1-2", "2-3", "3-4", "4-5"};
		foreach (string day in days)
		{
			schedule.Add(day, new string[8]);
		}
		foreach (DataRow row in dv.Table.Rows)
		{
			string day = row["Day"].ToString();
			string time = row["Time"].ToString();
			string student_details = get_student_name(Convert.ToInt32(row["StudentId"]));
			int index = Array.IndexOf(times, time);
			schedule[day][index] = student_details;
		}
		// looping over dict to see empty slots and making them admin
		foreach (string day in days)
		{
			for (int i = 0; i < 8; i++)
			{
				if (schedule[day][i] == null)
				{
					schedule[day][i] = "Admin";
				}
			}
		}
		return JsonConvert.SerializeObject(schedule);
	}

	public static string get_student_name(int studentId)
	{
		SqlDataSource ds = new SqlDataSource();
		ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
		ds.SelectCommand = $"Select * from Student where StudentId='{studentId}'";
		DataView dv = (DataView)ds.Select(DataSourceSelectArguments.Empty);
		return dv.Table.Rows[0]["name"].ToString() + "<br>(" + studentId + ")";
	}
}