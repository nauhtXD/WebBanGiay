using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanGiay.Models;

namespace WebBanGiay.Areas.Admin.Controllers
{
    public class AdminKhoHangController : Controller
    {
        //
        // GET: /Admin/KhoHang/
        DataProviderDataContext data = new DataProviderDataContext();
        public ActionResult Index()
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            //var All_Kho = from kho in data.KhoHangs join sp in data.SanPhams on kho.MaSP equals sp.MaSP
            //              select new {
            //                  MaNhapKho = kho.MaNhapKho,
            //                  TenSP = sp.TenSP,
            //                  SoLuong = kho.SoLuong,
            //                  NgayNhap = kho.NgayNhap
            //                  };
            var All_Kho = from kho in data.khos select kho;
            return View(All_Kho);
        }

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

        public ActionResult Delete(int masp)
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var D_Kho = data.KhoHangs.First(m => m.MaSP == masp);
            return View(D_Kho);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int masp, FormCollection collection)
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var D_Kho = data.KhoHangs.First(m => m.MaSP == masp);
            data.KhoHangs.DeleteOnSubmit(D_Kho);
            data.SubmitChanges();
            SetAlert("Xoá Thành Công", "success");
            return RedirectToAction("Index");
        }

        public ActionResult Edit(int masp)
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var E_Kho = data.KhoHangs.First(m => m.MaSP == masp);
            var tensp = data.khos.First(m => m.MaSP == masp);
            @ViewData["TenSP"] = tensp.TenSP;
            return View(E_Kho);
        }

        [HttpPost]
        public ActionResult Edit(int masp, FormCollection collection)
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var E_Kho = data.KhoHangs.First(m => m.MaSP == masp);
            var soluong = int.Parse(collection["SoLuong"]);
            var ngaynhap = Convert.ToDateTime(collection["NgayNhap"]);
            if (soluong.ToString().Trim().Length == 0)
            {
                soluong = 0;
            }
            else
            {
                E_Kho.SoLuong = soluong;
                E_Kho.NgayNhap = ngaynhap;

                UpdateModel(E_Kho);
                data.SubmitChanges();
                SetAlert("Cập nhật thành công", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Cập nhật thất bại", "danger");
            return this.Edit(masp);
        }

        public ActionResult Create()
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var C_Kho = from kho in data.KhoHangs select kho;
            var Kho_SP = from sp in data.SanPhams select sp;
            ViewData["MaSP"] = new SelectList(data.SanPhams, "MaSP", "TenSP");
            return View();
        }

        [HttpPost]
        public ActionResult Create(FormCollection collection, KhoHang kho)
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var masp = int.Parse(collection["MaSP"]);
            var soluong = int.Parse(collection["SoLuong"]);
            var ngaynhap = Convert.ToDateTime(collection["NgayNhap"]);
            if (soluong.ToString().Trim().Length == 0)
            {
                soluong = 0;
            }
            else
            {
                kho.MaSP = masp;
                kho.SoLuong = soluong;
                kho.NgayNhap = ngaynhap;

                data.KhoHangs.InsertOnSubmit(kho);
                data.SubmitChanges();
                SetAlert("Thêm thành công", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Thêm thất bại", "danger");
            return this.Create();
        }

    }
}
