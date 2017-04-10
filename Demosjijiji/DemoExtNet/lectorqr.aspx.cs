using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using Ext.Net.Utilities;
namespace Prestamos
{
    public partial class lectorqr : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string CodQR = "";

            if (Request.Params["parametro"] != null)
            { 
             Label1.Text=Request.Params["parametro"];
             
            }


            
            //if (!Page.IsPostBack)
            //{
            //    CodQR = lblQR.Text;

            //    if (CodQR.Length > 0)
            //    {
            //        Response.Redirect("~/index.aspx", true);
            //    }
            //}
            


        }



    }
}