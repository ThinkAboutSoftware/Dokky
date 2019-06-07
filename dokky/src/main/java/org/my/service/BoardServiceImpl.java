package org.my.service;
	import java.util.List;

	import org.my.domain.BoardVO;
	import org.my.domain.Criteria;
	import org.my.mapper.BoardMapper;
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
	import lombok.Setter;
	import lombok.extern.log4j.Log4j;

@Log4j
@Service//비즈니스 영역담당 어노테이션
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;//spring4.3이상에서 자동처리//202쪽

	@Override
	public List<BoardVO> getList(Criteria cri) {

		log.info("get List with criteria: " + cri);

		return mapper.getList(cri);
	}
	
	@Override
	public void register(BoardVO board) {

		log.info("register......" + board);

		mapper.insertSelectKey(board);
	}
	
	@Transactional
	@Override
	public BoardVO get(Long num) {

		log.info("get..." + num);
		
		log.info("updateHitCnt..." + num);
		
		mapper.updateHitCnt(num);//조회수 증가
		
		return mapper.read(num);
	}
	@Override
	public BoardVO getModifyForm(Long num) {

		log.info("getModifyForm" + num);
		
		return mapper.read(num);
	}

	@Override
	public boolean modify(BoardVO board) {

		log.info("modify......" + board);

		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {

		log.info("remove...." + bno);

		return mapper.delete(bno) == 1;
	}

	@Override
	public int getTotalCount(Criteria cri) {

		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public int updateLike(Long num) {//좋아요수 증가
		
		return mapper.updateLike(num);
	}
}
