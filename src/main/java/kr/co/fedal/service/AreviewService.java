package kr.co.fedal.service;

import java.util.List;
import java.util.Map;

import kr.co.fedal.vo.AreviewVO;

public interface AreviewService {
	// Artist comment insert
		public void insertArtistComment(AreviewVO avo);

		// Artist comment select
		public List<AreviewVO> selectArtistComments(String aid);
		
		// Artist comment delete 
		public void deleteArtistComment(int no);
		
		//Artist comment update
		public void updateArtistComment(AreviewVO avo);
		
		//count Artist comments
		public int countArtistComments(String aid);
		
		//Artist comment insert between start and end
		public List<AreviewVO> selectArtistCommentsPaging(String aid, int start, int end);
		
		public List<Integer> selectLikeCheck(String id);
		
		public void insertLike(Map<Integer, String> map);
}
