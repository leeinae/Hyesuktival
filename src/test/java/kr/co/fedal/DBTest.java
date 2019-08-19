package kr.co.fedal;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.sql.DataSource;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.fedal.vo.ArtistVO;
import kr.co.fedal.vo.FestivalVO;
import kr.co.fedal.vo.MusicVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring/*.xml" })
public class DBTest {
	@Autowired
	private DataSource ds;

	@Autowired
	private SqlSessionTemplate session;

	@Test
	public void DBtest() throws Exception {
		System.out.println("ds : " + ds);
		assertNotNull(ds);
	}

	@Test
	@Ignore
	public void festivalInfoTest() throws Exception {
		List<FestivalVO> festivalList = session.selectList("kr.co.fedal.dao.FestivalDAO.selectFestival");

		for (FestivalVO vo : festivalList) {
			System.out.println(vo);
		}
	}

	@Test
	@Ignore
	public void detailFestivalTest() throws Exception {
		System.out.println("�럹�뒪�떚踰� �긽�꽭�젙蹂� �뀒�뒪�듃");
		FestivalVO vo = session.selectOne("kr.co.fedal.dao.FestivalDAO.searchFestivalDetail","203987");
		System.out.println(vo.toString());
	}

	@Test
	@Ignore
	public void detailArtistTest() throws Exception {
		System.out.println("�븘�떚�뒪�듃 �긽�꽭�젙蹂� �뀒�뒪�듃");
		List<ArtistVO> artistList = session.selectList("kr.co.fedal.dao.FestivalDAO.selectArtist", "203935");

		for (ArtistVO vo : artistList) {
			System.out.println(vo);
		}
	}

	@Test
	@Ignore
	public void detailMusicTest() throws Exception {
		System.out.println("아티스트 상세 테스트");
		List<MusicVO> musicList = session.selectList("kr.co.fedal.dao.FestivalDAO.selectMusic","41499");
		
		for(MusicVO vo : musicList) {
			System.out.println(vo);
		}
	}

}
