using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.Interface
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

            if (string.IsNullOrEmpty(Request.QueryString["AranacakDeger"]) == false)
            {
                // alttaki Arama metoduma gider ve eğer aranacak değer -> ürün veya kategoriyle eşleşmişse o ürünler getirilir ...
                Arama(Request.QueryString["AranacakDeger"]);
            }
        }

        private void Arama(string parameter)
        {
            string aranacakDeger = parameter.Replace("-", "").Replace("<", "").Replace("/", "");

            Library.OrmFilmDukkaniDBDataContext db = new Library.OrmFilmDukkaniDBDataContext();

            var result = from x in db.Filmlers where x.FilmAdi.Contains(aranacakDeger) == true || x.Kategoriler.KategoriAdi.Contains(aranacakDeger) == true select x;

            DataList1.DataSource = result;
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