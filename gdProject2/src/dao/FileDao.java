package dao;

import model.files;

public interface FileDao {
	//�Խñ� ���� ���
	public void insert(files files);
	
	//�Խñ� ���� ����
	public void update(files files);
	
	//�Խñ� ���� ����
	public void delete(long ncode);
}
