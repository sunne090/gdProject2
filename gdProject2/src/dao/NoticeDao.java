package dao;

import java.util.List;
import model.Notice;

public interface NoticeDao {
	//�������� �Խñ� ���
	void insert(Notice notice);
	
	//�������� �Խñ� ����
	void update(Notice notice);
	
	//�������� �Խñ� ����
	void delete(long ncode);
	
	//�������� �Խñ� ��ü���
	List <Notice> selectAll();
	
	//�������� �Խñ� �󼼺���
	Notice selectByNcode(int ncode);
	
	//�������� ����,�������� �˻�
	List <Notice> selectByTitleContent(String name);
	
	//��ȸ��
	void count(int ncode);
}
