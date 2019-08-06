package kr.co.fedal;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.fedal.vo.FestivalVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/*.xml"})
public class DBTest {
	@Autowired
	private DataSource ds;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Test
	public void DBtest() throws Exception {
		System.out.println("ds : "+ ds);
		assertNotNull(ds);
	}
	
	@Test
	public void 페스티벌출력() throws Exception {
		List<FestivalVO> festivalList = session.selectList("kr.co.fedal.dao.FestivalDAO.selectFestival");
		
		for (FestivalVO vo : festivalList) {
			System.out.println(vo);
		}
	}
	
}
