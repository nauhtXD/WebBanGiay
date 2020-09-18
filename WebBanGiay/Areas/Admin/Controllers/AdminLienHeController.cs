using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanGiay.Models;

namespace WebBanGiay.Areas.Admin.Controllers
{
    public class AdminLienHeController : Controller
    {
        //
        // GET: /Admin/LienHe/
        DataProviderDataContext data = new DataProviderDataContext();
        public ActionResult Index()
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            return View();
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

        [HttpPost]
        public ActionResult Index(FormCollection collect)
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var lienHe = data.LienHes.First(m => m.Id == 1);
            var email = collect["Email"];
            var sdt = collect["SDT"];
            var diaChi = collect["DiaChi"];

            lienHe.Id = 1;

            if (string.IsNullOrEmpty(email))
            {
                ViewData["Loi_email"] = "Email không được để trống";
            }
            else if (string.IsNullOrEmpty(email))
            {
                ViewData["Loi_sdt"] = "Số điện thoại không được để trống";
            }
            else if (string.IsNullOrEmpty(email))
            {
                ViewData["Loi_diachi"] = "Địa chỉ không được để trống";
            }
            else
            {
                lienHe.Email = email;
                lienHe.SDT = sdt;
                lienHe.DiaChi = diaChi;
                UpdateModel(lienHe);
                data.SubmitChanges();
                SetAlert("Cập nhật thành công", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Cập nhật thất bại", "error");
            return this.Index();
        }
    }
}
