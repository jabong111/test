package pds;

import java.sql.Connection;
import java.sql.SQLException;

import pds.PdsItemDao;
import pds.AddRequest;
import pds.PdsItem;
import sm.logon.jdbcUtil;
import sm.logon.connection.ConnectionProvider;

public class AddPdsItemService {
	private static AddPdsItemService instance = new AddPdsItemService();
	public static AddPdsItemService getInstance() {
		return instance;
	}
	private AddPdsItemService() {
		
	}
	
	public PdsItem add(AddRequest request) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			PdsItem pdsItem = request.toPdsItem();
			int id = PdsItemDao.getInstance().insert(conn, pdsItem);
			if( id == -1) {
				jdbcUtil.rollback(conn);
				throw new RuntimeException("db 삽입 안됨");
			}
			pdsItem.setId(id);
			conn.commit();
			return pdsItem;
			
		} catch (SQLException e) {
			// TODO: handle exception
			jdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			if(conn != null) {
				try {
					conn.setAutoCommit(true);
					
				} catch (SQLException e) {
					// TODO: handle exception
				}
			}
			jdbcUtil.close(conn);
		}
	}
}
