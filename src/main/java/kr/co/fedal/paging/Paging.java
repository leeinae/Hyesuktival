package kr.co.fedal.paging;

public class Paging {
	//페이지 당 댓글 수
	public static final int PAGE_SCALE = 10;
	//화면 당 페이지 수
	public static final int BLOCK_SCALE = 4;
	//현재 페이지
	private int curPage;
	//이전 페이지
	private int prevPage;
	//다음 페이지
	private int nextPage;
	//전체 페이지 수
	private int totalPage;
	//전체 페이지 블록 수 
	private int totalBlock;
	//현재 페이지 블록 수
	private int curBlock;
	//이전 페이지 블록
	private int prevBlock;
	//다음 페이지 블록
	private int nextBlock;
	
	private int pageBegin;
	private int pageEnd;
	//현재 페이지 블록의 시작 번호
	private int blockBegin;
	//현재 페이지 블록의 끝 번호
	private int blockEnd;
	
	public Paging(int count, int curPage) {
		curBlock = 1;
		this.curPage = curPage;
		setTotalPage(count);
		setPageRange();
		setTotalBlock();
		setBlockRange();
	}
	
	public void setBlockRange() {
		//현재 페이지가 몇 번째 블록에 속하는지..
		curBlock = (int)Math.ceil((curPage-1)/ BLOCK_SCALE)+1;
		//현재 페이지 블록의 시작번호
		blockBegin = (curBlock-1)*BLOCK_SCALE+1;
		blockEnd = blockBegin + BLOCK_SCALE-1;
		//마지막 블록이 범위를 초과하지 않게...
		if( blockEnd > totalPage ) blockEnd = totalPage;
		
		//이전 눌렀을 때 이동할 페이지
		prevPage = (curPage ==1)?1:(curBlock-1) * BLOCK_SCALE;
		//다음 
		nextPage = curBlock > totalBlock ? (curBlock * BLOCK_SCALE) : (curBlock*BLOCK_SCALE)+1;
		//마지막 페이지가 범위를 초과하지 않도록 처리
		if (nextPage >= totalPage) nextPage = totalPage;
	}
	
	public void setPageRange() {
		//시작번호 = (현재 페이지 -1) * 페이지 당 댓글 수 +1 
		pageBegin = (curPage-1)*PAGE_SCALE+1;
		//끝 번호 = 시작번호 + 페이지 당 댓글 수 -1
		pageEnd = pageBegin+PAGE_SCALE-1; 
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int count) {
		totalPage = (int)Math.ceil(count*1.0/PAGE_SCALE);
	}

	public int getTotalBlock() {
		return totalBlock;
	}

	public void setTotalBlock() {
		this.totalBlock = (int)Math.ceil(totalPage / BLOCK_SCALE);
	}

	public int getCurBlock() {
		return curBlock;
	}

	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}

	public int getPrevBlock() {
		return prevBlock;
	}

	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}

	public int getNextBlock() {
		return nextBlock;
	}

	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}

	public int getPageBegin() {
		return pageBegin;
	}

	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

	public int getBlockBegin() {
		return blockBegin;
	}

	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}

	public int getBlockEnd() {
		return blockEnd;
	}

	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}
	
	
	
}
