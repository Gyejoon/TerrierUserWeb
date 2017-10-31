package com.gyejoong.mdmuserweb.util;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelView extends AbstractExcelPOIView{

	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List<Map<String, Object>> listPhones = (List<Map<String, Object>>) model.get("excelList");
		
		//Sheet ����
		Sheet sheet = workbook.createSheet("����ó");
		Row row = null;
		int rowCount = 0;
		int cellCount = 0;
		
		// ���� Cell ����
		row = sheet.createRow(rowCount++);
		
		row.createCell(cellCount++).setCellValue("�̸�");
		row.createCell(cellCount++).setCellValue("����ó");
		
		// ������ Cell ����
		for(Map<String, Object> map : listPhones){
			row = sheet.createRow(rowCount++);
			cellCount = 0;
			row.createCell(cellCount++).setCellValue(map.get("name").toString());
			row.createCell(cellCount++).setCellValue(map.get("phone_num").toString());
		}
	}
	
	@Override
	protected Workbook createWorkbook() {
		return new XSSFWorkbook();
	}

}
