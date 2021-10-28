package dao.user;

import java.util.HashMap;
import java.util.List;

import model.ask.Rest;
import model.user.Manager;
import model.user.Patient;
import model.user.Subject;

public interface ManagerDao {
	//�α���
	Manager login(String id,String pw);
	Manager selectByMcode(int mcode);
	//�ǻ���ȸ
	List<Subject> selectSubjectAll();
	List<HashMap<String, String>> selectDoctorBySubject(int scode);
	void deleteDoctor(int dcode);
	//ȯ����ȸ
	List<HashMap<String, String>> selectPatientAll();
	List<Patient> selectPatientByName(String name);
	//���ΰ���
	List<HashMap<String, String>> selectRestAll();
	List<HashMap<String, String>> selectRestByName(String name);
	HashMap<String, String> selectRestByRcode(int rcode);
	void updateRestApprove(int rcode);
	void updateRestReject(int rcode);
}
