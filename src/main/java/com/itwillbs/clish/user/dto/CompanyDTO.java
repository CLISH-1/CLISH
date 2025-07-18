package com.itwillbs.clish.user.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class CompanyDTO {
    private String userIdx;               
    private String bizRegNo;             
    private String bizFileName;        
    private String bizFilePath;              
}