package dao;

public class Sql {

	//RESERVATION
	public static final String SUBJECT_SELECT_ALL_SQL = "select * from subject";
	public static final String DOCTOR_SELECT_BY_SUBJECT_NAME_SQL = "select d.dcode, d.scode, d.name, d.career, d.tel, d.email from doctor d join subject s on d.scode = s.scode where s.name = ?";
	public static final String DOCTOR_SELECT_BY_DCODE_SQL = "select name, tel, email, career from doctor where dcode = ?";
	public static final String SELECT_SCHEDULE_BY_DCODE_SQL = "select restdate, day from rest r join approval a on r.acode = a.acode where a.dcode = ? and approved='����'";
	
	//CUSTOMER
	public static final String CUSTOMER_INSERT_SQL = "insert into CUSTOMER values(customerseq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
	public static final String CUSTOMER_SELECT_BY_CODE_SQL = "select * from customer where customerseq = ?";
	public static final String CUSTOMER_UPDATE_SQL = "update customer set id = ?, name = ?,"
			+ " password = ?, postcode = ?, address = ?, address2 = ?, phone = ?, email = ? where customerseq = ?";
	public static final String CUSTOMER_DELETE_SQL = "delete from CUSTOMER where customerseq = ?";
	public static final String CUSTOMER_SELECT_CNT_BY_ID_SQL = "select count(*) as cnt from customer where id=?";
	public static final String CUSTOMER_LOGIN_SQL = "select * from customer where id = ? and password = ?";
	
	//jsh
	public static final String RESERVATION_LIST_SELECT_SQL = "select rcode, rsvdate, ds.name, state from (select d.dcode, d.scode, s.name from doctor d join subject on d.scode = s.scode) ds join reservation on r.dcode = ds.dcode where pcode = ? order by rcode desc";
	public static final String RESERVATION_DETAIL_SELECT_SQL = "SELECT a.name, a.tel, b.rsvdate, c.name, d.name FROM patient a INNER JOIN reservation b ON a.pcode = b.pcode INNER JOIN doctor c ON b.dcode = c.dcode INNER JOIN subject d ON c.scode = d.scode WHERE a.pcode = ?";
	public static final String DOCTOR_LIST_SELECT_SQL = "select d.name, s.name from doctor d join subject s on d.scode = s.scode order by s.name asc, d.name asc";
	public static final String DOCTOR_DETAIL_SELECT_SQL = "select d.name, s.name, d.career from doctor d join subject s on d.scode = s.scode where d.dcode = ?";
	public static final String DOCTOR_UPDATE_SQL = "update doctor set pw = ?, postcode = ?, address = ?, address2 = ?, career = ?, tel = ?, email = ? where dcode = ?";
	public static final String APPROVAL_SELECT_SQL = "select * from approval natural join rest where approved = '����' and dcode = ?";
	public static final String APPROVAL_NOT_SELECT_SQL = "select * from approval natural join rest where approved != '����' and dcode = ?";
	public static final String APPROVAL_INSERT_SQL = "insert into approval values (?, ?, sysdate, ?, ?)"; 
	public static final String DOCTOR_RESERVATION_SELECT_SQL = "SELECT b.rcode, b.rsvdate, a.name FROM patient a INNER JOIN reservation b ON a.pcode = b.pcode INNER JOIN doctor c ON b.dcode = c.dcode WHERE c.dcode = ? and to_char(b.rsvdate, 'yyyy-mm-dd') = to_date(?, 'yyyy-mm-dd') order by b.rsvdate asc";


	//odw
	//ȸ������
	public static final String PATIENT_INSERT_SQL = 
			"insert into PATIENT values (pcode.nextval, ?, ?, ?,?,?, to_date(?,'yyyy-mm-dd'),?,?,?,?,?)";
	//ȸ������-���̵��ߺ�Ȯ��
		public static final String PATIENT_SELECT_CNT_BY_ID_SQL =
	         "select count(*) as cnt from patient where id = ?";
	//ȯ�� �α���
	public static final String PATIENT_LOGIN_SQL =
				"select id, pw from patient where id =? and pw = ?";
	//�ǻ� �α���
	public static final String DOCTOR_LOGIN_SQL =
			"select id, pw from doctor where id =? and pw =?";
	//������ �α���
	public static final String MANAGER_LOGIN_SQL =
			"select id, pw from manager where id =? and pw =?";

	//ȯ�� ������������
	public static final String PATIENT_UPDATE_SQL = 
			"update patient set pw = ?, postcode = ?, address = ?, address2 = ?, tel = ?, email = ? where pcode = ?";
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
