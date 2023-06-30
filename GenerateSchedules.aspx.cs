using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for GenerateSchedules
/// </summary>
public partial class GenerateSchedules : Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			loadBlocksDropDown();
		}

		SqlDataSource ds = new SqlDataSource();
		ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
		ds.SelectCommand = $"Select * from Employee where EmployeeId='{Session["EmployeeId"].ToString()}'";
		DataView dv = (DataView)ds.Select(DataSourceSelectArguments.Empty);
		Image1.ImageUrl = "assets/img/" + dv.Table.Rows[0]["Photo"].ToString();
	}

	protected void loadBlocksDropDown()
	{
		SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		SqlCommand cmd = new SqlCommand("SELECT * FROM TeamBlock", con);
		SqlDataAdapter da = new SqlDataAdapter(cmd);
		DataTable dt = new DataTable();
		da.Fill(dt);
		ddlBlocks.DataSource = dt;
		ddlBlocks.DataTextField = "BlockName";
		ddlBlocks.DataValueField = "BlockId";
		ddlBlocks.DataBind();
		ddlBlocks.Items.Insert(0, new ListItem("Select a Block", "0"));
	}

	protected void redirectToSchedule(object sender, EventArgs e)
	{
		int selectedBlock = Convert.ToInt32(ddlBlocks.SelectedValue);
		if (selectedBlock != 0)
		{
			bool generateForAll = generateAllSchedulesCheck.Checked;
			if (generateForAll)
			{
				Response.Redirect("GenerateSchedulesMain.aspx?block=" + selectedBlock + "&all=true");
			}
			else
			{
				Response.Redirect("GenerateSchedulesMain.aspx?block=" + selectedBlock + "&all=false");
			}
		}
		else
		{
			errorLabel.Visible = true;
		}
	}
}