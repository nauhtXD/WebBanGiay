using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebBanGiay.Models
{
    public class TinhTrang
    {
        List<string> tinhtrang { get; set; }

        public TinhTrang()
        {
            tinhtrang = new List<string>();
            tinhtrang.Add("Chưa xử lý");
            tinhtrang.Add("Đang xử lý");
            tinhtrang.Add("Đang giao");
            tinhtrang.Add("Đã giao");
        }
    }
}