package com.dfby.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private Integer uid;

    private String uname;

    private String upass;

    private String gender;

    private Date regtime;

    private String head;


}