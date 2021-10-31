package dao.board;

import java.util.HashMap;
import java.util.List;

import model.board.Notice;

public interface NoticeDao {
	//�������� �Խñ� ���
	void insert(Notice notice);
	
	//�������� �Խñ� ����
	void update(Notice notice);
	
	//�������� �Խñ� ����
	void delete(long ncode);
	
	//�������� �Խñ� ��ü���
	List <HashMap<String,Object>> selectAll(int requestpage);
	
	//�������� �Խñ� �󼼺���
	List <HashMap<String,Object>> selectByNcode(int ncode);
	
	//�������� ����,�������� �˻�
	List <HashMap<String,Object>> selectByTitleContent(String name,int requestpage);
	
	//��ȸ��
	void count(int ncode);
	
	//�������� ���� insert�� ���� ncode��������
	int returnNcode();
	
	
	
}
