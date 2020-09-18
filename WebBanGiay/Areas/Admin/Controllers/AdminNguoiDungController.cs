using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanGiay.Models;

namespace WebBanGiay.Areas.Admin.Controllers
{
    public class AdminNguoiDungController : Controller
    {
        //
        // GET: /Admin/NguoiDung/

        DataProviderDataContext data = new DataProviderDataContext();
        public ActionResult Index()
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var All_NguoiDung = from nd in data.TTNguoiDungs select nd;
            return View(All_NguoiDung);
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
            var D_ND = data.NguoiDungs.First(m => m.MaNguoiDung == id);
            return View(D_ND);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, FormCollection collection)
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var D_ND = data.NguoiDungs.First(m => m.MaNguoiDung == id);
            var MaKH = data.KhachHangs.First(m => m.MaNguoiDung == id);

            var ma = Convert.ToInt32(MaKH.MaKH);
            var D_KH = data.KhachHangs.First(m => m.MaKH == ma);

            data.NguoiDungs.DeleteOnSubmit(D_ND);
            data.KhachHangs.DeleteOnSubmit(D_KH);

            data.SubmitChanges();
            SetAlert("Xoá Thành Công", "success");
            return RedirectToAction("Index");
        }

    }
}
