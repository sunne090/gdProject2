package dao;

public class Sql {

	//ȸ������
	public static final String PATIENT_INSERT_SQL = 
			"insert into PATIENT values (pcode.nextval, ?, ?, ?,?,?, to_date(?,'yyyy-mm-dd'),?,?,?,?,?)";
	
	//ȸ������-���̵��ߺ�Ȯ��
		public static final String PATIENT_SELECT_CNT_BY_ID_SQL =
		         "select count(*) as cnt from patient where id = ?";
	
	
		
	//ȯ�� �α���
	public static final String PATIENT_LOGIN_SQL =
			"select * from patient where id =? and pw = ?";
	
	public static final String PATIENT_SELECT_BY_PCODE_SQL =
			"select * from patient where pcode = ?";
	
	//�ǻ� �α���
	public static final String DOCTOR_LOGIN_SQL =
			"select * from doctor where id =? and pw =?";
	
	public static final String DOCTOR_SELECT_BY_DCODE_SQL =
			"select * from doctor where dcode = ?";
	
	//������ �α���
	public static final String MANAGER_LOGIN_SQL =
			"select * from manager where id =? and pw =?";
	
	public static final String MANAGER_SELECT_BY_MCODE_SQL =
			"select * from manager where mcode=?";
	
	
	
	//ȯ�� ������������
	public static final String PATIENT_UPDATE_SQL = 
			"update patient set pw = ?,nickname = ?,postcode = ?,address = ?,address2 = ?,tel = ?,email = ? where pcode = ?";
	
	//ȯ�� Ż��
	public static final String PATIENT_DELETE_SQL =
			"delete from patient where pcode = ?";
	
	
	
	
	//�������� ��ü���
	public static final String NOTICE_SELECT_ALL_SQL =
			"select n.ncode, n.title, m.name, n.writedate, n.cnt "
			+ "from notice n inner join manager "
			+ "on n.mcode = m.mcode order by n.ncode desc";
	
	//�������� �˻�
	public static final String NOTICE_SEARCH_SQL =
			"select n.ncode, n.title, m.name, n.writedate, n.cnt "
			+ "from notice n inner join manager m on n.mcode = m.mcode "
			+ "where n.title like ? or n.content like ? order by n.ncode desc";
	
	//�������� ��ȸ��
	public static final String NOTICE_CNT_SQL =
			"update notice set cnt = cnt+1 where ncode=?";
	
	//�������� �Խñ� �ۼ�
	public static final String NOTICE_INSERT_SQL =
			"insert into notice values (ncode.nextval, ?, ?, ?, to_date(?,'yyyy-mm-dd'), 0)";
	
	//�Խñ� �󼼺���
	public static final String NOTICE_SELECT_BY_NCODE_SQL =
			"select n.title, m.name, n.writedate, n.cnt, n.content "
			+ "from notice n inner join manager m on n.mcode = m.mcode where ncode = ?";
	
	//�������� �Խñ� ����
	public static final String NOTICE_UPDATE_SQL =
			"update notice set title =?, content =? where ncode =?";
	
	
	//�Խñ� ���� ����
	public static final String NOTICE_UPDATE_FILE_SQL =
			"update files set uploaddate=sysdate, name=?, beforename=?, filesize=? where fcode=?";
	
	//�������� �Խñ� ����
	public static final String NOTICE_DELETE_SQL =
			"delete from notice where ncode = ?";
	
	//�������� ���� ����
	public static final String NOTICE_DELETE_FILE_SQL =
			"delete from files where ncode = ?";
	
	//�Խñ� �ۼ� ���� ���ε�
		public static final String NOTICE_INSERT_FILE_SQL =
				"insert into files values(fcode.nextval,?, to_date(?, 'yyyy-mm-dd'), ?,?,?)";

	//�Խñ� �󼼺��� ����
		public static final String NOTICE_SELECT_FILE_BY_NCODE_SQL =
				"select name from files where ncode = ?";


}