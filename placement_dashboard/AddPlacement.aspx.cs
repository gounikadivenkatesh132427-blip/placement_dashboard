using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace placement_dashboard
{
    public partial class AddPlacement : System.Web.UI.Page
    {
        string cs = "Data Source=(localdb) \\MSSQLLocalDB;Initial Catalog=PlacementDB;Integrated Security = True;"; 
 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUnplacedStudents();
            }
        }

        private void LoadUnplacedStudents()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @" 
                    SELECT StudentID, 
                    CAST(StudentID AS NVARCHAR(20)) + ' - ' + 
                    COALESCE(NULLIF(StudentName, ''), 'Unnamed Student') 
                    AS StudentDisplay 
                    FROM Students 
                    WHERE IsPlaced = 0 
                    ORDER BY StudentID";

                SqlCommand cmd = new SqlCommand(query, con);

                con.Open();

                ddlStudents.DataSource = cmd.ExecuteReader();
                



                ddlStudents.DataTextField = "StudentDisplay";
                ddlStudents.DataValueField = "StudentID";
                ddlStudents.DataBind();

                ddlStudents.Items.Insert(
                    0, new ListItem("-- Select Student --", ""));
            }
        }

        protected void btnAddPlacement_Click(object sender, EventArgs e)
        {
            long studentID;
            decimal package;

            if (!long.TryParse(ddlStudents.SelectedValue, out studentID) ||
                string.IsNullOrWhiteSpace(txtCompanyName.Text) ||
                string.IsNullOrWhiteSpace(txtJobRole.Text) ||
                !decimal.TryParse(txtPackage.Text, out package) ||
                package <= 0)
            {
                lblMessage.Text = "Please enter valid placement details.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                using (SqlTransaction transaction = con.BeginTransaction())
                {
                    try
                    {
                        // Check whether this student already has a placement 
                        string checkQuery = @" 
                            SELECT COUNT(*) 
                            FROM Placements 
                            WHERE StudentID = @StudentID";

                        using (SqlCommand cmd = new SqlCommand(
                            checkQuery, con, transaction))
                        {
                            cmd.Parameters.AddWithValue("@StudentID", studentID);

                            int count = Convert.ToInt32(cmd.ExecuteScalar());

                            if (count > 0)
                                



                            {
                                transaction.Rollback();

                                lblMessage.Text =
                                    "This student already has a placement.";

                                lblMessage.ForeColor =
                                    System.Drawing.Color.Red;

                                LoadUnplacedStudents();
                                return;
                            }
                        }

                        // Update existing student status 
                        string updateQuery = @" 
                            UPDATE Students 
                            SET IsPlaced = 1 
                            WHERE StudentID = @StudentID 
                            AND IsPlaced = 0";

                        using (SqlCommand cmd = new SqlCommand(
                            updateQuery, con, transaction))
                        {
                            cmd.Parameters.AddWithValue("@StudentID", studentID);

                            int rows = cmd.ExecuteNonQuery();

                            if (rows != 1)
                            {
                                throw new InvalidOperationException(
                                    "Student not found or already placed.");
                            }
                        }

                        // Insert placement details 
                        string insertQuery = @" 
                            INSERT INTO Placements 
                            (StudentID, CompanyName, JobRole, PackageLPA) 
                            VALUES 
                            (@StudentID, @CompanyName, @JobRole, @PackageLPA)";

                        using (SqlCommand cmd = new SqlCommand(
                            insertQuery, con, transaction))
                        {
                            cmd.Parameters.AddWithValue("@StudentID", studentID);
                            cmd.Parameters.AddWithValue(

"@CompanyName", txtCompanyName.Text.Trim());
                            cmd.Parameters.AddWithValue(
                            "@JobRole", txtJobRole.Text.Trim());
                            cmd.Parameters.AddWithValue(
                            "@PackageLPA", package);
                            cmd.ExecuteNonQuery();
                        }
                        transaction.Commit();
                        lblMessage.Text = "Placement added successfully!";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        txtCompanyName.Text = "";
                        txtJobRole.Text = "";
                        txtPackage.Text = "";
                        LoadUnplacedStudents();
                    }
                    catch (Exception)
                    {
                        if (transaction.Connection != null)
                        {
                            transaction.Rollback();
                        }
                        lblMessage.Text =
                        "Unable to add placement. Please check the database.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }
    }
}