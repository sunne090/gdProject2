package dao;

import model.Files;

public interface FileDao {
	//�Խñ� ���� ���
	public void insert(Files files);
	
	//�Խñ� ���� ����
	public void update(Files files);
	
	//�Խñ� ���� ����
	public void delete(long ncode);
}
