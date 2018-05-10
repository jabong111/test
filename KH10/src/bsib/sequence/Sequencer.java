package bsib.sequence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import sm.logon.jdbcUtil;



public class Sequencer {
	public synchronized static int nextId(Connection conn, String tableName)
	throws SQLException {
		PreparedStatement pstmtSelect = null;
		ResultSet reSelect = null;
		
		PreparedStatement pstmtUpdate = null;
		
		try {
			pstmtSelect = conn.prepareStatement(
					"select MESSAGE_ID from ID_SEQUENCES_BS where TABLE_NAME =?");
					pstmtSelect.setString(1, tableName);
					
					reSelect = pstmtSelect.executeQuery();
					
					if(reSelect.next()) {
						int id = reSelect.getInt(1);
						id++;
						
						pstmtUpdate = conn.prepareStatement(
								"update ID_SEQUENCES_BS set MESSAGE_ID = ? "+
								"where TABLE_NAME = ?");
						pstmtUpdate.setInt(1, id);
						pstmtUpdate.setString(2, tableName);
						pstmtUpdate.executeUpdate();
						
						return id;
					} else {
						pstmtUpdate = conn.prepareStatement(
								"insert into ID_SEQUENCES_BS values (?,?)");
						pstmtUpdate.setString(1, tableName);
						pstmtUpdate.setInt(2, 1);
						pstmtUpdate.executeUpdate();
						
						return 1;
					}
			
		} finally {
			// TODO: handle finally clause
			jdbcUtil.close(reSelect);
			jdbcUtil.close(pstmtSelect);
			jdbcUtil.close(pstmtUpdate);
		}
	}

}
