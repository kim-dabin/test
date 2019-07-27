package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.Genre;

public class GenresDAOImpl implements GenresDAO {
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<Genre> selectList() {
		// TODO Auto-generated method stub
		return session.selectList("genres.selectList");
	}
	
	@Override
	public int insert(String name) {
		// TODO Auto-generated method stub
		return session.insert("genres.insert", name);
	}
	
	@Override
	public int update(Genre genre) {
		// TODO Auto-generated method stub
		return session.update("genres.update", genre);
	}
	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return session.delete("genres.delete", no);
	}
}
