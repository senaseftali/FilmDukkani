using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.Interface
{
    public partial class Films : System.Web.UI.Page
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
            if (string.IsNullOrEmpty(Request.QueryString["KategoriID"]) != true)
            {
                // CategoryId'si seçili olan filmleri getirir -> mesela CategoryId = 1 (korku) olan filmleri gelir ...
                var result = from x in db.Filmlers
                             where x.KategoriID == Convert.ToInt32(Request.QueryString["KategoriID"])
                             select x;

                DataList1.DataSource = result;
            }
            else
            {
                // CategoryId'si yoksa -> Tüm ürünler gelsin ...
                var result = from x in db.Filmlers select x;

                DataList1.DataSource = result;
            }
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