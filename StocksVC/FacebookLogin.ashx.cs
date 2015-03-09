using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StocksVC
{

    public class FacebookLogin : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            var accessToken = context.Request["accessToken"];
            context.Session["AccessToken"] = accessToken;

            context.Response.Redirect("/Index");
        }

        public bool IsReusable
        {
            get { return false; }
        }
    }
}