using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.Interface
{
    public partial class MyCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

            sepetiDoldur(); // metodu altta ...
        }

        public decimal? TotalPrice { get; set; }

        private void sepetiDoldur()
        {
            List<Library.Cart.CartFilm> listemiz = (List<Library.Cart.CartFilm>)Session["myCart"];

            if (listemiz != null)
            {
                rptMyCart.DataSource = listemiz;
                rptMyCart.DataBind();

                decimal? total = 0;

                foreach (var li in listemiz)
                {
                    total += (li.Adet * li.Fiyat);
                }
                this.TotalPrice = total;
            }
        }

        Library.OrmFilmDukkaniDBDataContext db = new Library.OrmFilmDukkaniDBDataContext();

        protected void rptMyCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                // Sepete Ekle
                case "addToCart":
                    {
                        int filmid = Convert.ToInt32(e.CommandArgument.ToString());

                        List<Library.Cart.CartFilm> currentItems = Library.Cart.Tools.GetAllCartFilm(Session["myCart"]);

                        Library.Filmler selected = db.Filmlers.FirstOrDefault(f => f.FilmID == filmid);

                        currentItems.Add(new Library.Cart.CartFilm()
                        {
                            Adet = 1,
                            SelectedFilm = (Library.Filmler)selected
                        });

                        Session["myCart"] = currentItems;
                    }
                    break;
            }
        }

        protected void btnSecilenleriKaldir_Click(object sender, EventArgs e)
        {
            List<Library.Cart.CartFilm> listemiz = (List<Library.Cart.CartFilm>)Session["myCart"];

            if (listemiz != null)
            {
                List<Library.Cart.CartFilm> kaldirilacaklar = new List<Library.Cart.CartFilm>();

                foreach (RepeaterItem rptItem in rptMyCart.Items)
                {
                    CheckBox chk = rptItem.FindControl("chkCheck") as CheckBox;

                    if (chk.Checked) // veya == true
                    {
                        HiddenField hf = rptItem.FindControl("hfFilmId") as HiddenField;

                        if (string.IsNullOrEmpty(hf.Value) == false)
                        {
                            int id = Convert.ToInt32(hf.Value);
                            foreach (var film in listemiz)
                            {
                                if (film.FilmID == id)
                                {
                                    kaldirilacaklar.Add(film);
                                }
                            }
                        }
                    }
                }

                foreach (var silinen in kaldirilacaklar)
                {
                    listemiz.Remove(silinen);
                }
                Session["myCart"] = listemiz;
                // ------------------------------------
                sepetiDoldur();
            }
        }
    }
}