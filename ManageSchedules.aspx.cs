using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageSchedules : System.Web.UI.Page
{
	SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
	SqlCommand cmd;
	SqlDataAdapter da;
	DataTable dt;
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			fill_blocks_drop_down();
			ddlStudents.Enabled = false;
			manageSchedule.Enabled = false;
		}

		SqlDataSource ds = new SqlDataSource();
		ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
		ds.SelectCommand = $"Select * from Employee where EmployeeId='{Session["EmployeeId"].ToString()}'";
		DataView dv = (DataView)ds.Select(DataSourceSelectArguments.Empty);
		Image1.ImageUrl = "assets/img/" + dv.Table.Rows[0]["Photo"].ToString();
	}

	protected void fill_blocks_drop_down()
	{
		string query = "SELECT * FROM TeamBlock";
		ddlBlocks.DataSource = load_dropdown_data(query);
		ddlBlocks.DataTextField = "BlockName";
		ddlBlocks.DataValueField = "BlockId";
		ddlBlocks.DataBind();
		ddlBlocks.Items.Insert(0, new ListItem("Select Block", "0"));
	}

	protected void fill_students_drop_down(object sender, EventArgs e)
	{
		int blockId = Convert.ToInt32(ddlBlocks.SelectedValue);
		if (blockId != 0)
		{
			string query = "SELECT * FROM Student WHERE BlockId = " + blockId + " AND Schedule != ''";
			ddlStudents.DataSource = load_dropdown_data(query);
			ddlStudents.DataTextField = "name";
			ddlStudents.DataValueField = "StudentId";
			ddlStudents.DataBind();
			ddlStudents.Items.Insert(0, new ListItem("Select Student", "0"));
			ddlStudents.Enabled = true;
		}
		else
		{
			ddlStudents.Items.Clear();
			ddlStudents.Enabled = false;
			manageSchedule.Enabled = false;
		}
	}

	protected DataTable load_dropdown_data(string query)
	{
		cmd = new SqlCommand(query, con);
		da = new SqlDataAdapter(cmd);
		dt = new DataTable();
		da.Fill(dt);
		return dt;
	}

	protected void change_button_status(object sender, EventArgs e)
	{
		int studentId = Convert.ToInt32(ddlStudents.SelectedValue);
		if (studentId != 0)
		{
			manageSchedule.Enabled = true;
		}
		else
		{
			manageSchedule.Enabled = false;
		}
	}

	protected void manage_schedule(object sender, EventArgs e)
	{
		if(ddlStudents.SelectedValue == "0")
		{
			return;
		}
		string query = "UPDATE Student SET Schedule = '' WHERE StudentId = " + ddlStudents.SelectedValue;
		cmd = new SqlCommand(query, con);
		con.Open();
		cmd.ExecuteNonQuery();
		query = "DELETE FROM Session WHERE StudentId = " + ddlStudents.SelectedValue;
		cmd = new SqlCommand(query, con);
		cmd.ExecuteNonQuery();
		con.Close();
		ddlStudents.Items.Remove(ddlStudents.SelectedItem);
	}
}