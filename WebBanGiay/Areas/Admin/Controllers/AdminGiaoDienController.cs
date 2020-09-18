using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanGiay.Models;

namespace WebBanGiay.Areas.Admin.Controllers
{
    public class AdminGiaoDienController : Controller
    {
        //
        // GET: /Admin/AdminGiaoDien/
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
            var giaodien = data.GiaoDien_Anhs.First(m => m.Id == 1);
            var giaodien_trai = data.GiaoDien_Anhs.First(m => m.Id == 2);
            var giaodien_phai = data.GiaoDien_Anhs.First(m => m.Id == 3);

            var anh = collect["Banner_Chinh"];
            var anh_trai = collect["Banner_Trai"];
            var anh_phai = collect["Banner_Phai"];

            giaodien.Id = 1;
            giaodien_trai.Id = 2;
            giaodien_phai.Id = 3;

            if (string.IsNullOrEmpty(anh))
            {
                ViewData["Anh"] = "Ảnh không được để trống";
            }
            else
            {
                giaodien.Anh = anh;
                giaodien_trai.Anh = anh_trai;
                giaodien_phai.Anh = anh_phai;
                UpdateModel(giaodien);
                UpdateModel(giaodien_trai);
                UpdateModel(giaodien_phai);
                data.SubmitChanges();
                SetAlert("Cập nhật thành công", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Cập nhật thất bại", "error");
            return this.Index();
        }
    }
}
