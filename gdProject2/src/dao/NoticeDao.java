package dao;

import java.util.List;
import model.Notice;

public interface NoticeDao {
	//�������� �Խñ� ���
	public void insert(Notice notice);
	
	//�������� �Խñ� ����
	public void update(Notice notice);
	
	//�������� �Խñ� ����
	public void delete(long ncode);
	
	//�������� �Խñ� ��ü���
	List <Notice> selectAll();
	
	//�������� �Խñ� �󼼺���
	Notice selectByNcode(long ncode);
	
	//�������� ����,�������� �˻�
	List <Notice> selectByTitleContent(String name);
	
	//��ȸ��
	public void count(long ncode);
}
