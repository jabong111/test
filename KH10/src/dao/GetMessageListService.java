package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

import dao.MessageDao;
import dao.MessageDaoProvider;
import dao.Message;
import dao.MessageListView;
import sm.logon.jdbcUtil;
import sm.logon.connection.ConnectionProvider;


public class GetMessageListService {
	private static GetMessageListService instance = 
			new GetMessageListService();
	
	public static GetMessageListService getInstance() {
		return instance;
	}
	
	private GetMessageListService () {
		
	}
	
	private static final int MESSAGE_COUNT_PER_PAGE = 3;
	
	public MessageListView getMessageList(int pageNumber) 
			throws ServiceException {
		Connection conn = null;
		int currentPageNumber = pageNumber;
		try {
			conn = ConnectionProvider.getConnection();
			MessageDao messageDao= MessageDaoProvider.getInstance().getMessageDao();
			
			int messageTotalCount = messageDao.selectCount(conn);
			
			List<Message> messageList = null;
			int firstRow = 0;
			int endRow = 0;
			if(messageTotalCount>0) {
				firstRow = (pageNumber -1) * MESSAGE_COUNT_PER_PAGE +1;
				endRow = firstRow + MESSAGE_COUNT_PER_PAGE-1;
				messageList = messageDao.selectList(conn, firstRow, endRow);
				
			} else {
				currentPageNumber = 0;
				messageList = Collections.emptyList();
			}
			return new MessageListView(messageList, messageTotalCount, currentPageNumber, MESSAGE_COUNT_PER_PAGE, firstRow, endRow);
		} catch (SQLException e) {
			throw new ServiceException ("�޼��� ��� ���ϱ� ���� :"+ e.getMessage(),e);
		} finally {
			jdbcUtil.close(conn);
		}
	}
}