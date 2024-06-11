package com.aesop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Qna {
   private int no;
   private String title;
   private String content;
   private int lev;
   private int parno;
   private int hits;
   private String resdate;
   private String name;
   private String email;
   private String qnaImg1;
   private String qnaImg2;
   private String qnaImg3;
   private Member member;
}