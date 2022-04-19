package DuAn2.Controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;

import DuAn2.Model.Account;
import DuAn2.Model.Post;
import DuAn2.Services.ITaikhoanServices;
import DuAn2.Services.PostService;

@Controller
@Transactional
public class PostController {

	@Autowired
	PostService postService;
	
	@Autowired
	ITaikhoanServices iTaikhoanServices;
    
    @RequestMapping("/post_management")
    public String postManagement(ModelMap model, @ModelAttribute("post") Post Post,@RequestParam("p") Optional<Integer> p, @RequestParam(required = false) String title) {
    	
    		// quan ly phong
		model.addAttribute("chamshowpost", ".show");
		model.addAttribute("activenpost", null);
		model.addAttribute("activepost", "active");
		
		Page<Post> page;
    	Pageable pageable = PageRequest.of(p.orElse(0), 10);
    	if (title== null)
    		page= postService.findAll(pageable);
    	else 
    		page= postService.findByTitle(title, pageable);
    	model.addAttribute("title",title);
    	model.addAttribute("post", page);
    	model.addAttribute("titlepage", "Post Management");
        return "post-management";
    }

    @RequestMapping("/newPost")
    public String newPost(Model model, @ModelAttribute("newpost") Post newpost ) {
    	model.addAttribute("chamshowpost", ".show");
		model.addAttribute("activenpost", "active");
		model.addAttribute("activepost", null);
    	model.addAttribute("titlepage", "Write new post");
        return "postForm";

    }

    @RequestMapping(value="/newPost", method = RequestMethod.POST)
    public String newPost(ModelMap model, @Validated @ModelAttribute("newpost") Post newpost, BindingResult errors,
			   @RequestParam("file") MultipartFile file, HttpServletRequest request) {
    	model.addAttribute("chamshowpost", ".show");
		model.addAttribute("activenpost", "active");
		model.addAttribute("activepost", null);
		if (errors.hasErrors() || file.getSize() == 0) {
			if (file.getSize() == 0) {
				model.addAttribute("errorimg", "- Please select an image");
			}
			model.addAttribute("errors", errors.getAllErrors());
			model.addAttribute("titlepage", "Write new post");
			return "postForm";
		} else {

			if (!file.getOriginalFilename().endsWith(".jpg") && !file.getOriginalFilename().endsWith(".png")
					&& !file.getOriginalFilename().endsWith(".PNG") && !file.getOriginalFilename().endsWith(".JPG")
					&& !file.getOriginalFilename().endsWith(".jpeg") && !file.getOriginalFilename().endsWith(".JPEG")) {
				model.addAttribute("errorimg", "Only png, jpg, jpeg image formats are allowed.");
				return "postForm";
			} else {
				long nanotime = System.nanoTime();
				String url = null;
				if (file.getOriginalFilename().endsWith(".jpg") || file.getOriginalFilename().endsWith(".JPG")) {
					url = request.getServletContext().getRealPath("/images/post/") + nanotime + ".jpg";
					newpost.setImage(nanotime + ".jpg");
				}
				if (file.getOriginalFilename().endsWith(".png") || file.getOriginalFilename().endsWith(".PNG")) {
					url =request.getServletContext().getRealPath("/images/post/") + nanotime + ".png";
					newpost.setImage(nanotime + ".png");
				}
				
				if (file.getOriginalFilename().endsWith(".jpeg") || file.getOriginalFilename().endsWith(".JPEG")) {
					url = request.getServletContext().getRealPath("/images/post/") + nanotime + ".jpeg";
					newpost.setImage(nanotime + ".jpeg");
				}

				File convFile = new File(url);

				try {

					file.transferTo(convFile);

				} catch (IllegalStateException | IOException e) {
					System.out.println(e);
					model.addAttribute("errorimg", "Image error");
				}
			HttpSession session = request.getSession();
			Account user = iTaikhoanServices.findById(session.getAttribute("nguoidung").toString()).get();
			model.addAttribute("titlepage", "Write new post");
			model.addAttribute("message", "Create new Post Successfully");
			newpost.setCreatedOn(new Date(System.currentTimeMillis()));
        	newpost.setUsername(user.getTenDangNhap());
            postService.save(newpost);
            return "postForm";
			}
		}
    }

