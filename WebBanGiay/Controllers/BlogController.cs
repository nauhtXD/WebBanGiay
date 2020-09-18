using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanGiay.Models;

namespace WebBanGiay.Controllers
{
    public class BlogController : Controller
    {
        //
        // GET: /Blog/
        DataProviderDataContext data = new DataProviderDataContext();
        private List<TinTuc> layTinMoi(int count)
        {
            return data.TinTucs.OrderByDescending(t => t.MaBaiViet).Take(count).ToList();
        }

        public ActionResult Index()
        {
            Session["DangNhap"] = null;
            Session["LienHe"] = null;
            Session["Cart"] = null;
            Session["Blog"] = "xxxxxx";
            var tinMoi = layTinMoi(4);
            return View(tinMoi);
        }
    }
}
