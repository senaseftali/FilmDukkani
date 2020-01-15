using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;
using Web.Library;

namespace Web.Interface
{
    public partial class Genel : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            rssHaberCek();

            rssRoportajCek();
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
                }).Take(3));
            }
            rptHaber.DataSource = feeds;
            rptHaber.DataBind();
        }


        private void rssRoportajCek()
        {
            string rssFeedUrl = "http://www.zensinema.com/rss/roportajlar/157.xml";
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
                }).Take(3));
            }
            rptRoportaj.DataSource = feeds;
            rptRoportaj.DataBind();
        }

        protected void imgSearch_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/User/Search.aspx?AranacakDeger=" + txtSearch.Text);
        }


        public Library.Calisanlar SelectedCalisan
        {
            set;
            get;
        }

        Library.OrmFilmDukkaniDBDataContext db = new Library.OrmFilmDukkaniDBDataContext();
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            try
            {
                Library.Calisanlar selectedcalisan = db.Calisanlars.FirstOrDefault(f => f.Email == UserName.Text && f.Sifre == Password.Text);
                SelectedCalisan = selectedcalisan;

                if (SelectedCalisan.Email != null && SelectedCalisan.Sifre != null)
                {                  
                     string kullanici = "Hoşgeldin " + SelectedCalisan.CalisanAdi + " " + SelectedCalisan.CalisanSoyadi;
                     Session["Kullanici"] = kullanici;                   
                     //lblKullaniciAdi.Text = Session["Kullanici"].ToString();
                }            
            }
            catch (Exception)
            {
               
            }
            
        }

    }
}