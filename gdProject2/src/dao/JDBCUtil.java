package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCUtil {
	//��� �����ϱ� ���� �ʿ��� ����
	public static final String driver = "oracle.jdbc.driver.OracleDriver"; //�ڹٷ� ��� ����ϱ� ���� �������ִ� ����̹�
	public static final String url = "jdbc:oracle:thin:@localhost:1521:xe";//�ش��ϴ� �ּ��� db�� ��
	public static final String user = "scott"; //�α��� ���� ���̵�
	public static final String password = "tiger"; //�α��� ���� �н�����
	
	public static Connection getConnection() {
		
		Connection connection = null;
		
		try {
			Class.forName(driver);//����Ŭ ����̹� ���� 
			connection = DriverManager.getConnection(url, user, password); //���ġ�ּ�, �α��� ���� ����̹� �Ŵ��� ���� ������ ���� �����ϴ� ��ü�� ��
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return connection;
	}
	public static void close(ResultSet resultSet, Statement statement, Connection connection) { 
		//��Ʈ��ũ ��� �� ���� �� ���ҽ� ó���ؾ� ��
		//���ҽ� ó���� �� ���ϸ� ����, DB �ӵ��� ���ɿ� ������ ���� �� ����
		if(resultSet != null) { 
			try {
				if(!resultSet.isClosed()) { //resultSet�� �������� ������ �ݱ�
					resultSet.close();
				}
			} catch(Exception e) {
				System.out.println("resultSet close ����");
			} finally {
				
				resultSet = null;
			}
		}
		
		if(statement != null) { 
			try {
				if(!statement.isClosed()) { //statement�� �������� ������ �ݱ�
					statement.close();
				}
			} catch(Exception e) {
				System.out.println("statement close ����");
			} finally {
				
				statement = null;
			}
		}
		
		if(connection != null) { 
			try {
				if(!connection.isClosed()) { //connection�� �������� ������ �ݱ�
					connection.close();
				}
			} catch(Exception e) {
				System.out.println("connection close ����");
			} finally {
				
				connection = null;
			}
		}
	}
}
