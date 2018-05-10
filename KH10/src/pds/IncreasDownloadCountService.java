package pds;

import java.sql.Connection;
import java.sql.SQLException;
import pds.PdsItemDao;
import sm.logon.jdbcUtil;
import sm.logon.connection.ConnectionProvider;


public class IncreasDownloadCountService {
	
	private static IncreasDownloadCountService instance = new IncreasDownloadCountService();
	
	public static IncreasDownloadCountService getInstance() {
		return instance;
	}

	private IncreasDownloadCountService() {
		// TODO Auto-generated constructor stub
	}
	
	public boolean increasCount(int id) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			int updatedCount = PdsItemDao.getInstance().increasCount(conn, id);
			return updatedCount == 0? false : true;
			
		} catch (SQLException e) {
			// TODO: handle exception
			throw new RuntimeException("db 처리 에러 발생 :" + e.getMessage(),e);
		} finally {
			jdbcUtil.close(conn);
		}
	}

}
