package com.itwillbs.clish.admin.mapper;

import com.itwillbs.clish.admin.dto.UserDTO;

public interface UserMapper {

	UserDTO selectUser(String id);

}
