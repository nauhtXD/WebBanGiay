using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanGiay.Models;
using PagedList;
using PagedList.Mvc;

namespace WebBanGiay.Controllers
{
    public class SanPhamController : Controller
    {
        //
        // GET: /SanPham/
        DataProviderDataContext data = new DataProviderDataContext();

        private List<SanPham> layGiay(int count)
        {
            return data.SanPhams.OrderByDescending(t => t.Gia).Take(count).ToList();
        }

        private List<SanPham> layGiayTheoNCC(string maNCC, int count)
        {
            return data.SanPhams.Where(t => t.MaNCC == maNCC).Take(count).ToList();
        }

        private List<SanPham> layGiayTheoLoai(int maLoai, int count)
        {
            return data.SanPhams.Where(t => t.MaLoai == maLoai).Take(count).ToList();
        }
        
        public ActionResult Index(int ? page)
        {
            Session["SanPham"] = null;
            int pageSize = 9;
            int pageNum = (page ?? 1);
            var giayMoi = layGiay(data.SanPhams.ToList().Count);
            return View(giayMoi.ToPagedList(pageNum, pageSize));
        }

        public ActionResult NCC()
        {
            var layNCC = from ncc in data.NhaCungCaps select ncc;
            return PartialView(layNCC);
        }

        public ActionResult Loc(string maNCC, int? page)
        {
            Session["SanPham"] = null;
            int pageSize = 9;
            int pageNum = (page ?? 1);
            var giayMoi = layGiayTheoNCC(maNCC, data.SanPhams.ToList().Count);
            return View(giayMoi.ToPagedList(pageNum, pageSize));
        }

        public ActionResult LocLoai(int maLoai, int? page)
        {
            Session["SanPham"] = null;
            int pageSize = 9;
            int pageNum = (page ?? 1);
            var giayMoi = layGiayTheoLoai(maLoai, data.SanPhams.ToList().Count);
            return View(giayMoi.ToPagedList(pageNum, pageSize));
        }

        public ActionResult Details(int id)
        {
            var Details = data.SanPhams.Where(m => m.MaSP == id).First();
            Session["SanPham"] = Details;
            return View(Details);
        }
    }
}
