using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace placement_dashboard
{
    public partial class Companies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCompanies();
                LoadPlacements();
            }
        }

        string cs = "Data Source=(localdb) \\MSSQLLocalDB;Initial Catalog=PlacementDB;Integrated Security = True;"; 
 
        private void LoadCompanies()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                



                string query = "SELECT * FROM Placements";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptCompanies.DataSource = dt;
                rptCompanies.DataBind();
            }
        }

        private void LoadPlacements()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM Placements";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                dlPlacements.DataSource = dt;
                dlPlacements.DataBind();
            }
        }
    }
}