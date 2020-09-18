using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebBanGiay.Areas.Admin.Controllers
{
    public class AdminHomeController : Controller
    {
        //
        // GET: /Admin/Home/

        public ActionResult Index()
        {
            if(Session["Admin"] != null)
                return View();
            return RedirectToAction("Index", "DangNhap", new { area = "" });
        }

        public ActionResult Logout()
        {
            Session["Admin"] = null;
            return RedirectToAction("Index", "DangNhap", new { area = "" });
        }
    }
}
