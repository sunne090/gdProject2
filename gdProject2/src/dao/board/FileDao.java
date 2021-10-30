package dao.board;

import java.util.List;
import model.board.Files;

public interface FileDao {
	//�Խñ� ���� ���
	void insert(Files files);
	
	//�Խñ� ���� ����
	void update(Files files);
	
	//�Խñ� ���� ����
	void delete(int ncode);
	
	//�ٲ������̸��� ���� ������ ���ϸ޼ҵ�
	int returnSeq();
	
	List <Files> selectAll();
	
	//ncode�� �޾Ƽ� ������ ������ ���ϰ�ü�� �������ִ� �޼ҵ�
	List <Files> returnFiles(int ncode);
}
