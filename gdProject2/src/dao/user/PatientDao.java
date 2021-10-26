package dao.user;

import model.user.Patient;

public interface PatientDao {
	//ȸ������
	void insert(Patient patient);
	
	//���̵� �ߺ�üũ
	int selectCntById(String id);
	
	//ȯ�� �������� ����
	void update(Patient patient);
	
	//ȸ�� Ż��
	void delete(int pcode);
	
	//�α���
	Patient login(String id, String pw);
	Patient selectByPcode(int pcode);
}
