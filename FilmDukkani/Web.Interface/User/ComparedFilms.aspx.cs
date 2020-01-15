using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.Interface
{
    public partial class ComparedFilms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

            KarsilastirilacakFilmleriDoldur(); // metodu altta ...
        }

        public List<Library.Filmler> currentItems
        {
            set
            {
                ViewState["datas"] = value;
            }
            get
            {
                if (ViewState["datas"] == null)
                {
                    return new List<Library.Filmler>();
                }
                else
                {
                    return (List<Library.Filmler>)ViewState["datas"];
                }
            }
        }
        private void KarsilastirilacakFilmleriDoldur()
        {
            List<Library.Filmler> listemiz = Library.Compare.Tools.GetComparables(Session["myComparable"]);

            gwFilmKarsilastirma.DataSource = listemiz;
            gwFilmKarsilastirma.DataBind();
        }

        Library.OrmFilmDukkaniDBDataContext db = new Library.OrmFilmDukkaniDBDataContext();

        protected void lbtnSecilenleriKaldir_Click(object sender, EventArgs e)
        {
            List<Library.Filmler> currentItems = Library.Compare.Tools.GetComparables(Session["myComparable"]);

            foreach (GridViewRow gw in gwFilmKarsilastirma.Rows)
            {
                CheckBox chk = gw.FindControl("chkCheck") as CheckBox;

                if (chk.Checked == true)
                {
                    int filmId = Convert.ToInt32((gw.FindControl("hfFilmId") as HiddenField).Value);

                    Library.Filmler kaldirilanFilm = currentItems.FirstOrDefault(f => f.FilmID == filmId);

                    currentItems.Remove(kaldirilanFilm);
                }
            }

            Session["myComparable"] = currentItems;

            KarsilastirilacakFilmleriDoldur();
        }


    }
}