package dao;

import model.patient;

public interface PatientDao {
	//ȸ������
	public void insert(patient patient);
	
	//���̵� �ߺ�üũ
	public int selectCntById(String id);
	
	//ȯ�� �������� ����
	public void update(patient patient);
	
	//ȸ�� Ż��
	public void delete(long pcode);
	
	//�α���
	patient login(String id, String pwd);
}
