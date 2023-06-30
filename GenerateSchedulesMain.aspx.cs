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

public partial class GenerateSchedulesMain : Page
{
	SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
	SqlCommand cmd;
	SqlDataAdapter da;
	DataTable dt;
	static string[] schedules;
	static bool[] assigned;
	static int schedulesIndex = 0;
	static int blockId;
	static bool isGeneratingForAll;
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			load_data();
		}

		SqlDataSource ds = new SqlDataSource();
        ds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        ds.SelectCommand = $"Select * from Employee where EmployeeId='{Session["EmployeeId"].ToString()}'";
        DataView dv = (DataView)ds.Select(DataSourceSelectArguments.Empty);
        Image1.ImageUrl = "assets/img/" + dv.Table.Rows[0]["Photo"].ToString();
    }

	protected void load_data()
	{
		blockId = Convert.ToInt32(Request.QueryString["block"]);
		isGeneratingForAll = Convert.ToBoolean(Request.QueryString["all"]);
		fill_students_drop_down();
		apply_genetic_algorithm();
	}

	protected void fill_students_drop_down()
	{
		// getting block id from url and converting it to int
		ddlStudents.DataSource = load_dropdown_data();
		ddlStudents.DataTextField = "name";
		ddlStudents.DataValueField = "StudentId";
		ddlStudents.DataBind();
	}

	protected DataTable load_dropdown_data()
	{
		string query = "SELECT name, StudentId FROM Student WHERE BlockId = " + blockId + " AND (Schedule IS NULL OR Schedule = '')";
		cmd = new SqlCommand(query, con);
		da = new SqlDataAdapter(cmd);
		dt = new DataTable();
		da.Fill(dt);
		return dt;
	}

	protected void apply_genetic_algorithm()
	{
		// getting all flag from the url
		int countOfScheduleToGenerate = 1;
		if (isGeneratingForAll)
		{
			countOfScheduleToGenerate = ddlStudents.Items.Count;
		}
		schedules = new string[countOfScheduleToGenerate];
		assigned = new bool[countOfScheduleToGenerate];
		for (int i = 0; i < countOfScheduleToGenerate; i++)
		{
			GeneticAlgorithm ga = new GeneticAlgorithm(blockId, schedules);
			ga.run();
			string bestSchedule = ga.getBestIndividual().ToString();
			schedules[i] = bestSchedule;
			assigned[i] = false;
		}
	}

	protected void assign_schedule(object sender, EventArgs e)
	{
		if (assigned[schedulesIndex])
		{
			return;
		}
		string studentID = ddlStudents.SelectedValue;
		string query = "UPDATE Student SET Schedule = '" + schedules[schedulesIndex] + "' WHERE StudentId = " + studentID;
		cmd = new SqlCommand(query, con);
		con.Open();
		int result = cmd.ExecuteNonQuery();
		con.Close();
		assigned[schedulesIndex] = true;
		// removing assigned student from dropdown
		add_schedule_to_session_table();
		ddlStudents.Items.Remove(ddlStudents.SelectedItem);
		assignedLabel.Text = "Schedule Assigned";
		assignedLabel.Visible = true;
		closeAssignedLabel.Visible = true;
	}

	protected void closeAssignedLabel_Click(object sender, EventArgs e)
	{
		assignedLabel.Visible = false;
		closeAssignedLabel.Visible = false;
	}

	protected void add_schedule_to_session_table()
	{
		string studentId = ddlStudents.SelectedValue;
		con.Open();

		string[] subjectDict = new string[6];
		subjectDict[0] = "";
		subjectDict[1] = "SPED";
		subjectDict[2] = "ABA";
		subjectDict[3] = "SLP";
		subjectDict[4] = "OT";
		subjectDict[5] = "PSYCH";

		string[] days = new string[5];
		days[0] = "Sunday";
		days[1] = "Monday";
		days[2] = "Tuesday";
		days[3] = "Wednesday";
		days[4] = "Thursday";

		string[] times = new string[8];
		times[0] = "8-9";
		times[1] = "9-10";
		times[2] = "10-11";
		times[3] = "11-12";
		times[4] = "1-2";
		times[5] = "2-3";
		times[6] = "3-4";
		times[7] = "4-5";

		string schedule = schedules[schedulesIndex];

		int i = 0;
		if (!schedule[22].Equals('0'))
		{
			i = 4;
		}

		for (int j = 0; j < days.Length; j++)
		{
			string query1, query2, query3, query4;
			if (schedule[23].Equals('0'))
			{
				query1 = $"INSERT INTO Session VALUES ('{subjectDict[1]}', '{days[j]}', '{times[i]}', {schedule[11]}, {studentId})";
				query2 = $"INSERT INTO Session VALUES ('{subjectDict[1]}', '{days[j]}', '{times[i + 1]}', {schedule[11]}, {studentId})";
				query3 = $"INSERT INTO Session VALUES ('{subjectDict[Convert.ToInt32(schedule[2 * j + 1].ToString())]}', '{days[j]}', '{times[i + 2]}', {schedule[2 * j + 1 + 11]}, {studentId})";
				query4 = $"INSERT INTO Session VALUES ('{subjectDict[Convert.ToInt32(schedule[2 * j + 2].ToString())]}', '{days[j]}', '{times[i + 3]}', {schedule[2 * j + 2 + 11]}, {studentId})";
			}
			else
			{
				query1 = $"INSERT INTO Session VALUES ('{subjectDict[Convert.ToInt32(schedule[2 * j + 1].ToString())]}', '{days[j]}', '{times[i]}', {schedule[2 * j + 1 + 11]}, {studentId})";
				query2 = $"INSERT INTO Session VALUES ('{subjectDict[Convert.ToInt32(schedule[2 * j + 2].ToString())]}', '{days[j]}', '{times[i + 1]}', {schedule[2 * j + 2 + 11]}, {studentId})";
				query3 = $"INSERT INTO Session VALUES ('{subjectDict[1]}', '{days[j]}', '{times[i + 2]}', {schedule[11]}, {studentId})";
				query4 = $"INSERT INTO Session VALUES ('{subjectDict[1]}', '{days[j]}', '{times[i + 3]}', {schedule[11]}, {studentId})";
			}
			cmd = new SqlCommand(query1, con);
			cmd.ExecuteNonQuery();
			cmd = new SqlCommand(query2, con);
			cmd.ExecuteNonQuery();
			cmd = new SqlCommand(query3, con);
			cmd.ExecuteNonQuery();
			cmd = new SqlCommand(query4, con);
			cmd.ExecuteNonQuery();
		}
		con.Close();
	}


	[WebMethod]
	public static string get_schedule(int item)
	{
		schedulesIndex += item;
		if (schedulesIndex >= schedules.Length)
		{
			schedulesIndex = 0;
		}
		else if (schedulesIndex < 0)
		{
			schedulesIndex = schedules.Length - 1;
		}
		if (assigned[schedulesIndex])
		{
			// going to next available
			for (int i = schedulesIndex; i < schedules.Length; i++)
			{
				if (!assigned[i])
				{
					schedulesIndex = i;
					break;
				}
			}
		}
		return schedules[schedulesIndex];
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
}

