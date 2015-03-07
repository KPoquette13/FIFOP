using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StocksVC.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
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
    }
}
