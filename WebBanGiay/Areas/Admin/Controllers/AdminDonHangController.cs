using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanGiay.Models;

namespace WebBanGiay.Areas.Admin.Controllers
{
    public class AdminDonHangController : Controller
    {
        //
        // GET: /Admin/DonHang/

        DataProviderDataContext data = new DataProviderDataContext();
        public ActionResult Index()
        {
            if(Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var All_DonHang = from dh in data.DonHang_KhachHangs select dh;
            return View(All_DonHang);
        }

        public ActionResult Edit(int id)
        {
            var E_HD = data.HoaDons.First(m => m.MaHD == id);
            return View(E_HD);
        }

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            var E_HD = data.HoaDons.First(m => m.MaHD == id);
            var makhachhang = int.Parse(collection["MaKH"]);
            var ngaylap = Convert.ToDateTime(collection["NgayNhap"]);
            var ngaygiao = Convert.ToDateTime(collection["NgayGiao"]);
            var dathanhtoan = Convert.ToBoolean(collection["DaGiaoHang"]);
            var tinhtranggiao = Convert.ToBoolean(collection["TinhTrangGiao"]);
            var tongtien = float.Parse(collection["TongTien"]);

            if (String.IsNullOrEmpty(makhachhang.ToString()))
            {
                ViewData["Loi1"] = "Mã Khách Hàng không được để trống";
            }
            else
            {
                E_HD.MaKH = makhachhang;
                E_HD.NgayLap = ngaylap;
                E_HD.NgayGiao = ngaygiao;
                E_HD.DaThanhToan = dathanhtoan;
                E_HD.TinhTrangGiao = tinhtranggiao;
                E_HD.TongTien = tongtien;

                UpdateModel(E_HD);
                data.SubmitChanges();
                SetAlert("Cập nhật thành công", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Cập nhật thất bại", "danger");
            return this.Edit(id);
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

        public ActionResult Delete(int id)
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var D_HD = data.HoaDons.First(m => m.MaHD == id);
            return View(D_HD);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, FormCollection collection)
        {
            var D_HD = data.HoaDons.First(m => m.MaHD == id);
            data.HoaDons.DeleteOnSubmit(D_HD);
            data.SubmitChanges();
            SetAlert("Xoá Sản Phẩm Thành Công", "success");
            return RedirectToAction("Index");
        }

        public ActionResult Details_KH(int makh)
        {
            var Details_KH = data.KhachHangs.Where(m => m.MaKH == makh).First();

            var ma_kh = Details_KH.MaKH;
            var tenKH = Details_KH.TenKH;
            var gioitinh = Details_KH.GioiTinh;
            var ngaysinh = Details_KH.NgaySinh;
            var dienthoai = Details_KH.DienThoai;
            var email = Details_KH.Email;
            var diachi = Details_KH.DiaChi;

            return View(Details_KH);
        }

        public ActionResult Details_HD(int mahd)
        {
            var Details_DH = data.cthds.Where(m => m.MaHD == mahd).First();

            return View(Details_DH);
        }
    }
}
