-- -------------------------1---------------------------------- 
select * from khachhang;
-- -------------------------2---------------------------------- 
select tenncc,diachi from nhacungcap ;
-- -------------------------3---------------------------------- 
select * from nhanvien;
-- -------------------------4---------------------------------- 
select SP.tensp,LSP.tenlsp,CTPX.giaban from sanpham SP 
join loaisp LSP on LSP.malsp = SP.mlsp
join ctphieuxuat CTPX on CTPX.msp = sp.masp;
-- -------------------------5---------------------------------- 
select LSP.tenlsp,CTPX.sl from sanpham sp
join loaisp LSP on LSP.malsp = sp.mlsp
join ctphieuxuat CTPX on CTPX.msp = sp.masp;
-- -------------------------6---------------------------------- 
select LSP.tenlsp,CTPX.sl from sanpham sp
join loaisp LSP on LSP.malsp = sp.mlsp
join ctphieuxuat CTPX on CTPX.msp = sp.masp
order by CTPX.sl DESC;
-- -------------------------7---------------------------------- 
select NV.hoten "Ten NV",KH.tenkh "Ten KH" from phieuxuat PX
join nhanvien NV on NV.manv = PX.manvs
join khachhang KH on KH.makh = PX.makhs;
-- -------------------------8---------------------------------- 
select CTPX.sl,CTPX.giaban from phieuxuat PX
join ctphieuxuat CTPX on CTPX.spx = PX.sopx
where CTPX.spx = "PX002";
-- -------------------------9---------------------------------- 
select * from sanpham sp
join ctphieuxuat ctpx on ctpx.msp = sp.masp
where ctpx.giaban >= "10000000";
-- -------------------------10---------------------------------- 
select * from sanpham sp
join ctphieuxuat ctpx on ctpx.msp = sp.masp
where ctpx.giaban between "5000000" and "15000000";
-- -------------------------11---------------------------------- 
select * from phieunhap pn
join nhacungcap ncc on ncc.mancc = pn.manccs
where pn.manccs = 'NCC003';
-- -------------------------12---------------------------------- 
select SP.tensp , CTPX.sl- CTPN.soluong AS SoLuongTonKho
 from sanpham SP
