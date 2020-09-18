using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanGiay.Models;

namespace WebBanGiay.Areas.Admin.Controllers
{
    public class AdminPhanLoaiController : Controller
    {
        //
        // GET: /Admin/PhanLoai/

        DataProviderDataContext data = new DataProviderDataContext();
        public ActionResult Index()
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var All_Loai = from l in data.PhanLoais select l;
            return View(All_Loai);
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

        public ActionResult Edit(int maloai)
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var E_Loai = data.PhanLoais.First(m => m.MaLoai == maloai);
            return View(E_Loai);
        }

        [HttpPost]
        public ActionResult Edit(int maloai, FormCollection collection)
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var E_Loai = data.PhanLoais.First(m => m.MaLoai == maloai);
            var tenloai = collection["TenLoai"];
            if (String.IsNullOrEmpty(tenloai))
            {
                ViewData["Loi"] = "Tên loại không được để trống";
            }
            else
            {
                E_Loai.TenLoai = tenloai;

                UpdateModel(E_Loai);
                data.SubmitChanges();
                SetAlert("Cập nhật thành công", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Cập nhật thất bại", "danger");
            return this.Edit(maloai);
        }

        public ActionResult Delete(int maloai)
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var D_Loai = data.PhanLoais.First(m => m.MaLoai == maloai);
            return View(D_Loai);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int maloai, FormCollection collection)
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var D_Loai = data.PhanLoais.First(m => m.MaLoai == maloai);
            data.PhanLoais.DeleteOnSubmit(D_Loai);
            data.SubmitChanges();
            SetAlert("Xoá Thành Công", "success");
            return RedirectToAction("Index");
        }

        //public ActionResult Create()
        //{
        //    var C_Loai = from l in data.PhanLoais select l;
        //    return View();
        //}

        [HttpPost]
        public ActionResult Index(FormCollection collection, PhanLoai loai)
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var tenloai = collection["TenLoai"];
            if (String.IsNullOrEmpty(tenloai))
            {
                ViewData["Loi1"] = "Tên loại không được để trống";
            }
            else
            {
                loai.TenLoai = tenloai;
                data.PhanLoais.InsertOnSubmit(loai);
                data.SubmitChanges();
                SetAlert("Thêm thành công", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Thêm thất bại", "danger");
            return this.Index();
        }

    }
}