public class GeneticAlgorithm
{
	// define the population size
	public const int POPULATION_SIZE = 100;
	// define the number of generations
	public const int MAX_GENERATIONS = 100;
	// define the mutation rate
	public const double MUTATION_RATE = 0.05;
	// define the tournament size
	public const int TOURNAMENT_SELECTION_SIZE = 10;
	// define the number of genes
	int number_of_genes = 24;
	// define the population
	Individual[] population = null;
	// define the random number generator
	Random random = new Random();
	// define the array to hold instructor ids
	public int[] instructor_ids;
	public string[] instructor_spec;
	public string[] all_schedules;
	public string[] all_subjects;
	Individual bestIndividual;
	SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
	SqlCommand cmd;
	SqlDataAdapter da;
	DataTable dt;

	int BlockID;

	// define the constructor
	public GeneticAlgorithm(int BlockId, string[] schedules)
	{
		this.BlockID = BlockId;
		this.population = new Individual[POPULATION_SIZE];
		getInstructorIdSpec();
		getStudentSchedules();
		addSchedulesToAllSchedules(schedules);
		getSubjects();
		this.bestIndividual = new Individual(number_of_genes);
	}

	// define the method to get instructor ids
	public void getInstructorIdSpec()
	{
		string query = "SELECT EmployeeId, Specialization FROM Employee WHERE BlockId = " + BlockID + " AND Specialization NOT LIKE 'Administration'";
		cmd = new SqlCommand(query, con);
		da = new SqlDataAdapter(cmd);
		dt = new DataTable();
		da.Fill(dt);
		this.instructor_ids = new int[dt.Rows.Count];
		this.instructor_spec = new string[dt.Rows.Count];
		for (int i = 0; i < dt.Rows.Count; i++)
		{
			instructor_ids[i] = Convert.ToInt32(dt.Rows[i]["EmployeeId"]);
			instructor_spec[i] = dt.Rows[i]["Specialization"].ToString();
		}
	}

