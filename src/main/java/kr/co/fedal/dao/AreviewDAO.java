package kr.co.fedal.dao;

import java.util.List;
import java.util.Map;

import kr.co.fedal.vo.AreviewVO;
import kr.co.fedal.vo.MusicVO;

public interface AreviewDAO {
	public void insertArtistComment(AreviewVO avo);
	public List<AreviewVO> selectArtistComments(String aid);
	public void deleteArtistComment(int no);
	public void updateArtistComment(AreviewVO avo);
	public int countArtistComments(String aid);
	public List<AreviewVO> selectArtistCommentsPaging(String aid, int start, int end);
	
	public void youtubeVoteCnt(int no);
	public void youtubeVoteCntCancel(int no);
	public AreviewVO selectNoCnt(int no);
	
	public List<Integer> selectLikeCheck(String id);
	
	public void insertLike(Map<Integer, String> map);
}
