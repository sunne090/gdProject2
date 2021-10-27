package common;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.board.NoticeDao;
import dao.board.NoticeDaoImpl;
import dao.user.PatientDao;
import dao.user.PatientDaoImpl;
import model.user.Patient;

public class PatientTest {
	
	public static void main(String[] args) {
		
		Connection connection = JDBCUtil.getConnection();
		JDBCUtil.close(null, null, connection);
		
		PatientDao dao = new PatientDaoImpl();
		Patient patient = new Patient();
		
		patient.setId("asdf");
		patient.setPw("12341234a!");
		patient.setNickname("ȯ��1");
		patient.setName("�̸�1");
		patient.setTel("010-1111-1111");
		patient.setBirth("1998-04-14");
		patient.setGender("��");
		patient.setEmail("email1@email.com");
		patient.setPostcode(11111);
		patient.setAddress("����");
		patient.setAddress2("������");
		
		//dao.insert(patient);
		
		//System.out.println(dao.login("asdf", "12345"));
		
		
		/*Patient patient = new Patient();
		
		patient.setPw("12341234");
		patient.setNickname("ȯ��1");
		patient.setTel("010-9999-9999");
		patient.setEmail("sampleemail@email.com");
		patient.setPostcode(11111);
		patient.setAddress("��õ");
		patient.setAddress2("���ߵ�");
		patient.setPcode(8);
		dao.update(patient);*/
		
		//System.out.println(dao.selectByPcode(8));
		
		//dao.delete(8);
		
		//System.out.println(dao.selectByPcode(8));	
	
	}

	
}
