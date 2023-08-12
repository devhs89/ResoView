using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ResoView.Startup))]
namespace ResoView
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
