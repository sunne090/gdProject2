package dao;

import model.Patient;

public interface PatientDao {
	//ȸ������
	public void insert(Patient patient);
	
	//���̵� �ߺ�üũ
	public int selectCntById(String id);
	
	//ȯ�� �������� ����
	public void update(Patient patient);
	
	//ȸ�� Ż��
	public void delete(int pcode);
	
	//�α���
	Patient login(String id, String pw);
}
