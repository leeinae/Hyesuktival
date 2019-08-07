package kr.co.fedal.dao;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.fedal.util.SignupRequest;
import kr.co.fedal.vo.FestivalVO;
import kr.co.fedal.vo.SignupVO;

@Repository
public class FestivalDAOImpl implements FestivalDAO {

	@Autowired
	private SqlSessionTemplate session;

	//쿼리문 실행을 위한 코드
	protected Log log = LogFactory.getLog(FestivalDAOImpl.class);

	protected void printQueryId(String queryId) {
		if (log.isDebugEnabled()) {
			log.debug("\t QueryId  \t:  " + queryId);
		}
	}

	public Object selectOne(String queryId, Object params) {
		printQueryId(queryId);
		return session.selectOne(queryId, params);
	}

	public Object insert(String queryId, Object params) {
		printQueryId(queryId);
		return session.insert(queryId, params);
	}

	//DAO
	@Override
	public List<FestivalVO> selectAllFestival() {
		List<FestivalVO> festivalList = session.selectList("kr.co.fedal.dao.FestivalDAO.selectFestival");
		return festivalList;
	}

	@Override
	public SignupVO selectByEmail(String email) {
		return (SignupVO) selectOne("kr.co.fedal.dao.FestivalDAO.selectByEmail", email);
	}

	@Override
	public SignupVO selectById(String id) {
		return (SignupVO) selectOne("kr.co.fedal.dao.FestivalDAO.selectById", id);
	}

	@Override
	public void insertUser(SignupRequest signReq) {
		insert("kr.co.fedal.dao.FestivalDAO.insertMember", signReq);
	}
	
	@Override
	public SignupVO selectAllById(String id) {
		return (SignupVO) selectOne("kr.co.fedal.dao.FestivalDAO.selectAllById", id);
	}
}
