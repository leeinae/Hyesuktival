package kr.co.fedal.dao;

import java.util.List;
import java.util.Map;

import kr.co.fedal.vo.AreviewVO;

public interface AreviewDAO {
	public void insertArtistComment(AreviewVO avo);
	public List<AreviewVO> selectArtistComments(String aid);
	public void deleteArtistComment(int no);
	public void updateArtistComment(AreviewVO avo);
	public int countArtistComments(String aid);
	public List<AreviewVO> selectArtistCommentsPaging(String aid, int start, int end);
	public List<String> YselectLikeCheck(String id);
	public void YinsertLike(Map<String, Object> map);
	public void youtubeVoteCnt(String no);
	public String selectYoutubeCnt(String no);
}
