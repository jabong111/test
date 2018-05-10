package pds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.sun.corba.se.spi.ior.MakeImmutable;

import pds.PdsItem;
import sm.logon.jdbcUtil;

public class PdsItemDao {
	
	//싱글톤
	private static PdsItemDao instance = new PdsItemDao();
	public static PdsItemDao getInstance() {
		return instance;
	}
	private PdsItemDao() {
	
		
	}
	
	public int insert(Connection conn, PdsItem item) throws SQLException {
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("insert into pds_item999"
					+ "(pds_item_id, filename, realpath, filesize, downloadcount,"
					+ "description) "
					+ "values (pds_item_id_seq999.NEXTVAL, ?,?,?,0,?)");
			pstmt.setString(1, item.getFileName());
			pstmt.setString(2, item.getRealPath());
			pstmt.setLong(3, item.getFileSize());
			pstmt.setString(4, item.getDescription());
			int inseredCount = pstmt.executeUpdate();
			
			if(inseredCount >0) {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select pds_item_id_seq999.CURRVAL from dual");
				if(rs.next()) {
					return rs.getInt(1);
				}
			}
			return -1;
			
		} finally {
			// TODO: handle finally clause
			jdbcUtil.close(rs);
			jdbcUtil.close(stmt);
			jdbcUtil.close(pstmt);
			
		}
	}
	
	public PdsItem selectById(Connection conn, int itemId) throws SQLException {
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from pds_item999"
					+ "where pds_item_id = ?");
			pstmt.setInt(1, itemId);
			rs = pstmt.executeQuery();
			if(!rs.next()) {
				return null;
			}
			PdsItem item = MakeItemFromResultSet(rs);
			return item;
		} finally {
			// TODO: handle finally clause
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
		}
	}
	
	public PdsItem MakeItemFromResultSet(ResultSet rs) throws SQLException {
		PdsItem item = new PdsItem();
		item.setId(rs.getInt("pds_item_id"));
		item.setFileName(rs.getString("filename"));
		item.setRealPath(rs.getString("realpath"));
		item.setFileSize(rs.getLong("filesize"));
		item.setDownloadCount(rs.getInt("downloadcount"));
		item.setDescription(rs.getString("description"));
		return item;
	}
	
	public int increasCount(Connection conn, int id) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update pds_item999 set downloadcount =  downloadcount + 1 where pds_item_id = ?");
			pstmt.setInt(1, id);
			return pstmt.executeUpdate();
			
		} finally {
			// TODO: handle finally clause
			jdbcUtil.close(pstmt);
			
		}
	}
	
	
	
	
	/*public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from pds_item999");
			rs.next();
			return rs.getInt(1);
			
		} finally {
			// TODO: handle finally clause
			 * 
			jdbcUtil.close(rs);
			jdbcUtil.close(stmt);
		}
	}*/
	
	
	
	
	
}
