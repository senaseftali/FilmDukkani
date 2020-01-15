using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Library.Cart
{
    public class CartFilm  //Film Karşılaştırma ...
    {
        public Filmler SelectedFilm { set; get; }

        public int FilmID 
        {
            get
            {
                return SelectedFilm.FilmID;
            }
        }

        public string FilmAdi 
        { 
            get
            {
                return SelectedFilm.FilmAdi;
            }
        }

        public string Ozet 
        { 
            get
            {
                return SelectedFilm.Ozet;
            }             
        }
        public decimal? Fiyat 
        {
            get 
            {
                return SelectedFilm.Fiyat;
            }
        }

        public string Resim 
        { 
            get
            {
                return SelectedFilm.Resim;
            }
        }

        public int Adet { get; set; }
    }
}
