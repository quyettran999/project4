package DuAn2.Model;


import java.sql.Date;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "checkincalendar")
public class CheckinCalendar {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int maLich;
	@NotNull(message = "Name cannot be blank")
	private String tenNguoiDat;
	@NotNull(message = "Phone Number cannot be blank")
	private String soDienThoai;
	@NotNull(message = "Email cannot be blank")
	@Email
	private String imail;
	@NotNull(message = "Check-in Date cannot be blank")
	private Date ngayDat;
	
	@DateTimeFormat(pattern="HH:mm")
	private java.util.Date gioDat;
	@NotNull(message = "Check-out Date cannot be blank")
	private Date ngayTra;
	private String thongTinThem;
	private String tenDangNhap;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "maLoaiPhong")
	private RoomType loaiPhong;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "maPhong")
	private Room room;


	public CheckinCalendar(int maLich, String tenNguoiDat, String soDienThoai, String imail, Room phong, Date ngayDat, Date ngayTra) {
		this.maLich = maLich;
		this.tenNguoiDat = tenNguoiDat;
		this.soDienThoai = soDienThoai;
		this.imail = imail;
		this.ngayDat = ngayDat;
		this.ngayTra = ngayTra;
		this.room = phong;

	}
	
	public CheckinCalendar(int maLich, String tenNguoiDat, String soDienThoai, String imail, Date ngayDat, Date ngayTra,RoomType loaiPhong, Room phong) {
		this.maLich = maLich;
		this.tenNguoiDat = tenNguoiDat;
		this.soDienThoai = soDienThoai;
		this.imail = imail;
		this.ngayDat = ngayDat;
		this.ngayTra = ngayTra;
		this.loaiPhong = loaiPhong;
		this.room = phong;

	}
	public CheckinCalendar() {
	}

	public Date getNgayDat() {
		return ngayDat;
	}

	public void setNgayDat(Date ngayDat) {
		this.ngayDat = ngayDat;
	}

	public Date getNgayTra() {
		return ngayTra;
	}

	public void setNgayTra(Date ngayTra) {
		this.ngayTra = ngayTra;
	}

	public String getImail() {
		return imail;
	}

	public void setImail(String imail) {
		this.imail = imail;
	}

	public java.util.Date getGioDat() {
		return gioDat;
	}

	public void setGioDat(java.util.Date gioDat) {
		this.gioDat = gioDat;
	}

	public Integer getMaLich() {
		return maLich;
	}

	public void setMaLich(Integer maLich) {
		this.maLich = maLich;
	}

	public String getTenNguoiDat() {
		return tenNguoiDat;
	}

	public void setTenNguoiDat(String tenNguoiDat) {
		this.tenNguoiDat = tenNguoiDat;
	}

	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	public String getThongTinThem() {
		return thongTinThem;
	}

	public void setThongTinThem(String thongTinThem) {
		this.thongTinThem = thongTinThem;
	}

	public String getTenDangNhap() {
		return tenDangNhap;
	}

	public void setTenDangNhap(String tenDangNhap) {
		this.tenDangNhap = tenDangNhap;
	}

	public RoomType getLoaiPhong() {
		return loaiPhong;
	}
	
	public void setLoaiPhong(RoomType roomType) {
		this.loaiPhong = roomType;
	}
	public Room getPhong() {
		return room;
	}

	public void setPhong(Room room) {
		this.room = room;
	}

}
