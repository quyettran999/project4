package DuAn2.Controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Optional;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import DuAn2.Common.Common;
import DuAn2.Model.Account;
import DuAn2.Model.Checkin;
import DuAn2.Model.Post;
import DuAn2.Services.ITaikhoanServices;
import DuAn2.Services.Ilsdtp;
import DuAn2.Services.IttkhService;

@Controller
@Transactional
public class UserController {
	

	@Autowired
	ITaikhoanServices iTaikhoanServices;
	@Autowired
	Ilsdtp lsdatphong;
	
	int checklogin = 0;

	@ModelAttribute(name = "changeURL")
	public String changeURL() {
		return "profile";
	}
	
	@RequestMapping("/userlogin")
	public String userlogin(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		if (checklogin == 1) {
			model.addAttribute("message", "Username or password is incorrect");
			checklogin = 0;
		}
		session = request.getSession();
		return "login1";
	}
	
	@RequestMapping(value="/userlogin", method = RequestMethod.POST)
	public String actionUserLogin(ModelMap model, HttpServletRequest httpServletRequest, HttpServletResponse response,
	                             @RequestParam("username") String username, @RequestParam("password") String password) {
		password = Common.encode(password);
		List<Account> l = iTaikhoanServices.findUser(username,password);

		if (l.isEmpty()) {
			checklogin = 1;
			return "redirect:/userlogin";
		} else {
			HttpSession session = httpServletRequest.getSession();
			session.setAttribute("user", username);
			session.setAttribute("chucvu", l.get(0).getChucVu().getMaChucVu() + "");
				return "redirect:/";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/home";
	}
		
	@RequestMapping("/register")
	public String register(ModelMap model, @ModelAttribute("account") Account account) {
		return "register";
	}
	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String acctionRegister(ModelMap model, @Validated @ModelAttribute("account") Account account,
			BindingResult errors, HttpServletRequest httpServletRequest) {
		
		String newpassword = httpServletRequest.getParameter("newpassword");
	
		String a = null;
		try {
			a = iTaikhoanServices.findById(account.getTenDangNhap()).get().getTenDangNhap();
		} catch (Exception e) {
			a = "null";
		}
		String email= null;
		try {
			email = iTaikhoanServices.findbyEmail(account.getEmail()).getEmail();
		} catch (Exception e) {
			email = "null";
		}
		if (errors.hasErrors()) {
			model.addAttribute("errors", errors.getAllErrors());
			return "register";
		} else if (a.equals(account.getTenDangNhap())) {
			model.addAttribute("errortk", "Username is available");
			return "register";
		}
		else {if(email.equals(account.getEmail())) {
			model.addAttribute("errortk", "Email is available");
			return "register";
		}else {
			if (!newpassword.equals(account.getMatKhau())){
				model.addAttribute("errortk", "Confirm Pasword do not match");
				return "register";
			}else {
				model.addAttribute("taikhoan", new Account());
				model.addAttribute("message", " Create account successfully!");
				model.addAttribute("titlepage", "Add a new account");
				account.setMatKhau(Common.encode(account.getMatKhau()));
				Date today = new Date();
				account.setNgayTao(today);
				account.setGioTao(today);
				iTaikhoanServices.save(account);
				return "register";
				}
			}
		}
	}
	
	@RequestMapping("/profile")
	public String profile(ModelMap model , HttpServletRequest httpServletRequest) {
		HttpSession session = httpServletRequest.getSession();
		Account getUser = iTaikhoanServices.findById(session.getAttribute("user").toString()).get();
		String message = httpServletRequest.getParameter("message");
		model.addAttribute("message", message);
		model.addAttribute("getUser", getUser);
		model.addAttribute("titlepage", "Profile Details");
		return "profile";
	}

	@RequestMapping(value = "/profile", method = RequestMethod.POST)
	public  String updateprofile(ModelMap model, @Validated @ModelAttribute("getUser") Account getUser, BindingResult errors,
			HttpServletRequest httpServletRequest, RedirectAttributes redirectAttrs) throws InterruptedException {
		
		HttpSession session = httpServletRequest.getSession();
		Account user = iTaikhoanServices.findById(session.getAttribute("user").toString()).get();
		String matkhau = getUser.getMatKhau();
		matkhau=Common.encode(matkhau);
		if (errors.hasErrors() ) {
			model.addAttribute("errors", errors.getAllErrors());
			return "profile";
		} else   {
			getUser.setNgayTao(user.getNgayTao());
			getUser.setGioTao(user.getGioTao());
			getUser.setMatKhau(user.getMatKhau());
			iTaikhoanServices.save(getUser);
			redirectAttrs.addAttribute("message", "Update profile successfully");
			return "redirect:/profile";
		}
	}
	
	@RequestMapping("/change-Password")
	public String changePassword(HttpServletRequest httpServletRequest, ModelMap model) {		
		HttpSession session = httpServletRequest.getSession();
		Account account = iTaikhoanServices.findById(session.getAttribute("user").toString()).get();
		model.addAttribute("account", account);
		model.addAttribute("titlepage", "Change Password");
		return "change-password";
	}
	
	@RequestMapping(value="/change-Password", method = RequestMethod.POST)
	public String actionchangPassword(HttpServletRequest httpServletRequest, ModelMap model,
	                               @ModelAttribute("account") Account account) {
		String oldPassword = httpServletRequest.getParameter("matkhaucu");
		String newPassword = httpServletRequest.getParameter("matkhaumoi");
		oldPassword = Common.encode(oldPassword);
		newPassword = Common.encode(newPassword);
		account.setMatKhau(Common.encode(account.getMatKhau()));
		model.addAttribute("titlepage", "Change Password");
		HttpSession session = httpServletRequest.getSession();
		Account getAccount = iTaikhoanServices.findById(session.getAttribute("user").toString()).get();
		if (!oldPassword.equals(getAccount.getMatKhau())) {
			model.addAttribute("messageloi", "Current password is incorrect");
			account.setMatKhau("");
			return "change-password";
		} else if (!newPassword.equals(account.getMatKhau())) {
			model.addAttribute("messageloi", "Confirm the new password is incorrect");
			account.setMatKhau("");
			return "change-password";
		} else if (newPassword.length() < 9) {
			account.setMatKhau("");
			model.addAttribute("messageloi", "Password must be from 8 characters");
			return "change-password";
		} else {
			iTaikhoanServices.save(account);
			model.addAttribute("message", "Password changed successfully");
			account.setMatKhau("");
			return "change-password";
		}
	}
	
	@RequestMapping("/bookinghistory")
	public String bookingHisory(ModelMap model , HttpServletRequest httpServletRequest, @RequestParam("p") Optional<Integer> p) {
		HttpSession session = httpServletRequest.getSession();
		Pageable pageable = PageRequest.of(p.orElse(0), 10);
		String user= session.getAttribute("user").toString();
    	Page<Checkin> bookinghistory= lsdatphong.findByTenDangNhap(user, pageable);
    	
		model.addAttribute("bookingh", bookinghistory);
		return "booking_history";
	}
	
}