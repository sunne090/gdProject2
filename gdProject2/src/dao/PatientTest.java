package dao;

import java.sql.Connection;

import dao.JDBCUtil;
import model.Patient;

public class PatientTest {
	
	public static void main(String[] args) {
		
		Connection connection = JDBCUtil.getConnection();
		JDBCUtil.close(null, null, connection);
		
		PatientDao dao = new PatientDaoImpl();
		Patient patient = new Patient();
		
		patient.setId("id1");
		patient.setPw("1111");
		patient.setNickname("ȯ��1");
		patient.setName("�̸�1");
		patient.setTel("010-1111-1111");
		patient.setBirth("1998-04-14");
		patient.setGender("��");
		patient.setEmail("email1@email.com");
		patient.setPostcode(11111);
		patient.setAddress("����");
		patient.setAddress2("������");
		
		dao.insert(patient);
	}

	
}
