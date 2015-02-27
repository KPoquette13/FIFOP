using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(FIFOP.Startup))]
namespace FIFOP
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
