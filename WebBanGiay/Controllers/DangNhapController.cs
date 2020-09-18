using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanGiay.Models;

namespace WebBanGiay.Controllers
{
    public class DangNhapController : Controller
    {
        //
        // GET: /DangNhap/
        DataProviderDataContext data = new DataProviderDataContext();

        public ActionResult Index()
        {
            Session["DangNhap"] = "xxxxxxx";
            Session["LienHe"] = null;
            Session["Blog"] = null;
            Session["Cart"] = null;
            return View();
        }

        [HttpPost]
        public ActionResult Index(FormCollection collect)
        {
            Session["DangNhap"] = "xxxxxxx";
            Session["LienHe"] = null;
            Session["Blog"] = null;
            Session["Cart"] = null;
            var tenDN = collect["TenDN"];
            var matKhau = collect["MatKhau"];
            if (String.IsNullOrEmpty(tenDN))
                ViewData["Loi1"] = "Phải nhập tên đăng nhập";
            else if (String.IsNullOrEmpty(matKhau))
                ViewData["Loi2"] = "Phải nhập mật khẩu";
            else
            {
                NguoiDung nd = data.NguoiDungs.SingleOrDefault(m => m.TenDN == tenDN && m.MatKhau == matKhau);
                if (nd != null)
                {
                    if (nd.LoaiNguoiDung.TenLoai == "Admin")
                    {
                        Session["Admin"] = nd;
                        return RedirectToAction("Index", "Admin/AdminHome");
                    }
                    else
                    {
                        Session["TaiKhoan"] = nd;
                        Session["KhachHang"] = data.KhachHangs.SingleOrDefault(m => m.MaNguoiDung == nd.MaNguoiDung);
                        return RedirectToAction("Index", "TrangChu");
                    }
                }
                @ViewBag.ThongBao = "Sai tên đăng nhập hoặc mật khẩu";
            }
            return View();
        }

        public ActionResult DangXuat()
        {
            Session["TaiKhoan"] = null;
            Session["KhachHang"] = null;
            return RedirectToAction("Index", "TrangChu");
        }

        public ActionResult DangKy()
        {
            return View();
        }

        [HttpPost]
        public ActionResult DangKy(FormCollection collect, KhachHang kh, NguoiDung nd)
        {
            var hoTen = collect["HotenKH"];
            var tenDn = collect["TenDN"];
            var matKhau = collect["Matkhau"];
            var matKhauNhapLai = collect["Matkhaunhaplai"];
            var diaChi = collect["Diachi"];
            var email = collect["Email"];
            var dienThoai = collect["Dienthoai"];
            var ngaysinh = String.Format("{0:MM/dd/yyyy}", collect["Ngaysinh"]);
            var gioiTinh = collect["GioiTinh"];
            var maLoai = 2;
            if (String.IsNullOrEmpty(hoTen))
                ViewData["Loi1"] = "Họ tên khách hàng không được để trống";
            else if (String.IsNullOrEmpty(tenDn))
                ViewData["Loi2"] = "Phải nhập tên đăng nhập";
            else if (String.IsNullOrEmpty(matKhau))
                ViewData["Loi3"] = "Phải nhập mật khẩu";
            else if (String.IsNullOrEmpty(matKhauNhapLai))
                ViewData["Loi4"] = "Phải nhập lại mật khẩu";
            else if (String.IsNullOrEmpty(email))
                ViewData["Loi5"] = "Email không được bỏ trống";
            else if (String.IsNullOrEmpty(dienThoai))
                ViewData["Loi6"] = "Phải nhập điện thoại";
            else if(String.IsNullOrEmpty(diaChi))
                ViewData["Loi7"] = "Phải nhập địa chỉ";
            else
            {
                nd.TenDN = tenDn;
                nd.MatKhau = matKhau;
                nd.MaLoai = maLoai;
                kh.TenKH = hoTen;
                kh.Email = email;
                kh.DiaChi = diaChi;
                kh.DienThoai = dienThoai;
                kh.NgaySinh = DateTime.Parse(ngaysinh);
                data.NguoiDungs.InsertOnSubmit(nd);
                data.SubmitChanges();
                kh.MaNguoiDung = data.NguoiDungs.OrderByDescending(n => n.MaNguoiDung).First().MaNguoiDung;
                data.KhachHangs.InsertOnSubmit(kh);
                data.SubmitChanges();
                return RedirectToAction("Index", "DangNhap");
            }
            return this.DangKy();
        }
    }
}
