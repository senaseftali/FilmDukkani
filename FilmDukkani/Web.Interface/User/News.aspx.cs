using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Web.Interface
{
    public partial class News : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            rssHaberCek();
        }

        private void rssHaberCek()
        {
            string rssFeedUrl = " http://www.star.com.tr/rss/sinema.xml";
            List<HaberCek> feeds = new List<HaberCek>();
            XDocument xDoc = XDocument.Load(rssFeedUrl);
            var items = (from x in xDoc.Descendants("item")
                         select new
                         {
                             title = x.Element("title").Value,
                             link = x.Element("link").Value,
                             pubDate = x.Element("pubDate").Value,
                             description = x.Element("description").Value,
                             length = x.Element("description").Value.Length
                         });

            if (items != null)
            {
                feeds.AddRange(items.Select(i => new HaberCek
                {
                    Title = i.title,
                    Link = i.link,
                    PublishDate = i.pubDate,
                    Description = i.description,
                    Length = i.length
                }));
            }
            CollectionPagerNews.DataSource = feeds; ;
            CollectionPagerNews.BindToControl = lstViewHaber;
            lstViewHaber.DataSource = CollectionPagerNews.DataSourcePaged;         
            //lstViewHaber.DataSource = feeds;
            lstViewHaber.DataBind();  
        }
    }
}