using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Spatial;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using StocksVC.Models;

namespace StocksVC.Controllers
{
    
    public class StocksController : ApiController
    {

        private StocksDBEntities db = new StocksDBEntities();

        //api/stocks/postbuy
        public HttpResponseMessage PostBuy(StockInfo stockInfo)
        {
                StockInfo st = db.StockInfos.Where(x => x.StockName == stockInfo.StockName).FirstOrDefault();
                db.StockInfos.Where(x => x.StockName == stockInfo.StockName).FirstOrDefault().TotalBought = st.TotalBought + stockInfo.TotalBought;
                db.StockInfos.Where(x => x.StockName == stockInfo.StockName).FirstOrDefault().Thoughts = stockInfo.Thoughts;
                db.SaveChanges();

                return Request.CreateResponse(HttpStatusCode.OK);

        }


        //api/stocks/postsell
        public HttpResponseMessage PostSell(StockInfo stockInfo)
        {
            StockInfo st = db.StockInfos.Where(x => x.StockName == stockInfo.StockName).FirstOrDefault();
            db.StockInfos.Where(x => x.StockName == stockInfo.StockName).FirstOrDefault().TotalSold = st.TotalSold + stockInfo.TotalSold;
            db.SaveChanges();

            return Request.CreateResponse(HttpStatusCode.OK);
        }
    }
}
