package com.itwillbs.clish.user.mapper;

import com.itwillbs.clish.user.dto.CompanyDTO;
import com.itwillbs.clish.user.dto.UserDTO;

public interface UserMapper {

	int insertUser(UserDTO userDTO);

	int insertCompany(CompanyDTO companyDTO);

	UserDTO selectUserId(String userId);

}
