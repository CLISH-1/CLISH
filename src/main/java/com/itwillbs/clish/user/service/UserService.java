package com.itwillbs.clish.user.service;

import org.springframework.stereotype.Service;

import com.itwillbs.clish.user.dto.CompanyDTO;
import com.itwillbs.clish.user.dto.UserDTO;
import com.itwillbs.clish.user.mapper.UserMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {
	
	private final UserMapper userMapper;

    public int registerCompanyUser(UserDTO userDTO, CompanyDTO companyDTO) {
        int userResult = userMapper.insertUser(userDTO);
        int companyResult = userMapper.insertCompany(companyDTO);
        return (userResult > 0 && companyResult > 0) ? 1 : 0;
    }

    public int registerGeneralUser(UserDTO userDTO) {
        return userMapper.insertUser(userDTO);
    }
    
	public UserDTO selectUserId(String userId) {
		return userMapper.selectUserId(userId);
	}


}