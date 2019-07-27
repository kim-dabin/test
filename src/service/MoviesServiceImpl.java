package service;

import java.util.List;

import dao.GenresDAO;
import dao.MoviesDAO;
import vo.Genre;
import vo.Movie;

public class MoviesServiceImpl implements MoviesService {
	private MoviesDAO moviesDAO;
	private GenresDAO genresDAO;
	
	public void setGenresDAO(GenresDAO genresDAO) {
		this.genresDAO = genresDAO;
	}
	
	public void setMoviesDAO(MoviesDAO moviesDAO) {
		this.moviesDAO = moviesDAO;
	}
	
	@Override
	public List<Genre> getGenres() {
		// TODO Auto-generated method stub
		return genresDAO.selectList();
	}
	
	@Override
	public Movie getMovie(int no) {
		// TODO Auto-generated method stub
		return moviesDAO.selectMovie(no);
	}
	
	@Override
	public List<Movie> getList() {
		// TODO Auto-generated method stub
		return moviesDAO.selectList();
	}
	
	@Override
	public boolean remove(int no) {
		// TODO Auto-generated method stub
		if(moviesDAO.delete(no)>0) return true;
		return false;
	}
	
	@Override
	public List<Movie> search(String name) {
		// TODO Auto-generated method stub
		return moviesDAO.search(name);
	}
	
	@Override
	public boolean input(Movie movie) {
		// TODO Auto-generated method stub
		
		if(moviesDAO.insert(movie)>0) return true;
		
		return false;
	}
}
