using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebBanGiay.Models
{
    public class GioHang
    {
        DataProviderDataContext data = new DataProviderDataContext();
        public int iMaSP { get; set; }
        public string sTenSP { get; set; }
        public string sAnhBia { get; set; }
        public int iSoLuong { get; set; }
        public Double dGia { get; set; }
        public Double dThanhTien { get { return iSoLuong * dGia; } }

        public GioHang(int MaSP)
        {
            iMaSP = MaSP;
            SanPham sp = data.SanPhams.Single(n => n.MaSP == iMaSP);
            sTenSP = sp.TenSP;
            sAnhBia = sp.AnhBia;
            dGia = double.Parse(sp.Gia.ToString());
            iSoLuong = 1;
        }
    }
}