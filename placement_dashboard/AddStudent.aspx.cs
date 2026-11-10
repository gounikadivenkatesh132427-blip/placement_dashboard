
using System;
using System.Data.SqlClient;

namespace placement_dashboard
{
    public partial class AddStudent : System.Web.UI.Page
    {
        string cs = "Data Source=(localdb) \\MSSQLLocalDB;" +
            "" +"Initial Catalog=PlacementDB;Integrated Security = True;"; 
 
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddStudent_Click(object sender, EventArgs e)
        {
            long studentID;

            if (!long.TryParse(txtStudentID.Text, out studentID) ||
                string.IsNullOrWhiteSpace(txtStudentName.Text) ||
                string.IsNullOrWhiteSpace(txtDepartment.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                lblMessage.Text = "Please fill all fields correctly.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }
           
using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @" 
INSERT INTO Students 
(StudentID, StudentName
, Department, Email, IsPlaced) 
VALUES 
(@StudentID, @StudentName, @Department, @Email, 0)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@StudentID", studentID);
                    cmd.Parameters.AddWithValue("@StudentName",
                    txtStudentName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Department",
                    txtDepartment.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                        lblMessage.Text = "Student registered successfully!";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        txtStudentID.Text = "";
                        txtStudentName.Text = "";
                        txtDepartment.Text = "";
                        txtEmail.Text = "";
                    }
                    catch (SqlException ex)
                    {
                        if (ex.Number == 2627 || ex.Number == 2601)
                        {
                            lblMessage.Text = "This Student ID already exists.";
                        }
                        else
                        {
                            lblMessage.Text = "Database error: " + ex.Message;
                        }
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }
 

    }
}