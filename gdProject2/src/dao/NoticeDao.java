package dao;

import java.util.List;
import model.notice;

public interface NoticeDao {
	//�������� �Խñ� ���
	public void insert(notice notice);
	
	//�������� �Խñ� ����
	public void update(notice notice);
	
	//�������� �Խñ� ����
	public void delete(long ncode);
	
	//�������� �Խñ� ��ü���
	List <notice> selectAll();
	
	//�������� �Խñ� �󼼺���
	notice selectByNcode(long ncode);
	
	//�������� ����,�������� �˻�
	List <notice> selectByTitleContent(String name);
	
	//��ȸ��
	public void count(long ncode);
}
