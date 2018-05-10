package article;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import article.Article;
import sm.logon.jdbcUtil;


public class ArticleDao {
	
	private static ArticleDao instance = new ArticleDao();
	public static ArticleDao getInstance() {
		return instance;
	}
	
	private ArticleDao() {}
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from articlesm");
			if(rs.next()) {}
			return rs.getInt(1);
			
		} finally {
			// TODO: handle finally clause
			jdbcUtil.close(rs);
			jdbcUtil.close(stmt);
		}
		
		
	}
	
	public List<Article> select(Connection conn, int firstRow, int endRow) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select article_id, group_id, sequence_no, posting_date,read_count,writer_name,password,title from ("
					+ " select rownum rnum, article_id, group_id, sequence_no,posting_date,read_count, writer_name,password,title from("
					+ " select * from articlesm m order by m.sequence_no desc"
							+ " ) where rownum <=? "
					+ ") where rnum >=?");
			
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, firstRow);
			rs = pstmt.executeQuery();
			if(!rs.next()) {
				return Collections.emptyList();
			}
			List<Article> articleList = new ArrayList<Article>();
			do {
				Article article = makeArticleFromResultSet(rs, false);
				articleList.add(article);
			} while (rs.next());
			return articleList;
			
			
		} finally {
			// TODO: handle finally clause
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
			
		}
	}
	
	private Article makeArticleFromResultSet(ResultSet rs, boolean readContent) throws SQLException {
		Article article = new Article();
		article.setId(rs.getInt("article_id"));
		article.setGroupId(rs.getInt("group_id"));
		article.setSequenceNumber(rs.getString("sequence_no"));
		article.setPostingDate(rs.getTimestamp("posting_date"));
		article.setReadCount(rs.getInt("read_count"));
		article.setWriterName(rs.getString("writer_name"));
		article.setPassword(rs.getString("password"));
		article.setTitle(rs.getString("title"));
		if(readContent) {
			article.setContent(rs.getString("content"));
		}
		return article;
	}
	
	public int insert(Connection conn, Article article) throws SQLException {
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("insert into articlesm"
					+ "(article_id, group_id,sequence_no, posting_date, read_count,"
					+ "writer_name, password, title, content)"
					+ "values (articlesm_id_seq.NEXTVAL,?,?,?,0,?,?,?,?)");
			pstmt.setInt(1, article.getGroupId());
			pstmt.setString(2, article.getSequenceNumber());
			pstmt.setTimestamp(3, new Timestamp(article.getPostingDate().getTime()));
			pstmt.setString(4, article.getWriterName());
			pstmt.setString(5, article.getPassword());
			pstmt.setString(6, article.getTitle());
			pstmt.setString(7, article.getContent());
			int insertedCount = pstmt.executeUpdate();
			
			if(insertedCount >0) {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select articlesm_id_seq.CURRVAL from dual");
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
	
	public Article selectById(Connection conn, int articleId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from articlesm where article_id = ?");
			pstmt.setInt(1, articleId);
			rs = pstmt.executeQuery();
			if(!rs.next()) {
				return null;
			}
			Article article = makeArticleFromResultSet(rs, true);
			return article;
			
		} finally {
			// TODO: handle finally clause
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
			
		}
		
	}
	
	public void increaseReadCount(Connection conn, int articleId) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update articlesm set read_count = read_count +1 where article_id = ?");
			pstmt.setInt(1, articleId);
			pstmt.executeUpdate();
			
		} finally {
			// TODO: handle finally clause
			jdbcUtil.close(pstmt);
			
		}
		
	}
	
	public String selectLastSequenceNumber(Connection conn, 
			String searchMaxSeqNum, String searchMinSeqNum) throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select min(sequence_no) from articlesm "
					+ "where sequence_no < ? and sequence_no >= ?");
			pstmt.setString(1, searchMaxSeqNum);
			pstmt.setString(2, searchMinSeqNum);
			rs = pstmt.executeQuery();
			if(!rs.next()) {
				return null;
			}
			return rs.getString(1);
			
		} finally {
			// TODO: handle finally clause
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
		}
		
	}
	
	public int update(Connection conn,Article article) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update articlesm "
					+ "set title =?, content = ? where article = ?");
			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getContent());
			pstmt.setInt(3, article.getId());
			return pstmt.executeUpdate();
			
		} finally {
			// TODO: handle finally clause
			jdbcUtil.close(pstmt);
		}
		
	}
	
	public void delete(Connection conn, int articleId) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("delete from articlesm"+"where article_id=?");
			pstmt.setInt(1, articleId);
			pstmt.executeUpdate();
			
		} finally {
			// TODO: handle finally clause
			jdbcUtil.close(pstmt);
		}
		
	}
}