    @RequestMapping(value = "/editPost", method = RequestMethod.GET)
    public String editPostWithId(@RequestParam("id") long id,
                                 Model model) {
    	
    	model.addAttribute("chamshowpost", ".show");
		model.addAttribute("activenpost", null);
		model.addAttribute("activepost", "active");
        Optional<Post> optionalPost = postService.findById(id);

        Post post = optionalPost.get();   
        model.addAttribute("titlepage", "Edit Post");
        model.addAttribute("post", post);
        return "editForm";

    }
    
    @RequestMapping(value="/editPost", method = RequestMethod.POST)
    public String edittPost(ModelMap model, @Validated @ModelAttribute("post") Post post, BindingResult errors,
			   @RequestParam("file") MultipartFile file, HttpServletRequest request) {
    	
    	model.addAttribute("chamshowpost", ".show");
		model.addAttribute("activenpost", null);
		model.addAttribute("activepost", "active");
    	if (errors.hasErrors() || file.getSize() == 0) {
			if (file.getSize() == 0) {
				model.addAttribute("errorimg", "- Please select an image");
			}
			model.addAttribute("errors", errors.getAllErrors());
			model.addAttribute("titlepage", "Edit Post");
			return "editForm";
		} else {

			if (!file.getOriginalFilename().endsWith(".jpg") && !file.getOriginalFilename().endsWith(".png")
					&& !file.getOriginalFilename().endsWith(".PNG") && !file.getOriginalFilename().endsWith(".JPG")
					&& !file.getOriginalFilename().endsWith(".jpeg") && !file.getOriginalFilename().endsWith(".JPEG")) {
				model.addAttribute("errorimg", "Only png, jpg, jpeg image formats are allowed.");
				model.addAttribute("titlepage", "Edit Post");
				return "editForm";
			} else {
				long nanotime = System.nanoTime();
				String url = null;
				if (file.getOriginalFilename().endsWith(".jpg") || file.getOriginalFilename().endsWith(".JPG")) {
					url = request.getServletContext().getRealPath("/images/post/") + nanotime + ".jpg";
					post.setImage(nanotime + ".jpg");
				}
				if (file.getOriginalFilename().endsWith(".png") || file.getOriginalFilename().endsWith(".PNG")) {
					url =request.getServletContext().getRealPath("/images/post/") + nanotime + ".png";
					post.setImage(nanotime + ".png");
				}
				
				if (file.getOriginalFilename().endsWith(".jpeg") || file.getOriginalFilename().endsWith(".JPEG")) {
					url = request.getServletContext().getRealPath("/images/post/") + nanotime + ".jpeg";
					post.setImage(nanotime + ".jpeg");
				}

				File convFile = new File(url);

				try {

					file.transferTo(convFile);

				} catch (IllegalStateException | IOException e) {
					System.out.println(e);
					model.addAttribute("errorimg", "Image error");
				}
				Optional<Post> optionalPost = postService.findById(post.getId());
		            Post editpost = optionalPost.get();
		        model.addAttribute("titlepage", "Edit Post");
				model.addAttribute("message", "Create new Post Successfully");
				post.setUpdatedOn(new Date(System.currentTimeMillis()));
				post.setCreatedOn(editpost.getCreatedOn());
				model.addAttribute("id", post.getId());
	            postService.save(post);
	            return "editForm";
			}	
		}
    }


    @RequestMapping("/delete-post")
    public String deletePostWithId( Model model, @RequestParam("id") long id) {

        Optional<Post> optionalPost = postService.findById(id);

        if (optionalPost.isPresent()) {
            Post post = optionalPost.get();
                postService.delete(post);
                return "redirect:/post_management";
        } else {
            return "/error";
        }
    }
	
}
