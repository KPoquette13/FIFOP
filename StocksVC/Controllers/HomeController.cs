﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Facebook;
using System.Xml;

namespace StocksVC.Controllers
{
    public class HomeController : Controller
    {
        private string accessToken;
        private FacebookClient client;
        private dynamic result;
        private string name;
        private string id;
        private string price;

        public void getUserInfo()
        {
            accessToken = Session["AccessToken"].ToString();
            client = new FacebookClient(accessToken);
            result = client.Get("me", new { fields = "name,id" });
            name = result.name;
            id = result.id;
        }

        public string getId()
        {
            return id;
        }

        public ActionResult AllStocks()
        {
            return View();
        }
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult IndividualStock(String ticker)
        {
            ViewBag.Image = getStockChart(ticker);
            ViewBag.Ticker = ticker;

            return View();
        }

        public void getStockData(String ticker)
        {
            String url = "http://dev.markitondemand.com/Api/v2/Quote/xml?symbol=";
            url += ticker;
            String response = RequestResponse(url);
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.LoadXml(response);

            //Getting Stock Price
            XmlNode lastPrice = xmlDoc.SelectSingleNode("/StockQuote/LastPrice");
            price = lastPrice.InnerText;

            getStockInfo(ticker);
        }

        public String getStockChart(String ticker)
        {
            String time = "6m";
            String type = "l";
            String scale = "on";
            String size = "l";
            String average = "m50, m200";

            String url = "http://" + "chart.finance.yahoo.com/z?s=" + ticker + "&t=" + time + "&q=" + type +
                "&l=" + scale + "&z=" + size + "&p=" + average;

            ViewBag.StockName = ticker;

            getStockData(ticker);

            return url;
        }

       public void getStockInfo(String ticker)
        {            
           if (ticker == "AAPL")
           {
               @ViewBag.NumOwned = "4";
               @ViewBag.Price = "$" + price;
               @ViewBag.Thoughts = "Sell In June.";
               @ViewBag.TotalBought = "7";
               @ViewBag.TotalSold = "3";
           }
           else if (ticker == "MSFT")
           {
               @ViewBag.NumOwned = "8";
               @ViewBag.Price = "$" + price;
               @ViewBag.Thoughts = "Buy More Soon.";
               @ViewBag.TotalBought = "8";
               @ViewBag.TotalSold = "0";
           }
           else if (ticker == "GOOG")
           {                            
               @ViewBag.NumOwned = "10";
               @ViewBag.Price = "$" + price;          
               @ViewBag.Thoughts = "Split Stocks.";
               @ViewBag.TotalBought = "13";
               @ViewBag.TotalSold = "3";
           }
           else if (ticker == "FB")
           {
               @ViewBag.NumOwned = "5";
               @ViewBag.Price = "$" + price;
               @ViewBag.Thoughts = "Buy When Down";
               @ViewBag.TotalBought = "5";
               @ViewBag.TotalSold = "0";
           }
           else if (ticker == "WMT")
           {
               @ViewBag.NumOwned = "2";
               @ViewBag.Price = price;
               @ViewBag.Thoughts = "Sell Soon!";
               @ViewBag.TotalBought = "7";
               @ViewBag.TotalSold = "5";
           }
            
        }
       private string HttpPost(string pUrl, string pPostData)
       {
           HttpWebRequest webRequest = (HttpWebRequest)HttpWebRequest.Create(pUrl);
           webRequest.ContentType = "application/x-www-form-urlencoded";
           webRequest.Method = "POST";
           byte[] bytes = System.Text.Encoding.UTF8.GetBytes(pPostData);
           Stream requestWriter = webRequest.GetRequestStream(); //GetRequestStream
           requestWriter.Write(bytes, 0, bytes.Length);
           requestWriter.Close();

           Stream responseStream = null;
           StreamReader responseReader = null;
           string responseData = "";
           try
           {
               WebResponse webResponse = webRequest.GetResponse();
               responseStream = webResponse.GetResponseStream();
               responseReader = new StreamReader(responseStream);
               responseData = responseReader.ReadToEnd();
           }
           catch (Exception exc)
           {
               throw new Exception("could not post : " + exc.Message);
           }
           finally
           {
               if (responseStream != null)
               {
                   responseStream.Close();
                   responseReader.Close();
               }
           }

           return responseData;
       }
       private string RequestResponse(string pUrl)
       {
           HttpWebRequest webRequest = System.Net.WebRequest.Create(pUrl) as HttpWebRequest;
           webRequest.Method = "GET";
           webRequest.ServicePoint.Expect100Continue = false;
           webRequest.Timeout = 20000;

           Stream responseStream = null;
           StreamReader responseReader = null;
           string responseData = "";
           try
           {
               WebResponse webResponse = webRequest.GetResponse();
               responseStream = webResponse.GetResponseStream();
               responseReader = new StreamReader(responseStream);
               responseData = responseReader.ReadToEnd();
           }
           catch (Exception exc)
           {
               Response.Write("<br /><br />ERROR : " + exc.Message);
           }
           finally
           {
               if (responseStream != null)
               {
                   responseStream.Close();
                   responseReader.Close();
               }
           }

           return responseData;
       }

       private void RetrieveMyFeedsFromFacebook()
       {
           var fb = new FacebookClient(accessToken);
           string details = "";
           try
           {
               fb.GetCompleted +=
               (o, e) =>
               {
                   if (e.Error == null)
                   {
                       var result = (IDictionary<string, object>)e.GetResultData();
                       //Dispatcher.BeginInvoke(() => lbFeeds.ItemsSource = details);
                   }
                   else
                   {
                   }
               };
               fb.GetTaskAsync("/me/feed");
           }
           catch (FacebookApiException ex)
           {
           }
       }
    }
}