	// define the method to get student schedules
	public void getStudentSchedules()
	{
		string query = "SELECT Schedule FROM Student WHERE BlockId = " + BlockID;
		cmd = new SqlCommand(query, con);
		da = new SqlDataAdapter(cmd);
		dt = new DataTable();
		da.Fill(dt);
		this.all_schedules = new string[dt.Rows.Count];
		for (int i = 0; i < dt.Rows.Count; i++)
		{
			this.all_schedules[i] = dt.Rows[i]["Schedule"].ToString();
		}
	}

	public void addSchedulesToAllSchedules(string[] schedules)
	{
		string[] temp = new string[this.all_schedules.Length + schedules.Length];
		for (int i = 0; i < this.all_schedules.Length; i++)
		{
			temp[i] = this.all_schedules[i];
		}
		for (int i = 0; i < schedules.Length; i++)
		{
			temp[i + this.all_schedules.Length] = schedules[i];
		}
		this.all_schedules = temp;
	}

	// define the method to get subjects
	public void getSubjects()
	{
		this.all_subjects = new string[6];
		this.all_subjects[0] = "";
		this.all_subjects[1] = "Special Education";
		this.all_subjects[2] = "Applied Behavior Analysis";
		this.all_subjects[3] = "Speech-Language Pathology";
		this.all_subjects[4] = "Occupational Therapy";
		this.all_subjects[5] = "Psychology";
	}

	public Individual getBestIndividual()
	{
		return this.bestIndividual;
	}

	// define the method to run the genetic algorithm
	public void run()
	{
		// initialize the population
		this.InitializePopulation();
		// keep track of current generation
		int generation = 1;
		// start evolution loop
		while (generation <= MAX_GENERATIONS)
		{
			// evaluate population
			this.EvaluatePopulation();
			// generate new population
			this.GenerateNewPopulation();
			// increment the current generation
			generation++;
		}
		Console.WriteLine("Stopped after " + MAX_GENERATIONS + " generations.");
	}
	// define the method to initialize the population
	public void InitializePopulation()
	{
		for (int i = 0; i < POPULATION_SIZE; i++)
		{
			Individual individual = new Individual(number_of_genes);
			InitializeIndividual(individual);
			population[i] = individual;
		}
	}
	// define the method to initialize an individual
	public void InitializeIndividual(Individual individual)
	{
		for (int gene = 0; gene < 11; gene++)
		{
			individual.genes[gene] = random.Next(1, 6);
		}
		for (int gene = 11; gene < 22; gene++)
		{
			individual.genes[gene] = instructor_ids[random.Next(0, instructor_ids.Length)];
		}
		for (int gene = 22; gene < 24; gene++)
		{
			individual.genes[gene] = random.Next(0, 2);
		}
	}

	// define the method to evaluate the population
	public void EvaluatePopulation()
	{
		Individual fittest = population[0];
		// loop over current population by fitness
		for (int i = 0; i < POPULATION_SIZE; i++)
		{
			population[i].fitness = CalculateFitness(population[i]);
			// check if current individual is better than the best
			if (population[i].fitness > fittest.fitness)
			{
				fittest = population[i];
			}
		}
		if (fittest.fitness > bestIndividual.fitness)
		{
			bestIndividual = fittest.clone();
		}
	}

	// define the method to calculate the fitness of an individual
	public double CalculateFitness(Individual individual)
	{
		double fitness = 0;
		if (individual.genes[0] != 1)
		{
			fitness -= 1000;
		}
		else
		{
			fitness += 10;
		}
		int[] subjectsCount = new int[6];
		subjectsCount[0] = 0;
		subjectsCount[1] = 1;
		subjectsCount[2] = 5;
		subjectsCount[3] = 2;
		subjectsCount[4] = 2;
		subjectsCount[5] = 1;

		for (int i = 0; i < 11; i++)
		{
			subjectsCount[individual.genes[i]]--;
		}
		int count = 0;
		for (int i = 0; i < 6; i++)
		{
			if (subjectsCount[i] != 0)
			{
				count--;
			}
			else
			{
				count++;
			}
		}
		fitness += count * 100;
		// checking if instructor specializes in subject
		for (int i = 0; i < 11; i++)
		{
			string ins_spec = instructor_spec[Array.IndexOf(instructor_ids, individual.genes[i + 11])];
			if (ins_spec != all_subjects[individual.genes[i]])
			{
				fitness -= 100;
			}
		}
		count = 0;
		// looping over other schedules
		for (int i = 0; i < all_schedules.Length; i++)
		{
			if (all_schedules[i] != null || all_schedules[i] != "")
			{
				if (all_schedules[i] == individual.ToString())
				{
					count--;
				}
				else
				{
					count++;
				}
			}
		}
		fitness += count * 100;
		return fitness;
	}

