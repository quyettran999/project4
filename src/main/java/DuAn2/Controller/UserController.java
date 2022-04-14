package DuAn2.Controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.*;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import DuAn2.Common.Common;
import DuAn2.Model.Account;
import DuAn2.Services.ITaikhoanServices;


@Controller
@Transactional
public class UserController {
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

	    binder.registerCustomEditor(Date.class,  new CustomDateEditor(dateFormat, true));
	}

	@Autowired
	ITaikhoanServices iTaikhoanServices;

	@ModelAttribute(name = "changeURL")
	public String changeURL() {
		return "profile";
	}
	
	@RequestMapping("/register")
	public String register(ModelMap model, @ModelAttribute("account") Account account) {
		return "register";
	}
	
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String acctionRegister(ModelMap model, @Validated @ModelAttribute("account") Account account,
			BindingResult errors) {
		
		String a = null;
		try {
			a = iTaikhoanServices.findById(account.getTenDangNhap()).get().getTenDangNhap();
		} catch (Exception e) {
			a = "null";
		}
		if (errors.hasErrors()) {
			model.addAttribute("errors", errors.getAllErrors());
			return "register";
		} else if (a.equals(account.getTenDangNhap())) {
			model.addAttribute("errortk", "Username is available");
			return "register";
		}
		else {
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
	
	@RequestMapping("/profile")
	public String profile(ModelMap model , HttpServletRequest httpServletRequest) {
		HttpSession session = httpServletRequest.getSession();
		Account getUser = iTaikhoanServices.findById(session.getAttribute("nguoidung").toString()).get();
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
		Account user = iTaikhoanServices.findById(session.getAttribute("nguoidung").toString()).get();
		String matkhau = getUser.getMatKhau();
		matkhau=Common.encode(matkhau);
		if (errors.hasErrors() ) {
			model.addAttribute("errors", errors.getAllErrors());
			return "profile";
		} else  {
			if(!matkhau.equals(user.getMatKhau() ) ){
				model.addAttribute("errortk", "Current password is incorrect");
				return "profile";
			} else 	{
			Date today = new Date();
			getUser.setNgayTao(user.getNgayTao());
			getUser.setGioTao(user.getGioTao());
			getUser.setMatKhau(matkhau);
			iTaikhoanServices.save(getUser);
			//model.addAttribute("message", "Update profile successfully");
			redirectAttrs.addAttribute("message", "Update profile successfully");
			return "redirect:/profile";
//			return "profile";
			}
		}
	}
	
	@RequestMapping("/change-Password")
	public String changePassword(HttpServletRequest httpServletRequest, ModelMap model) {		
		HttpSession session = httpServletRequest.getSession();
		Account account = iTaikhoanServices.findById(session.getAttribute("nguoidung").toString()).get();
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
		Account getAccount = iTaikhoanServices.findById(session.getAttribute("nguoidung").toString()).get();
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

}