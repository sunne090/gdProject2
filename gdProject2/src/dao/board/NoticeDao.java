package dao.board;

import java.util.HashMap;
import java.util.List;

import model.board.Notice;

public interface NoticeDao {
	//공지사항 게시글 등록
	void insert(Notice notice);
	
	//공지사항 게시글 수정
	void update(Notice notice);
	
	//공지사항 게시글 삭제
	void delete(long ncode);
	
	//공지사항 게시글 전체목록
	List <HashMap<String,Object>> selectAll(int requestpage);
	
	//공지사항 게시글 상세보기
	List <HashMap<String,Object>> selectByNcode(int ncode);
	
	//공지사항 제목,내용으로 검색
	List <HashMap<String,Object>> selectByTitleContent(String name,int requestpage);
	
	//조회수
	void count(int ncode);
	
	//공지사항 파일 insert를 위한 ncode가져오기
	int returnNcode();
	
	
	
}
