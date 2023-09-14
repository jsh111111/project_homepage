package com.poll;

import java.util.*;

public class PollService {

	private PollDAO dao;
	private PollitemDAO idao;

	public PollService() {
		dao = new PollDAO();
		idao = new PollitemDAO();
	}

	public boolean create(PollDTO dto, PollitemDTO idto) {
		boolean flag = false;

		try {
			dao.create(dto); // 설문등록
			idto.setNum(dao.getMaxNum()); // 등록설문 pk -> 항목의 fk
			int size = idto.getItems().length;
			for (int i = 0; i < size; i++) {
				// if (idto.getItems()[i].length() > 0) {
				idto.setItem(idto.getItems()[i]);
				idao.create(idto);
				// }
			}
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	public Vector<PollDTO> getList(Map map) {
		Vector<PollDTO> list = dao.getList(map);
		return list;
	}

	public int total(String col, String word) {
		int total = dao.total(col, word);
		return total;
	}

	public int getMaxNum() {
		int num = dao.getMaxNum();
		return num;
	}

	public PollDTO read(int num) {
		PollDTO dto = null;
		dto = dao.read(num);
		return dto;
	}

	public Vector<PollitemDTO> itemList(int num) {
		Vector<PollitemDTO> list = null;
		list = idao.itemList(num);
		return list;
	}

	public boolean updateCount(String[] itemnum) {
		boolean flag = false;
		flag = idao.updateCount(itemnum);
		return flag;
	}

	public int sumCount(int num) {
		int count = idao.sumCount(num);
		return count;
	}

	public Vector<PollitemDTO> getView(int num) {
		Vector<PollitemDTO> list = idao.getView(num);
		return list;
	}

}
