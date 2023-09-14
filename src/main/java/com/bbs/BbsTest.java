package com.bbs;

import java.util.*;

public class BbsTest {
    public static void main(String[] args) {
        BbsDAO dao = new BbsDAO();
        // create(dao);
        list(dao);
    }

    private static void list(BbsDAO dao) {
        List<BbsDTO> list = dao.list();
        Iterator<BbsDTO> iter = list.iterator();
        while (iter.hasNext()) {
            BbsDTO dto = iter.next();
            printBbsDTO(dto); // 사용자 정의 출력 메서드 호출
        }
    }

    private static void printBbsDTO(BbsDTO dto) {
        System.out.println("목록=====================");
        System.out.println("번호:" + dto.getBbsno());
        System.out.println("성명:" + dto.getWname());
        System.out.println("제목:" + dto.getTitle());
        System.out.println("조회수:" + dto.getViewcnt());
        System.out.println("날짜:" + dto.getWdate());
        System.out.println("전체--------------------");
        System.out.println("내용:" + dto.getContent());
        System.out.println("grpno:" + dto.getGrpno());
        System.out.println("indent:" + dto.getIndent());
        System.out.println("ansnum:" + dto.getAnsnum());
    }
}
