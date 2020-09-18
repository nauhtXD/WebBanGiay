using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanGiay.Models;

namespace WebBanGiay.Controllers
{
    public class GioHangController : Controller
    {
        //
        // GET: /GioHang/
        DataProviderDataContext data = new DataProviderDataContext();

        public List<GioHang> layGioHang()
        {
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang == null)
            {
                lstGioHang = new List<GioHang>();
                Session["GioHang"] = lstGioHang;
            }
            return lstGioHang;
        }

        public ActionResult ThemGioHang(int iMaSP, string strURL)
        {
            List<GioHang> lstGioHang = layGioHang();
            GioHang sanpham = lstGioHang.Find(n => n.iMaSP == iMaSP);
            if (sanpham == null)
            {
                sanpham = new GioHang(iMaSP);
                lstGioHang.Add(sanpham);
            }
            else
            {
                sanpham.iSoLuong++;
            }
            return Redirect(strURL);
        }

        private int tongSoLuong()
        {
            int iTongSoLuong = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang != null)
                iTongSoLuong = lstGioHang.Sum(n => n.iSoLuong);
            return iTongSoLuong;
        }

        private double tongTien()
        {
            double iTongTien = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang != null)
                iTongTien = lstGioHang.Sum(n => n.dThanhTien);
            return iTongTien;
        }

        public ActionResult GioHang()
        {
            Session["Cart"] = "xxxxxx";
            Session["DangNhap"] = null;
            Session["LienHe"] = null;
            Session["Blog"] = null;
            List<GioHang> lstGioHang = layGioHang();
            if (lstGioHang.Count == 0)
                return RedirectToAction("Index", "SanPham");
            ViewBag.TongSoLuong = tongSoLuong();
            ViewBag.TongTien = tongTien();
            return View(lstGioHang);
        }

        public ActionResult GioHangPartial()
        {
            ViewBag.TongSoLuong = tongSoLuong();
            ViewBag.TongTien = tongTien();
            return PartialView();
        }

        public ActionResult XoaGioHang(int iMaSP)
        {
            List<GioHang> lstGioHang = layGioHang();
            GioHang sanpham = lstGioHang.SingleOrDefault(n => n.iMaSP == iMaSP);
            if (sanpham != null)
            {
                lstGioHang.RemoveAll(n => n.iMaSP == iMaSP);
                return RedirectToAction("GioHang");
            }
            if (lstGioHang.Count == 0)
                return RedirectToAction("Index", "SanPham");
            return RedirectToAction("GioHang");
        }

        //Hiển thị thông báo
        protected void SetAlert(string message, string type)
        {
            TempData["AlertMessage"] = message;
            if (type == "success")
            {
                TempData["AlertType"] = "alert-success";
            }
            else if (type == "warning")
            {
                TempData["AlertType"] = "alert-warning";
            }
            else if (type == "error")
            {
                TempData["AlertType"] = "alert-danger";
            }
        }

        public ActionResult CapNhatGioHang(int iMaSP, FormCollection f)
        {
            List<GioHang> lstGioHang = layGioHang();
            GioHang sanpham = lstGioHang.SingleOrDefault(n => n.iMaSP == iMaSP);
            KhoHang kh = data.KhoHangs.OrderByDescending(n => n.MaSP == iMaSP).First();
            int soLuong = int.Parse(f["txtSoLuong"].ToString());
            if (sanpham != null && soLuong <= kh.SoLuong)
                sanpham.iSoLuong = soLuong;
            else
                SetAlert("Không đủ số lượng", "error");
            return RedirectToAction("GioHang");
        }

        public ActionResult XoaTatCaGioHang()
        {
            List<GioHang> lstGioHang = layGioHang();
            lstGioHang.Clear();
            return RedirectToAction("Index", "SanPham");
        }

        [HttpGet]
        public ActionResult DatHang()
        {
            if (Session["TaiKhoan"] == null)
                return RedirectToAction("Index", "DangNhap");
            if (Session["GioHang"] == null)
                return RedirectToAction("Index", "SanPham");
            List<GioHang> lstGioHang = layGioHang();
            ViewBag.TongSoLuong = tongSoLuong();
            ViewBag.TongTien = tongTien();
            return View(lstGioHang);
        }

        [HttpPost]
        public ActionResult DatHang(FormCollection collect)
        {
            HoaDon hd = new HoaDon();
            KhachHang kh = (KhachHang)Session["KhachHang"];
            List<GioHang> gh = layGioHang();
            hd.MaKH = kh.MaKH;
            hd.NgayLap = DateTime.Now;
            var ngayGiao = String.Format("{0:MM/dd/yyyy}", collect["NgayGiao"]);
            var ngayGiao1 = DateTime.Parse(ngayGiao);
            if (ngayGiao1 < DateTime.Now)
                SetAlert("Ngày giao phải sau hoặc cùng ngày đặt hàng", "danger");
            else
            {
                hd.NgayGiao = ngayGiao1;
                hd.TinhTrangGiao = false;
                hd.DaThanhToan = false;
                data.HoaDons.InsertOnSubmit(hd);
                data.SubmitChanges();
                foreach (var item in gh)
                {
                    ChiTietDonHang ctdh = new ChiTietDonHang();
                    ctdh.MaHD = hd.MaHD;
                    ctdh.MaSP = item.iMaSP;
                    ctdh.SoLuong = item.iSoLuong;
                    ctdh.DonGia = item.dGia;
                    data.ChiTietDonHangs.InsertOnSubmit(ctdh);
                }
                data.SubmitChanges();
                Session["GioHang"] = null;
                return RedirectToAction("XacNhanDon", "GioHang");
            }
            return RedirectToAction("DatHang", "GioHang");
        }

        public ActionResult XacNhanDon()
        {
            return View();
        }
    }
}
