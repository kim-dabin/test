package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.MoviesService;
import vo.Movie;

@Controller
public class MovieController {
	private MoviesService moviesService;
	public void setMoviesService(MoviesService moviesService) {
		this.moviesService = moviesService;
	}
	@RequestMapping(value="/ajax/getMovie.gm")
	@ResponseBody
	public Movie ajajaj(int no) {
		
		return moviesService.getMovie(no);
		
	}
	@RequestMapping(value="/ajax/getMovieList.gm")
	@ResponseBody
	public List<Movie> getmovieList(){
		return moviesService.getList();
	}
	
	@RequestMapping("/movieList.gm")
	public void movieList(Model model) {
		model.addAttribute("movies", moviesService.getList());
	}
	
	@RequestMapping("/movie.gm")
	public String movie(Model model, int no) {
		//System.out.println("no:"+ no);
		model.addAttribute("movie", moviesService.getMovie(no));
		
		return "movieDetail";
	}
	@RequestMapping("/deleteMovie.gm")
	public String deleteMovie(int no) {
		moviesService.remove(no);
		return "redirect:/movieList.gm";
	}
	@RequestMapping(value="/movieInsert.gm",method=RequestMethod.GET)
	public String movieinsertForm(Model model) {
		
		model.addAttribute("genres", moviesService.getGenres());
		return "movieForm";
	}
	
	@RequestMapping(value="/movieInsert.gm",method=RequestMethod.POST)
	public String movieinsertForm(Movie movie) {//실제로 insert 되는 곳 
		//vo 멤버 필드명과 같으면 됨 
		//System.out.println(movie.getReleaseDate());
		//moviesService.input(movie);
		
		return "redirect:/movieList.gm";
	}
	
}
