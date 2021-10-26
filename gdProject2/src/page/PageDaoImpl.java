package page;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dao.JDBCUtil;
import dao.Sql;

public class PageDaoImpl implements PageDao {

	@Override
	public int getCount(int pcode) {
		// TODO �ڵ� ������ �޼ҵ� ����
		Connection connection = null;
		PreparedStatement pStatement = null;
		ResultSet resultSet = null;
		int cnt = -1;
		try {
			connection = JDBCUtil.getConnection();
			pStatement = connection.prepareStatement(Sql.RESERVATION_COUNT_PCODE_SQL);
			pStatement.setInt(1, pcode);
			resultSet = pStatement.executeQuery();
			
			if(resultSet.next()) {
				cnt = resultSet.getInt("cnt");
			}

			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(resultSet, pStatement, connection);
			
		}
		return cnt;
	}


}
