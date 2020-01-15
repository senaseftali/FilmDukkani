using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.Interface
{
    public partial class TopRated : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

            FilmFill(); // metodu altta ...
        }

        Library.OrmFilmDukkaniDBDataContext db = new Library.OrmFilmDukkaniDBDataContext();
        private void FilmFill()
        {
            // Tüm ürünler gelsin ...
            var result = from x in db.Filmlers where x.Fiyat >= 20 select x;

            DataList1.DataSource = result;
            //}
            DataList1.DataBind(); // unutmayın !!!
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