package dao;

import java.util.List;

import model.Subject;

public class Test {

	public static void main(String[] args) {
		// TODO �ڵ� ������ �޼ҵ� ����
		ReservationDao rdao = new ReservationDaoImpl();
		List<Subject> subjectList = rdao.selectSubjectAll();
		
		for(Subject s : subjectList) {
			System.out.println(s.getName());
		}
	}

}
