package common;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.board.FileDao;
import dao.board.FileDaoImpl;
import dao.board.NoticeDao;
import dao.board.NoticeDaoImpl;
import dao.user.PatientDao;
import dao.user.PatientDaoImpl;
import model.board.Files;
import model.board.Notice;
import model.user.Patient;

public class PatientTest {
	
	public static void main(String[] args) {
		
		Connection connection = JDBCUtil.getConnection();
		JDBCUtil.close(null, null, connection);
		
		//PatientDao dao = new PatientDaoImpl();
		//Patient patient = new Patient();
		
		/*patient.setId("asdf");
		patient.setPw("12341234a!");
		patient.setNickname("환자1");
		patient.setName("이름1");
		patient.setTel("010-1111-1111");
		patient.setBirth("1998-04-14");
		patient.setGender("여");
		patient.setEmail("email1@email.com");
		patient.setPostcode(11111);
		patient.setAddress("서울");
		patient.setAddress2("강동구");
		
		dao.insert(patient);
		
		//System.out.println(dao.login("asdf", "12345"));
		
		
		/*Patient patient = new Patient();
		
		patient.setPw("12341234");
		patient.setNickname("환자1");
		patient.setTel("010-9999-9999");
		patient.setEmail("sampleemail@email.com");
		patient.setPostcode(11111);
		patient.setAddress("부천");
		patient.setAddress2("신중동");
		patient.setPcode(8);
		dao.update(patient);*/
		
		//System.out.println(dao.selectByPcode(8));
		
		//dao.delete(8);
		
		//System.out.println(dao.selectByPcode(8));
		
		NoticeDao ndao = new NoticeDaoImpl();
		Notice notice = new Notice();
		
		/*notice.setMcode(1);
		notice.setTitle("테스트용 제목입니다");
		notice.setContent("테스트용 내용입니다");
		
		ndao.insert(notice);*/
		
		/*notice.setTitle("테스트용 제목입니다222");
		notice.setContent("테스트용 내용입니다222");
		notice.setNcode(16);
		
		ndao.update(notice);*/
		
		/*System.out.println("================selectAll()===============");
		
		List<HashMap<String,Object>> list = ndao.selectAll(1);
		
		for (HashMap<String,Object> hashMap : list) {
			System.out.println(hashMap.get("title"));
			System.out.println(hashMap.get("name"));
			System.out.println(hashMap.get("writedate"));
			System.out.println(hashMap.get("cnt"));
		}
		
		List<HashMap<String,Object>> list2 = ndao.selectAll(2);
		
		for (HashMap<String,Object> hashMap : list2) {
			System.out.println(hashMap.get("title"));
			System.out.println(hashMap.get("name"));
			System.out.println(hashMap.get("writedate"));
			System.out.println(hashMap.get("cnt"));
		}
		
		System.out.println("===============selectByNcode()================");
		
		
		List<HashMap<String,Object>> list3 = ndao.selectByNcode(16);
		
		for (HashMap<String,Object> hashMap : list3) {
			System.out.println(hashMap.get("title"));
			System.out.println(hashMap.get("name"));
			System.out.println(hashMap.get("writedate"));
			System.out.println(hashMap.get("cnt"));
		}*/
			
		/*ndao.delete(37);
		
		notice.setTitle("제목");
		notice.setContent("내용");
		notice.setMcode(1);
		
		ndao.insert(notice);*/
		
		
		/*System.out.println("===============selectByTitleContent()================");
		
		List<HashMap<String,Object>> list4 = ndao.selectByTitleContent("22");
		
		for (HashMap<String,Object> hashMap : list4) {
			
			System.out.println(hashMap.get("ncode"));
			System.out.println(hashMap.get("title"));
			System.out.println(hashMap.get("name"));
			System.out.println(hashMap.get("writedate"));
			System.out.println(hashMap.get("cnt"));
		}
		
		notice.setTitle("수정함제목");
		notice.setContent("수정함내용");
		notice.setNcode(38);
		ndao.update(notice);*/
		
		FileDao fdao = new FileDaoImpl();
		//System.out.println(fdao.returnSeq());
		
		//System.out.println(ndao.returnNcode());
		
		List<Files> list = fdao.returnFiles(189);
		for (Files files : list) {
			System.out.println(files.getFcode());
			System.out.println(files.getNcode());
			System.out.println(files.getUploaddate());
			System.out.println(files.getName());
			System.out.println(files.getBeforename());
			System.out.println(files.getFilesize());
		}
		
	}

	
}
