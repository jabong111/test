package dao;

import java.sql.Connection;
import java.sql.SQLException;

import dao.MessageDao;
import dao.MessageDaoProvider;
import dao.Message;
import sm.logon.jdbcUtil;
import sm.logon.connection.ConnectionProvider;


public class WriteMessageService {
	private static WriteMessageService instance = new WriteMessageService();
	
	public static WriteMessageService getInstance() {
		return instance;
	}
	
	private WriteMessageService() {
		
	}
	public void write(Message message) throws ServiceException {
		Connection conn = null;
		System.out.println(message.getGuestName());
		System.out.println(message.getPassword());
		System.out.println(message.getMessage());
		try {
			conn = ConnectionProvider.getConnection();
			MessageDao messageDao = MessageDaoProvider.getInstance().getMessageDao();
			messageDao.insert(conn, message);
			} catch (SQLException e) {
				throw new ServiceException("메세지 등록 실패:" + e.getMessage(),e);
			} finally {
				jdbcUtil.close(conn);
			}
	}

}
