package article;

import java.sql.Connection;
import java.sql.SQLException;

import article.ArticleDao;
import article.Article;
import sm.logon.jdbcUtil;
import sm.logon.connection.ConnectionProvider;

public class ReadArticleService {
	private static ReadArticleService instance = new ReadArticleService();
	public static ReadArticleService getInstance() {
		return instance;
	}

	public ReadArticleService() {
		// TODO Auto-generated constructor stub
	}
	
	public Article readArticle(int articleId) throws ArticleNotFoundException {
		return selectArticle(articleId,true);
		
	}
	
	private Article selectArticle(int articleId, boolean increaseCount) 
	throws ArticleNotFoundException {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			ArticleDao articleDao = ArticleDao.getInstance();
			Article article = articleDao.selectById(conn, articleId);
			if(article == null) {
				throw new ArticleNotFoundException("게시글이 존재하지 않습니다 : " + articleId);
			}
			if(increaseCount) {
				articleDao.increaseReadCount(conn, articleId);
				article.setReadCount(article.getReadCount()+1);
			}
			return article;
			
		} catch (SQLException e) {
			// TODO: handle exception
			throw new RuntimeException("DB 에러 발생 :" + e.getMessage(),e);
		} finally {
			jdbcUtil.close(conn);
		}
	}
	
	public Article getArticle(int articleId) throws ArticleNotFoundException {
		return selectArticle(articleId,false);
	}

}
