using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanGiay.Models;

namespace WebBanGiay.Areas.Admin.Controllers
{
    public class AdminNhaCungCapController : Controller
    {
        //
        // GET: /Admin/NhaCungCap/

        DataProviderDataContext data = new DataProviderDataContext();
        public ActionResult Index()
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var All_NCC = from ncc in data.NhaCungCaps select ncc;
            return View(All_NCC);
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

        public ActionResult Edit(string mancc)
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var E_NCC = data.NhaCungCaps.First(m => m.MaNCC == mancc);
            return View(E_NCC);
        }

        [HttpPost]
        public ActionResult Edit(string mancc, FormCollection collection)
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var E_NCC = data.NhaCungCaps.First(m => m.MaNCC == mancc);
            var ten_NCC = collection["TenNCC"];
            var diaChi = collection["DiaChi"];
            var dienThoai = collection["DienThoai"];
            if (String.IsNullOrEmpty(ten_NCC))
            {
                ViewData["Loi1"] = "Tên nhà cung cấp không được để trống";
            }
            if (String.IsNullOrEmpty(diaChi))
            {
                ViewData["Loi2"] = "Nhập địa chỉ";
            }
            if (String.IsNullOrEmpty(dienThoai))
            {
                ViewData["Loi3"] = "Nhập số điện thoại liên lạc";
            }
            else
            {
                E_NCC.TenNCC = ten_NCC;
                E_NCC.DiaChi = diaChi;
                E_NCC.DienThoai = dienThoai;

                UpdateModel(E_NCC);
                data.SubmitChanges();
                SetAlert("Cập nhật thành công", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Cập nhật thất bại", "danger");
            return this.Edit(mancc);
        }

        public ActionResult Delete(string mancc)
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var D_NCC = data.NhaCungCaps.First(m => m.MaNCC == mancc);
            return View(D_NCC);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(string mancc, FormCollection collection)
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var D_NCC = data.NhaCungCaps.First(m => m.MaNCC == mancc);
            data.NhaCungCaps.DeleteOnSubmit(D_NCC);
            data.SubmitChanges();
            SetAlert("Xoá Sản Phẩm Thành Công", "success");
            return RedirectToAction("Index");
        }

        public ActionResult Create()
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var C_NCC = from ncc in data.NhaCungCaps select ncc;
            return View();
        }

        [HttpPost]
        public ActionResult Create(FormCollection collection, NhaCungCap ncc)
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var ma_ncc = collection["MaNCC"];
            var ten_ncc = collection["TenNCC"];
            var diaChi = collection["DiaChi"];
            var dienthoai = collection["DienThoai"];
            if (String.IsNullOrEmpty(ma_ncc))
            {
                ViewData["Loi"] = "Mã nhà cung cấp không được để trống";
            }
            if (String.IsNullOrEmpty(ten_ncc))
            {
                ViewData["Loi1"] = "Tên nhà cung cấp không được để trống";
            }
            if (String.IsNullOrEmpty(diaChi))
            {
                ViewData["Loi2"] = "Nhập địa chỉ";
            }
            if (String.IsNullOrEmpty(dienthoai))
            {
                ViewData["Loi3"] = "Nhập số điện thoại liên lạc";
            }
            else
            {
                ncc.MaNCC = ma_ncc;
                ncc.TenNCC = ten_ncc;
                ncc.DiaChi = diaChi;
                ncc.DienThoai = dienthoai;

                data.NhaCungCaps.InsertOnSubmit(ncc);
                data.SubmitChanges();
                SetAlert("Thêm thành công", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Thêm thất bại", "danger");
            return this.Create();
        }

    }
}
