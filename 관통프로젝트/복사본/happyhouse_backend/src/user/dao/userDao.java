package user.dao;

import java.sql.SQLException;
import java.util.List;

import user.dto.userDto;

public interface userDao {	
	String idCheck(String userId) throws SQLException;
	int joinUser(userDto userDto) throws SQLException;
	userDto getLoginUser(String id, String pwd);
	userDto getUserInfo(String id);
	List<userDto> listUser() throws SQLException;
	int doUpdate(String userId,String userpwd, String username);
	
}
