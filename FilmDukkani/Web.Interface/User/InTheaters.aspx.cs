using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Web.Interface
{
    public partial class InTheaters : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            rssVizyonCek();
        }

        private void rssVizyonCek()
        {
            string rssFeedUrl = "http://www.zensinema.com/rss/vizyondakiler/7.xml";
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
            CollectionPagerInTheaters.DataSource = feeds; ;
            CollectionPagerInTheaters.BindToControl = lstViewVizyon;
            lstViewVizyon.DataSource = CollectionPagerInTheaters.DataSourcePaged;
            lstViewVizyon.DataBind(); 
            //lstViewVizyon.DataSource = feeds;
            //lstViewVizyon.DataBind();  
        }
    }
}