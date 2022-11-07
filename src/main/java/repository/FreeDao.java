package repository;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import domain.Free;

public class FreeDao {

	private SqlSessionFactory factory;
	
	private static FreeDao dao = new FreeDao();
	
	private FreeDao() {
		try {
			String resource = "mybatis/config/mybatis-config.xml";
			InputStream in = Resources.getResourceAsStream(resource);
			factory = new SqlSessionFactoryBuilder().build(in);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static FreeDao getInstance() {
		return dao;
	}
	
	String mapper = "mybatis.mapper.free.";
	
	// 1. 목록
	public List<Free> selectAllBoards() {
		SqlSession ss = factory.openSession();
		List<Free> frees = ss.selectList(mapper + "selectAllBoards");
		ss.close();
		return frees;
	}
	
	// 2. 등록
	public int insertBoard(Free free) {
		SqlSession ss = factory.openSession(false);
		int result = ss.insert(mapper + "insertBoard", free);
		if(result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
	// 3. 삭제
	public int deleteBoard(int freeNo) {
		SqlSession ss = factory.openSession(false);
		int result = ss.delete(mapper + "deleteBoard", freeNo);
		if(result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
	// 4. 상세보기
	public Free selectBoardByNo(long freeNo) {
		SqlSession ss = factory.openSession();
		Free free = ss.selectOne(mapper + "selectBoardByNo", freeNo);
		ss.close();
		return free;
	}
	
	// 5. 수정
	public int updateBoard(Free free) {
		SqlSession ss = factory.openSession(false);
		int result = ss.update(mapper + "updateBoard", free);
		if(result > 0) {
			ss.commit();
		}
		ss.close();
		return result;
	}
	
	// 6. 조회수
	public long updateHit(long hit) {
		SqlSession ss = factory.openSession(false);
		long result = ss.update(mapper + "updateHit", hit);
		return result;
	}
	
	
	
	
}
