using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace StocksVC.Controllers
{
    public class HomeController : Controller
    {
        public async Task<ActionResult> Index(FacebookContext context)
        {
            if (ModelState.IsValid)
            {
                var user = await context.Client.GetCurrentUserAsync<StocksVC.Models.User>();
                return View(user);
            }

            return View("Error");
        }

        // This action will handle the redirects from FacebookAuthorizeFilter when
        // the app doesn't have all the required permissions specified in the FacebookAuthorizeAttribute.
        // The path to this action is defined under appSettings (in Web.config) with the key 
        // 'Facebook:AuthorizationRedirectPath'.
        public ActionResult Permissions(StocksVC.Models.FacebookRedirectContext context)
        {
            if (ModelState.IsValid)
            {
                return View(context);
            }

            return View("Error");
        }

        public ActionResult AllStocks()
        {
            return View();
        }

        public ActionResult IndividualStock(String ticker)
        {
            ViewBag.Image = getStockUrl(ticker);
            ViewBag.Ticker = ticker;

            return View();
        }

        public String getStockUrl(String ticker)
        {
            String time = "6m";
            String type = "l";
            String scale = "on";
            String size = "l";
            String average = "m50, m200";

            String url = "http://" + "chart.finance.yahoo.com/z?s=" + ticker + "&t=" + time + "&q=" + type +
                "&l=" + scale + "&z=" + size + "&p=" + average;

            ViewBag.StockName = ticker;

            getStockInfo(ticker);

            return url;
        }

       public void getStockInfo(String ticker)
        {
           if (ticker == "AAPL")
           {
               @ViewBag.NumOwned = "4";
               @ViewBag.Price = "$113.70";
               @ViewBag.Thoughts = "Sell In June.";
               @ViewBag.TotalBought = "7";
               @ViewBag.TotalSold = "3";
           }
           else if (ticker == "MSFT")
           {
               @ViewBag.NumOwned = "8";
               @ViewBag.Price = "$86.90";
               @ViewBag.Thoughts = "Buy More Soon.";
               @ViewBag.TotalBought = "8";
               @ViewBag.TotalSold = "0";
           }
           else if (ticker == "GOOG")
           {                            
               @ViewBag.NumOwned = "10";
               @ViewBag.Price = "$500.00";          
               @ViewBag.Thoughts = "Split Stocks.";
               @ViewBag.TotalBought = "13";
               @ViewBag.TotalSold = "3";
           }
           else if (ticker == "FB")
           {
               @ViewBag.NumOwned = "5"; 
               @ViewBag.Price = "$60.70";
               @ViewBag.Thoughts = "Buy When Down";
               @ViewBag.TotalBought = "5";
               @ViewBag.TotalSold = "0";
           }
           else if (ticker == "WMT")
           {
               @ViewBag.NumOwned = "2";
               @ViewBag.Price = "$20.70";
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
    }
}
