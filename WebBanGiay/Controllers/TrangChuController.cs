using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebBanGiay.Controllers
{
    public class TrangChuController : Controller
    {
        //
        // GET: /TrangChu/

        public ActionResult Index()
        {
            Session["DangNhap"] = null;
            Session["LienHe"] = null;
            return View();
        }
    }
}
