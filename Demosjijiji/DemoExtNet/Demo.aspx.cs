using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net.Utilities;
using Ext.Net;
namespace DemoExtNet
{
    public partial class Demo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, DirectEventArgs e)
        {
            if (e.ExtraParams["user"] != "juan" || e.ExtraParams["pass"] != "juan")
            {
                e.Success = false;
                e.ErrorMessage = "Usuario Invalido";
            }
            else
            {
               Response.Redirect("~/lectorqr.aspx?parametro=" +  "Bienvenido:"+ txtUsername.Text);
            }
        }
    }
        
}