using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace StocksVC.Controllers
{
    public class StockHandler : IHttpHandler
    {
        /// <summary>
        /// You will need to configure this handler in the Web.config file of your 
        /// web and register it with IIS before being able to use it. For more information
        /// see the following link: http://go.microsoft.com/?linkid=8101007
        /// </summary>
        #region IHttpHandler Members

        public bool IsReusable
        {
            // Return false in case your Managed Handler cannot be reused for another request.
            // Usually this would be false in case you have some state information preserved per request.
            get { return true; }
        }

        public void ProcessRequest(HttpContext context)
        {
            //write your handler implementation here.
        }

        #endregion

        private string mySqlConnectionString = "server=StocksDB;database=StocksDB;User ID=fifop;Password=fifop;Trusted_Connection=True;";

        protected void Button_Click(object sender, EventArgs e)
        {
            MySqlConnection mySql = new MySqlConnection();
            mySql.CreateConn();
            mySql.Command = mySql.Connection.CreateCommand();
            mySql.Command.CommandText = "insert into StockInfo (StockName, Price, Thoughts, TotalBought, TotalSold) values ('Demo',12.40,'Demo Thought',4,4);";

            mySql.Command.ExecuteNonQuery();

            mySql.Command.Dispose();
            mySql.Connection.Close();
            mySql.CloseConn();
        }
    }
}
