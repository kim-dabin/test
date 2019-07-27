package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.GenresService;
import vo.Genre;

@Controller
public class GenreController {
	
	private GenresService genresService;
	
	public void setGenresService(GenresService genresService) {
		this.genresService = genresService;
	}
	
	@RequestMapping(value="/genreInsert.gm", method=RequestMethod.GET)
	public String genreForm() {
		return "genreForm";
	}
	@RequestMapping(value="/genreInsert.gm", method=RequestMethod.POST)
	public String genreInsert(String name) {
		
		genresService.register(name);
		
		return "redirect:/genre.gm";
	}
	
	@RequestMapping("/genre.gm")
	public String genreList(Model model) {
		System.out.println("genre start!");
		
		List<Genre> list = genresService.getList();
		for (Genre genre : list) {
			System.out.println(genre.getName());
		}
		model.addAttribute("genres", list);
		
		
		
		
		return "genreList";
	}
	@RequestMapping("/deleteGenre.gm")
	public String deleteGenre(int no) {
		
		genresService.remove(no);
		
		return "redirect:/genre.gm";
	}
	
}
