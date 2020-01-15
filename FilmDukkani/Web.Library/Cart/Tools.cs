using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Library.Cart
{
    public class Tools
    {
        public static List<CartFilm> GetAllCartFilm(object value) 
        {
            if (value == null) // sepette seçili film yoksa
            {
                return new List<CartFilm>();
            }
            else // sepette seçili film varsa;
            {
                return (List<CartFilm>)value;
            }
        }

        public static List<CartFilm> AddItem(CartFilm newItem, object value)
        {
            List<CartFilm> currentItems = GetAllCartFilm(value);

            currentItems.Add(newItem);

            return currentItems;
        }

        public static List<CartFilm> RemoveItem(CartFilm newItem, object value) 
        {
            List<CartFilm> currentItems = GetAllCartFilm(value);

            currentItems.Remove(newItem);

            return currentItems;
        }

        public static int? TotalFilmCount(object value) 
        {
            List<CartFilm> currentItems = GetAllCartFilm(value);

            int? result = null;

            foreach (CartFilm cur in currentItems)
            {
                result += (cur.Adet); //adet olayı
            }

            return result;
        }

        public static decimal? TotalFilmFiyat(object value)
        {
            List<CartFilm> currentItems = GetAllCartFilm(value);

            decimal? result = null;

            foreach (CartFilm cur in currentItems)
            {
                result += (cur.Adet * cur.SelectedFilm.Fiyat); //adet * fiyat olayı...
            }

            return result;
        }
    }
}
