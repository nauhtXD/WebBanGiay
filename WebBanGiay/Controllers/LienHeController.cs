using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebBanGiay.Controllers
{
    public class LienHeController : Controller
    {
        //
        // GET: /LienHe/

        public ActionResult Index()
        {
            Session["LienHe"] = "xxxxxx";
            Session["DangNhap"] = null;
            Session["Blog"] = null;
            Session["Cart"] = null;
            return View();
        }

    }
}
