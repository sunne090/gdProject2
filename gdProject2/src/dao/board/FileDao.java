package dao.board;

import model.board.Files;

public interface FileDao {
	//�Խñ� ���� ���
	void insert(Files files);
	
	//�Խñ� ���� ����
	void update(Files files);
	
	//�Խñ� ���� ����
	void delete(int ncode);
}