join ctphieuxuat CTPX on CTPX.msp = SP.masp
join ctphieunhap CTPN on CTPX.msp = SP.masp;
-- -------------------------13---------------------------------- 
select nv.hoten, kh.tenkh,px.ngayban from phieuxuat px
join nhanvien nv on nv.manv = px.manvs
join khachhang kh on kh.makh = px.makhs
where month(px.ngayban) = 7 and year(px.ngayban) = 2023;
-- -------------------------14---------------------------------- 
select nv.hoten, sum(ctpx.sl) "tong sl" from phieuxuat px
join nhanvien nv on nv.manv = px.manvs
join ctphieuxuat ctpx on ctpx.spx = px.sopx
group by px.sopx;
-- -------------------------15---------------------------------- 
select kh.tenkh, sum(ctpx.giaban) "tong chi tieu" from phieuxuat px
join khachhang kh on kh.makh = px.makhs
join ctphieuxuat ctpx on ctpx.spx = px.sopx
group by px.sopx;
-- -------------------------16---------------------------------- 
select ncc.*,count(pn.sopn)   from  nhacungcap ncc
join phieunhap pn on pn.manccs = ncc.mancc
group by ncc.mancc;
-- -------------------------17---------------------------------- 
select ctpn.soluong "SLPN",ctpx.sl "SLPX",lsp.tenlsp "TENSP"from loaisp lsp
join sanpham sp on sp.mlsp = lsp.malsp
join ctphieunhap ctpn on ctpn.masps = sp.masp
join ctphieuxuat ctpx on ctpx.msp = sp.masp;
-- -------------------------18---------------------------------- 
select lsp.tenlsp,sum(ctpn.gianhap) "Tong gia tri" from sanpham sp
join loaisp lsp on lsp.malsp = sp.mlsp
join ctphieunhap ctpn on ctpn.masps = sp.masp
group by sp.masp;
-- -------------------------19---------------------------------- 
select lsp.tenlsp,ctpx.sl from sanpham sp
join loaisp lsp on lsp.malsp = sp.mlsp
join ctphieuxuat ctpx on ctpx.msp = sp.masp
group by lsp.tenlsp,ctpx.sl;
-- -------------------------20---------------------------------- 
select * from phieunhap pn 
join ctphieunhap ctpn on ctpn.sopns = pn.sopn
where ctpn.soluong <= 3;
-- -------------------------21---------------------------------- 
select * from phieunhap pn 
join ctphieunhap ctpn on ctpn.sopns = pn.sopn
where ctpn.gianhap >= "50000000";
-- -------------------------22---------------------------------- 
select pn.*,nv.hoten from phieunhap pn 
join ctphieunhap ctpn on ctpn.sopns = pn.sopn
join nhanvien nv on nv.manv = pn.manvs
where nv.diachi = "Hà Nội";
-- -------------------------23---------------------------------- 
select * from nhanvien nv
join phieuxuat px on px.manvs = nv.manv
where nv.dienthoai like "09%";
-- -------------------------24---------------------------------- 
select nv.hoten , px.sopx from nhanvien nv
join phieuxuat px on px.manvs = nv.manv;
-- -------------------------25---------------------------------- 
select * from phieuxuat px
join khachhang kh on kh.makh = px.makhs 
where kh.makh = 'KH001';
-- -------------------------26---------------------------------- 
select * from phieuxuat px
join khachhang kh on kh.makh = px.makhs 
where kh.makh = 'KH002'
order by px.ngayban desc;
-- -------------------------27---------------------------------- 
select ctpx.sl , ctpn.soluong,lsp.tenlsp from sanpham sp
join loaisp lsp  on lsp.malsp = sp.mlsp
join ctphieuxuat ctpx on ctpx.msp = sp.masp
join ctphieunhap ctpn on ctpn.masps = sp.masp
order by lsp.tenlsp;
-- -------------------------28---------------------------------- 
select NV.hoten ,  count(px.sopx) from nhanvien nv
join phieuxuat px on px.manvs = nv.manv
where year(px.ngayban) = 2023
group by nv.manv;
-- -------------------------29---------------------------------- 
select NV.hoten ,  count(pn.sopn) from nhanvien nv
join phieunhap  pn on pn.manvs = nv.manv
where month(pn.ngaynhap) = 5 and  year(pn.ngaynhap) = 2023
group by nv.manv;
-- -------------------------30---------------------------------- 
select NV.hoten ,  count(px.sopx) from nhanvien nv
join phieuxuat px on px.manvs = nv.manv
where year(px.ngayban) = 2023
group by nv.manv 
order by count(px.sopx) desc ;
-- -------------------------31---------------------------------- 
select NV.hoten ,  count(pn.sopn) from nhanvien nv
join phieunhap  pn on pn.manvs = nv.manv
where  year(pn.ngaynhap) = 2023
group by nv.manv
order by count(pn.sopn) ;
-- -------------------------32---------------------------------- 
select kh.tenkh , count(px.sopx) from khachhang kh 
join phieuxuat px on px.makhs = kh.makh
where year(px.ngayban) = 2023
group by kh.makh
order by count(px.sopx) desc;
-- -------------------------34---------------------------------- 
select * from sanpham sp
join ctphieunhap ctpn on ctpn.masps = sp.masp
join ctphieuxuat ctpx on ctpx.msp = sp.masp
where ctpx.msp  is null;
-- -------------------------35---------------------------------- 
select * from sanpham sp
join ctphieunhap ctpn on ctpn.masps = sp.masp
join ctphieuxuat ctpx on ctpx.msp = sp.masp
where ctpn.masps  is null;
-- -------------------------36---------------------------------- 
select lsp.* from sanpham sp
join loaisp lsp on lsp.malsp = sp.mlsp
join ctphieunhap ctpn on ctpn.masps = sp.masp
join ctphieuxuat ctpx on ctpx.msp = sp.masp
where ctpn.soluong > ctpx.sl;
-- -------------------------37---------------------------------- 
select lsp.* from sanpham sp
join loaisp lsp on lsp.malsp = sp.mlsp
join ctphieunhap ctpn on ctpn.masps = sp.masp
join ctphieuxuat ctpx on ctpx.msp = sp.masp
where ctpn.soluong < ctpx.sl;
-- -------------------------38---------------------------------- 
select lsp.tenlsp ,ctpn.soluong from sanpham sp
join loaisp lsp on lsp.malsp = sp.mlsp
join ctphieunhap ctpn on ctpn.masps = sp.masp
order by ctpn.soluong desc;