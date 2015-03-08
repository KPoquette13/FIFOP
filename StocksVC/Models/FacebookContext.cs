using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace StocksVC.Controllers
{
    public class FacebookContext
    {
        public FacebookContext();

        public string AccessToken { get; set; }
        public FacebookClient Client { get; set; }
        public FacebookConfiguration Configuration { get; set; }
        [Dynamic]
        public dynamic SignedRequest { get; set; }
        public string UserId { get; set; }
    }
}
