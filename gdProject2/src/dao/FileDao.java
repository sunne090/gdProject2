package dao;

import model.Files;

public interface FileDao {
	//�Խñ� ���� ���
	void insert(Files files);
	
	//�Խñ� ���� ����
	void update(Files files);
	
	//�Խñ� ���� ����
	void delete(long ncode);
}
