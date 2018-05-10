package article;

import java.sql.Connection;
import java.sql.SQLException;

import article.ArticleDao;
import article.Article;
import article.UpdateRequest;
import sm.logon.jdbcUtil;
import sm.logon.connection.ConnectionProvider;


public class UpdateAricleService {
	private static UpdateAricleService instance = new UpdateAricleService();
	
	public static UpdateAricleService getInstance() {
		return instance;
	}
	private UpdateAricleService() {}
	
	public Article update(UpdateRequest updateRequest) 
			throws ArticleNotFoundException, InvalidPasswordException {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			ArticleCheckHelper checkHelper = new ArticleCheckHelper();
			checkHelper.checkExistsAndPassword
			(conn, updateRequest.getArticleId(), updateRequest.getPassword());
			
			Article updateArticle = new Article();
			updateArticle.setId(updateRequest.getArticleId());
			updateArticle.setTitle(updateRequest.getTitle());
			updateArticle.setContent(updateRequest.getContent());
			
			ArticleDao articleDao = ArticleDao.getInstance();
			int updateCount = articleDao.update(conn, updateArticle);
			if(updateCount ==0) {
				throw new ArticleNotFoundException("게시글이 존재하지 않습니다 :" + updateRequest.getArticleId());
			}
			
			Article article = articleDao.selectById(conn, updateRequest.getArticleId());
			conn.commit();
			return article;
			
			
		} catch (SQLException e) {
			jdbcUtil.rollback(conn);
			throw new RuntimeException("db 에러 발생 : " + e.getMessage(),e);
			// TODO: handle exception
		} catch(ArticleNotFoundException e) {
			jdbcUtil.rollback(conn);
			throw e;
		} catch (InvalidPasswordException e) {
			jdbcUtil.rollback(conn);
			throw e;
		} finally {
			if(conn != null) {
				try {
					conn.setAutoCommit(true);
					
				} catch (SQLException e) {
					// TODO: handle exception
				}
				jdbcUtil.close(conn);
			}
		}
	}

}
