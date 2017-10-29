package com.gyejoong.mdmuserweb.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gyejoong.mdmuserweb.dao.IDao;
import com.gyejoong.mdmuserweb.util.FileUtils;
import com.gyejoong.mdmuserweb.vo.BoardVo;

@Service("BoardService")
public class BoardServiceImpl implements BoardService{

	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void insertFileBoard(BoardVo board, HttpServletRequest request) throws Exception {
		IDao dao = sqlSession.getMapper(IDao.class);
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = multipartHttpServletRequest.getFile(iterator.next());
		
		if(!multipartFile.isEmpty())
			board.setFile_exist("Y");
		else
			board.setFile_exist("N");
		
		dao.BoardWrite(board);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(board, request);
		
		for(Map<String, Object> map : list)
			dao.BoardFileInsert(map);
	}

}
