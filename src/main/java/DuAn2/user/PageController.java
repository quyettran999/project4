package DuAn2.user;

import DuAn2.Dto.BookingDTO;
import DuAn2.Model.Post;
import DuAn2.Model.Room;
import DuAn2.Services.PostService;
import DuAn2.Services.QuanLyPhongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;


@Controller
@RequestMapping({"/"})
public class PageController {


	@Autowired
	private QuanLyPhongService quanLyPhongService;
	
	@Autowired
	PostService postService;

	@RequestMapping(value = "about", method = RequestMethod.GET)
	public String flowers() {
		return "about";
	}

	@RequestMapping(value = "service", method = RequestMethod.GET)
	public String service() {
		return "service";
	}

	@RequestMapping(value = "blog", method = RequestMethod.GET)
	public String blog(ModelMap model, @RequestParam("p") Optional<Integer> p) {
		
		Pageable pageable = PageRequest.of(p.orElse(0), 10);
    	Page<Post> page= postService.findAllByOrderByCreateDateDesc(pageable);
    	model.addAttribute("post", page);
    	model.addAttribute("titlepage", "Post Management");
        return "blog";
		//return "blog";
	}
	
    @RequestMapping(value = "/blogview{id}", method = RequestMethod.GET)
    public String getPostWithId(Long id, Model model) {

        Optional<Post> optionalPost = postService.findById(id);

        if (optionalPost.isPresent()) {
            Post post = optionalPost.get();
            model.addAttribute("post", post);
            return "blogview";
            } else
            	return "error";
            	
    }

	@RequestMapping(value = "blog-single", method = RequestMethod.GET)
	public String blog_single() {
		return "blog-single";
	}

	@RequestMapping(value = "room", method = RequestMethod.GET)
	public String room(@Param("roomType") String roomType, Model model) {
		List<Room> phongs;
		if (roomType == null || roomType.equalsIgnoreCase("Homestay"))
			phongs = quanLyPhongService.findAll();
		else
			phongs = quanLyPhongService.findAllByLoaiPhongTenLoaiPhong(roomType);
		model.addAttribute("listRoom", phongs);

		return "room";
	}


	@RequestMapping(value = "contact", method = RequestMethod.GET)
	public String contact() {
		return "contact";
	}

	@RequestMapping(value = "/booking", method = RequestMethod.GET)
	public String booking(@Param("roomCode") Integer roomCode, Model model) {

		BookingDTO bookingDTO = new BookingDTO();
		Room phong = new Room();
		if (roomCode != null) {
			phong = quanLyPhongService.getByMaPhong(roomCode);

			bookingDTO.setRoomCode(roomCode);
			bookingDTO.setRoomType(phong.getLoaiPhong().getTenLoaiPhong());
			model.addAttribute("show", true);

		}
		model.addAttribute("roomCode", phong.getMaPhong());
		model.addAttribute("roomNumber", phong.getSoPhong());
		model.addAttribute("bookingDTO", bookingDTO);
		return "booking";
	}
	
	@RequestMapping(value = "/bookingroom", method = RequestMethod.GET)
	public String bookingroom(@Param("roomCode") Integer roomCode, Model model) {

		BookingDTO bookingDTO = new BookingDTO();
		Room phong = new Room();
		if (roomCode != null) {
			phong = quanLyPhongService.getByMaPhong(roomCode);

			bookingDTO.setRoomCode(roomCode);
			bookingDTO.setRoomType(phong.getLoaiPhong().getTenLoaiPhong());
			model.addAttribute("show", true);

		}
		model.addAttribute("roomCode", phong.getMaPhong());
		model.addAttribute("roomNumber", phong.getSoPhong());
		model.addAttribute("roomPrice", phong.getGiaPhong());


		model.addAttribute("bookingDTO", bookingDTO);
		return "bookingroom";
	}

	@RequestMapping(value = "listroom", method = RequestMethod.GET)
	public String listroom() {
		return "listroom";
	}
	
	@RequestMapping(value = "error", method = RequestMethod.GET)
	public String error() {
		return "error";
	}
	
	@RequestMapping(value = "invoice", method = RequestMethod.GET)
	public String invoice() {
		return "invoice";
	}


}
