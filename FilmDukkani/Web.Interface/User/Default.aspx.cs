using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.Interface
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection baglanti = new SqlConnection(@"Data Source=DESKTOP-6VGIM5M\SQL_2014;Initial Catalog=FilmDukkaniDB;User ID=sa;Password=123456");
            SqlCommand komut = new SqlCommand("SELECT * FROM [Filmler] ", baglanti);
            SqlDataAdapter da = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();
            da.Fill(dt);
            CollectionPager1.DataSource = dt.DefaultView;
            CollectionPager1.BindToControl = DataList1;
            DataList1.DataSource = CollectionPager1.DataSourcePaged;
            DataList1.DataBind();           
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int filmID = Convert.ToInt32(e.CommandArgument.ToString());

            switch (e.CommandName)
            {
                // Detay
                case "details":
                    {
                        Response.Redirect("~/User/FilmDetail.aspx?FilmID=" + filmID.ToString());
                    }
                    break;
            }
        }          
    }
}