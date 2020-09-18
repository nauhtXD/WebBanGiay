using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanGiay.Models;

namespace WebBanGiay.Areas.Admin.Controllers
{
    public class AdminSanPhamController : Controller
    {
        //
        // GET: /Admin/SanPham/

        DataProviderDataContext data = new DataProviderDataContext();

        public ActionResult Index(string btnSearch)
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            if (string.IsNullOrEmpty(btnSearch))
            {
                var All_SanPham = from sanpham in data.SanPhams select sanpham;
                return View(All_SanPham);
            }
            else
            {
                var All_SP_Search = data.SanPhams.Where(m => m.TenSP.Equals(btnSearch)).ToList();
                return View(All_SP_Search);
            }

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

        public ActionResult Details(int id)
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var Details_SP = data.SanPhams.Where(m => m.MaSP == id).First();

            //Lay ten loai thong qua ma loai
            var maloai = Details_SP.MaLoai;
            var tenloai = data.PhanLoais.Where(n => n.MaLoai == maloai).ToList();
            ViewData["TenLoai"] = tenloai[0].TenLoai;
            //foreach (var i in tenloai)
            //{
            //    ViewData["TenLoai"] = i.TenLoai;
            //    break;
            //}

            //lay ten nha cung cap 
            var mancc = Details_SP.MaNCC;
            var tenncc = data.NhaCungCaps.Where(x => x.MaNCC == mancc).ToList();
            ViewData["TenNCC"] = tenncc[0].TenNCC;

            return View(Details_SP);
        }

        public ActionResult Edit(int id)
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var E_SP = data.SanPhams.First(m => m.MaSP == id);
            var NCC_SP = from ncc in data.NhaCungCaps select ncc;
            ViewData["MaNCC"] = new SelectList(data.NhaCungCaps, "MaNCC", "TenNCC");
            var L_SP = from loai in data.PhanLoais select loai;
            ViewData["MaLoai"] = new SelectList(data.PhanLoais, "MaLoai", "TenLoai");
            return View(E_SP);
        }

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var E_SP = data.SanPhams.First(m => m.MaSP == id);
            var Ten_SP = collection["TenSP"];
            var mau = collection["Mau"];
            var size = int.Parse(collection["Size"]);
            var mancc = collection["MaNCC"];
            var danhgia = float.Parse(collection["DanhGia"]);
            var mota = collection["MoTa"];
            var gia = int.Parse(collection["Gia"]);
            var tinhtrang = collection["TinhTrang"];
            var anhbia = collection["AnhBia"];
            var maloai = int.Parse(collection["MaLoai"]);
            if (String.IsNullOrEmpty(Ten_SP))
            {
                ViewData["Loi1"] = "Tên sản phẩm không được để trống";
            }
            if (String.IsNullOrEmpty(mau))
            {
                ViewData["Loi2"] = "Chọn 1 màu";
            }
            if (String.IsNullOrEmpty(mancc))
            {
                ViewData["Loi4"] = "Chọn nhà cung cấp sản phẩm";
            }
            if (String.IsNullOrEmpty(mota))
            {
                ViewData["Loi5"] = "Mô tả sản phẩm không được để trống";
            }
            if (String.IsNullOrEmpty(tinhtrang))
            {
                ViewData["Loi8"] = "Xác nhận tình trạng sản phẩm";
            }
            if (String.IsNullOrEmpty(anhbia))
            {
                ViewData["Loi9"] = "Chọn 1 ảnh bìa";
            }
            else
            {
                E_SP.TenSP = Ten_SP;
                E_SP.Mau = mau;
                E_SP.Size = size;
                E_SP.MaNCC = mancc;
                E_SP.DanhGia = danhgia;
                E_SP.MoTa = mota;
                E_SP.Gia = gia;
                E_SP.TinhTrang = tinhtrang;
                E_SP.AnhBia = anhbia;
                E_SP.MaLoai = maloai;

                UpdateModel(E_SP);
                data.SubmitChanges();
                SetAlert("Cập nhật thành công", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Cập nhật thất bại", "danger");
            return this.Edit(id);
        }

        public ActionResult Delete(int id)
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var D_SP = data.SanPhams.First(m => m.MaSP == id);
            return View(D_SP);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, FormCollection collection)
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var D_SP = data.SanPhams.First(m => m.MaSP == id);
            data.SanPhams.DeleteOnSubmit(D_SP);
            data.SubmitChanges();
            SetAlert("Xoá Sản Phẩm Thành Công", "success");
            return RedirectToAction("Index");
        }

        public ActionResult Create()
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var C_SP = from sp in data.SanPhams select sp;
            var NCC_SP = from ncc in data.NhaCungCaps select ncc;
            ViewData["MaNCC"] = new SelectList(data.NhaCungCaps, "MaNCC", "TenNCC");
            var L_SP = from loai in data.PhanLoais select loai;
            ViewData["MaLoai"] = new SelectList(data.PhanLoais, "MaLoai", "TenLoai");
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection, SanPham sp)
        {
            if (Session["Admin"] == null)
                return RedirectToAction("Index", "DangNhap", new { area = "" });
            var Ten_SP = collection["TenSP"];
            var mau = collection["Mau"];
            var size = int.Parse(collection["Size"]);
            var mancc = collection["MaNCC"];
            var danhgia = float.Parse(collection["DanhGia"]);
            var mota = collection["MoTa"];
            var gia = int.Parse(collection["Gia"]);
            var tinhtrang = collection["TinhTrang"];
            var anhbia = collection["AnhBia"];
            var maloai = int.Parse(collection["MaLoai"]);
            if (String.IsNullOrEmpty(Ten_SP))
            {
                ViewData["Loi1"] = "Tên sản phẩm không được để trống";
            }
            if (String.IsNullOrEmpty(mau))
            {
                ViewData["Loi2"] = "Chọn 1 màu";
            }
            if (String.IsNullOrEmpty(mancc))
            {
                ViewData["Loi4"] = "Chọn nhà cung cấp sản phẩm";
            }
            if (String.IsNullOrEmpty(mota))
            {
                ViewData["Loi5"] = "Mô tả sản phẩm không được để trống";
            }
            if (String.IsNullOrEmpty(tinhtrang))
            {
                ViewData["Loi8"] = "Xác nhận tình trạng sản phẩm";
            }
            if (String.IsNullOrEmpty(anhbia))
            {
                ViewData["Loi9"] = "Chọn 1 ảnh bìa";
            }
            else
            {
                sp.TenSP = Ten_SP;
                sp.Mau = mau;
                sp.Size = size;
                sp.MaNCC = mancc;
                sp.DanhGia = danhgia;
                sp.MoTa = mota;
                sp.Gia = gia;
                sp.TinhTrang = tinhtrang;
                sp.AnhBia = anhbia;
                sp.MaLoai = maloai;

                data.SanPhams.InsertOnSubmit(sp);
                data.SubmitChanges();
                SetAlert("Thêm thành công", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Thêm thất bại", "danger");
            return this.Create();
        }

    }
}