	// define the method to generate the new population
	public void GenerateNewPopulation()
	{
		// define the new population
		Individual[] newPopulation = new Individual[POPULATION_SIZE];
		// loop over the new population size and create individuals with
		// crossover
		for (int populationIndex = 0; populationIndex < newPopulation.Length; populationIndex++)
		{
			// define the parent1
			Individual parent1 = this.TournamentSelection();
			// define the parent2
			Individual parent2 = this.TournamentSelection();
			// define the child
			Individual child = this.Crossover(parent1, parent2);
			// mutate child
			this.Mutate(child, MUTATION_RATE);
			// add child to new population
			newPopulation[populationIndex] = child;
		}
		// replace old population with new population
		this.population = newPopulation;
	}
	// define the method to select individuals for crossover
	public Individual TournamentSelection()
	{
		// define the tournament population
		Individual[] tournament = new Individual[TOURNAMENT_SELECTION_SIZE];
		// for each place in the tournament get a random individual
		for (int i = 0; i < TOURNAMENT_SELECTION_SIZE; i++)
		{
			int randomId = random.Next(0, POPULATION_SIZE);
			tournament[i] = population[randomId];
		}
		// get the fittest
		Individual fittest = tournament[0];
		for (int i = 0; i < TOURNAMENT_SELECTION_SIZE; i++)
		{
			if (tournament[i].fitness > fittest.fitness)
			{
				fittest = tournament[i];
			}
		}
		return fittest;
	}

	// define the method to perform crossover
	public Individual Crossover(Individual parent1, Individual parent2)
	{
		// create new child
		Individual child = new Individual(this.number_of_genes);
		// get the midpoint
		int midpoint = random.Next(0, 11);
		// loop over genes
		for (int i = 0; i < 11; i++)
		{
			// use half of parent1's genes and half of parent2's genes
			if (i < midpoint)
			{
				child.genes[i] = parent1.genes[i];
			}
			else
			{
				child.genes[i] = parent2.genes[i];
			}
		}
		int midpoint2 = random.Next(11, 22);
		for (int i = 11; i < 22; i++)
		{
			// use half of parent1's genes and half of parent2's genes
			if (i < midpoint2)
			{
				child.genes[i] = parent1.genes[i];
			}
			else
			{
				child.genes[i] = parent2.genes[i];
			}
		}
		int midpoint3 = random.Next(22, 24);
		for (int i = 22; i < 24; i++)
		{
			// use half of parent1's genes and half of parent2's genes
			if (i < midpoint3)
			{
				child.genes[i] = parent1.genes[i];
			}
			else
			{
				child.genes[i] = parent2.genes[i];
			}
		}
		return child;
	}

	// define the method to mutate an individual
	public void Mutate(Individual individual, double mutationRate)
	{
		// loop over genes
		for (int i = 0; i < 11; i++)
		{
			if (random.NextDouble() < mutationRate)
			{
				// create random gene
				int gene = random.Next(1, 6);
				individual.genes[i] = gene;
			}
		}
		for (int i = 11; i < 22; i++)
		{
			if (random.NextDouble() < mutationRate)
			{
				// create random gene
				int gene = instructor_ids[random.Next(0, instructor_ids.Length)];
				individual.genes[i] = gene;
			}
		}
		for (int i = 22; i < 24; i++)
		{
			if (random.NextDouble() < mutationRate)
			{
				// create random gene
				int gene = random.Next(0, 2);
				individual.genes[i] = gene;
			}
		}
	}
}
public class Individual
{
	// define the number of genes
	int number_of_genes;
	// define the genes
	public int[] genes;
	// define the fitness
	public double fitness;
	// define the constructor
	public Individual(int number_of_genes)
	{
		this.number_of_genes = number_of_genes;
		this.genes = new int[number_of_genes];
		this.fitness = 0;
	}
	// define the method to convert the individual to string
	public override string ToString()
	{
		string geneString = "";
		for (int i = 0; i < number_of_genes; i++)
		{
			geneString += genes[i];
		}
		return geneString;
	}
	public Individual clone()
	{
		Individual clone = new Individual(this.number_of_genes);
		for (int i = 0; i < this.number_of_genes; i++)
		{
			clone.genes[i] = this.genes[i];
		}
		clone.fitness = this.fitness;
		return clone;
	}
}