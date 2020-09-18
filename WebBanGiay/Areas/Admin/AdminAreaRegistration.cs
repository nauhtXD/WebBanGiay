using System.Web.Mvc;

namespace WebBanGiay.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            //Don Hang
            context.MapRoute(
                name: "Index-don-hang",
                url: "Trang-chu-don-hang",
                defaults: new { controller = "AdminDonHang", action = "Index", id = UrlParameter.Optional }
            );

            context.MapRoute(
                name: "Delete-don-hang",
                url: "Trang-chu-don-hang",
                defaults: new { controller = "AdminXoa-don-hang", action = "Delete", id = UrlParameter.Optional }
            );

            //Kho Hang
            context.MapRoute(
                name: "Index-kho-hang",
                url: "Trang-chu-kho-hang",
                defaults: new { controller = "AdminKhoHang", action = "Index", id = UrlParameter.Optional }
            );

            context.MapRoute(
                name: "Create-kho-hang",
                url: "Them-san-pham-vao-kho-hang",
                defaults: new { controller = "AdminKhoHang", action = "Create", id = UrlParameter.Optional }
            );

            context.MapRoute(
                name: "Delete-kho-hang",
                url: "Xoa-san-pham-khoi-kho-hang",
                defaults: new { controller = "AdminKhoHang", action = "Delete", id = UrlParameter.Optional }
            );

            context.MapRoute(
                name: "Edit-kho-hang",
                url: "Sua-so-luong-san-pham",
                defaults: new { controller = "AdminKhoHang", action = "Edit", id = UrlParameter.Optional }
            );

            //Nguoi Dung
            context.MapRoute(
                name: "Index-nguoi-dung",
                url: "Trang-chu-quan-ly-nguoi-dung",
                defaults: new { controller = "AdminNguoiDung", action = "Index", id = UrlParameter.Optional }
            );

            context.MapRoute(
                name: "Delete-nguoi-dung",
                url: "Trang-chu-quan-ly-nguoi-dung",
                defaults: new { controller = "AdminNguoiDung", action = "Delete", id = UrlParameter.Optional }
            );

            //Nha Cung Cap
            context.MapRoute(
                name: "Index-nha-cung-cap",
                url: "Trang-chu-quan-ly-nha-cung-cap",
                defaults: new { controller = "AdminNhaCungCap", action = "Index", id = UrlParameter.Optional }
            );

            context.MapRoute(
                name: "Create-nha-cung-cap",
                url: "Them-nha-cung-cap",
                defaults: new { controller = "AdminNhaCungCap", action = "Create", id = UrlParameter.Optional }
            );

            context.MapRoute(
                name: "Delete-nha-cung-cap",
                url: "Xoa-nha-cung-cap",
                defaults: new { controller = "AdminNhaCungCap", action = "Delete", id = UrlParameter.Optional }
            );

            context.MapRoute(
                name: "Edit-nha-cung-cap",
                url: "Sua-nha-cung-cap",
                defaults: new { controller = "AdminNhaCungCap", action = "Edit", id = UrlParameter.Optional }
            );

            //Phan loai
            context.MapRoute(
                name: "Index-phan-loai",
                url: "Trang-chu-phan-loai-san-pham",
                defaults: new { controller = "AdminPhanLoai", action = "Index", id = UrlParameter.Optional }
            );

            context.MapRoute(
                name: "Delete-phan-loai",
                url: "Xoa-loai-san-pham",
                defaults: new { controller = "AdminPhanLoai", action = "Delete", id = UrlParameter.Optional }
            );

            context.MapRoute(
                name: "Edit-phan-loai",
                url: "Sua-loai-san-pham",
                defaults: new { controller = "AdminPhanLoai", action = "Edit", id = UrlParameter.Optional }
            );

            //San Pham
            context.MapRoute(
                name: "Index-san-pham",
                url: "Trang-chu-quan-ly-san-pham",
                defaults: new { controller = "AdminSanPham", action = "Index", id = UrlParameter.Optional }
            );

            context.MapRoute(
                name: "Create-san-pham",
                url: "Them-san-pham-moi",
                defaults: new { controller = "AdminSanPham", action = "Create", id = UrlParameter.Optional }
            );

            context.MapRoute(
                name: "Delete-san-pham",
                url: "Xoa-san-pham",
                defaults: new { controller = "AdminSanPham", action = "Delete", id = UrlParameter.Optional }
            );

            context.MapRoute(
                name: "Detais-san-pham",
                url: "Chi-tiet-san-pham",
                defaults: new { controller = "AdminSanPham", action = "Details", id = UrlParameter.Optional }
            );

            context.MapRoute(
                name: "Edit-san-pham",
                url: "Sua-thong-tin-san-pham",
                defaults: new { controller = "AdminSanPham", action = "Edit", id = UrlParameter.Optional }
            );

            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new { action = "Index", controller = "AdminHome", id = UrlParameter.Optional }
            );
        }
    }
}
