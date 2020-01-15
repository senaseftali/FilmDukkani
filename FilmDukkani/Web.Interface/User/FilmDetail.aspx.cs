using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.Interface
{
    public partial class FilmDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;      

            UrunBilgisiAl();
            
            RastgeleBenzerUrunGetir();
        }

       
        Library.OrmFilmDukkaniDBDataContext db = new Library.OrmFilmDukkaniDBDataContext();

        public Library.Filmler SelectedFilm
        {
            set;
            get;
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int filmId = Convert.ToInt32(e.CommandArgument.ToString());

            switch (e.CommandName)
            {           
                // Detay
                case "details":
                    {
                        Response.Redirect("~/User/FilmDetail.aspx?FilmID=" + filmId.ToString());
                    }
                    break;
            }
        }


        public string stokDurumu = "";
        public string kargoFiyati = "";

        private void UrunBilgisiAl()
        {
            if (string.IsNullOrEmpty(Request.QueryString["FilmID"]) == true)
            {
                Response.Redirect("Default.aspx");
            }

            // Id'yi kaybolmasın diye bir yerde tutalım ... bunun için de Design kısmına alta attığım HiddenField'i kullanacağım ...
            hfFilmId.Value = Request.QueryString["FilmID"];

            int id = Convert.ToInt32(Request.QueryString["FilmID"]);

            SelectedFilm = db.Filmlers.FirstOrDefault(x => x.FilmID == id);

            // -----------------------------------------------
            if (SelectedFilm.StokMiktari > 0) // stokta ürün varsa;
            {
                stokDurumu = "Ürün Mevcuttur";
            }
            // istenirse son 5 ürün vb. acele edin vb. else if ile eklenebilir...
            else // ürün bitmişse;
            {
                stokDurumu = "Tükendi !!!"; // "Ürün Mevcut Değildir !!!"
            }
            // -----------------------------------------------

            if (SelectedFilm.Fiyat > 100) // 100TL üzeri Kargo Bedava olsun ...
            {
                kargoFiyati = "Kargo Ücretsizdir ...";
            }
            else
            {
                kargoFiyati = "Kargo Müşteriye Aittir !!!";
            }
        }

        private void RastgeleBenzerUrunGetir()
        {
            int? kategoriID = SelectedFilm.KategoriID;

            db = new Library.OrmFilmDukkaniDBDataContext();

            var result = from x in db.Filmlers where x.KategoriID == kategoriID select x;

            DataList1.DataSource = result.Take(3).ToList();
            // DataList'ime çoklu veriden sadece 3 adeti getirilecek ...
            DataList1.DataBind();
        }

        protected void lbtnSepeteEkle_Click(object sender, EventArgs e)
        {    
            db = new Library.OrmFilmDukkaniDBDataContext();

            Library.Filmler selectedFilm = db.Filmlers.FirstOrDefault(f => f.FilmID == Convert.ToInt32(hfFilmId.Value));

            List<Library.Cart.CartFilm> currentItemsEnd = Library.Cart.Tools.GetAllCartFilm(Session["myCart"]);

            currentItemsEnd.Add(new Library.Cart.CartFilm() 
            {
                Adet = 1,
                SelectedFilm = (Library.Filmler)selectedFilm
            });

            SelectedFilm = selectedFilm;
            Session["myCart"] = currentItemsEnd;
        }

        protected void lbtnUrunKarsilastir_Click(object sender, EventArgs e)
        {
            db = new Library.OrmFilmDukkaniDBDataContext();

            Library.Filmler selectedFilm = db.Filmlers.FirstOrDefault(f => f.FilmID == Convert.ToInt32(hfFilmId.Value));

            List<Library.Filmler> cartItemsEnd = Library.Compare.Tools.AddToCompare(Session["myComparable"], selectedFilm);

            SelectedFilm = selectedFilm;
            Session["myComparable"] = cartItemsEnd;
        }

        protected void lbtnFragman_Click(object sender, EventArgs e)
        {
            db = new Library.OrmFilmDukkaniDBDataContext();

            Library.Filmler selectedFilm = db.Filmlers.FirstOrDefault(f => f.FilmID == Convert.ToInt32(hfFilmId.Value));

            if (selectedFilm.Fragman != null)
            {
                Response.Redirect(selectedFilm.Fragman);
            }
            else
            {
                Response.Redirect("~//User/FilmDetail.aspx?FilmID=" + selectedFilm.FilmID.ToString());
            }
        }    
    }
}