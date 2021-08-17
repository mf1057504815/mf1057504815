package com.dfby.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
    private Integer boardid;

    private String boardname;

    private Integer parentid;

    private Integer topicnum;

    private Topic lasttopic;

    //private List<Topic> topicList;
}

