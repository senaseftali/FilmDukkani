using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Library.Compare
{
    public class Tools
    {
        public static List<Filmler> GetComparables(object value) 
        {
            if (value == null) // karşılaştırılacak film yoksa;
            {
                return new List<Filmler>();
            }
            else // karşılaştırılacak film varsa;
            {
                return (List<Filmler>)value;
            }
        }

        public static List<Filmler> AddToCompare(object destinationArea, Filmler addItem) 
        {
            List<Filmler> currentItems = null;

            if (destinationArea == null) // karşılaştırılacak alanım boşsa;
            {
                currentItems = new List<Filmler>();
            }
            else // karşılaştırılacak alanımda film varsa;
            {
                currentItems = (List<Filmler>)destinationArea;
            }
            currentItems.Add(addItem);
            return currentItems;
        }

        public static List<Filmler> RemoveFromCompare(object destinationArea, Filmler removeItem)
        {
            List<Filmler> currentItems = null;

            if (destinationArea == null)
            {
                currentItems = null;
            }
            else
            {
                currentItems = (List<Filmler>)destinationArea;
            }
            currentItems.Remove(removeItem);
            return currentItems;
        }
    }
}
