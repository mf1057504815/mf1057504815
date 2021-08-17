package com.dfby.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Boardtype {

    private Integer boardtypeid;

    private String boardtypename;

   private List<Board> boardList;
}