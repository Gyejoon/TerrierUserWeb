package com.gyejoong.mdmuserweb.util;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelView extends AbstractExcelPOIView{

	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List<Map<String, Object>> listPhones = (List<Map<String, Object>>) model.get("excelList");
		
		// Sheet ����
		Sheet sheet = workbook.createSheet("����ó");
		sheet.setDefaultColumnWidth(25);
		Row row = null;
		Cell cell = null;
		int rowCount = 0;
		int cellCount = 0;
		
		// Font ����
		Font HeadFont = workbook.createFont();
		HeadFont.setBoldweight(Font.BOLDWEIGHT_BOLD);
		
		// ���� Style ����
		CellStyle HeadStyle = workbook.createCellStyle();
		HeadStyle.setAlignment(CellStyle.ALIGN_CENTER);
		HeadStyle.setBorderBottom(CellStyle.BORDER_THIN);
		HeadStyle.setBorderLeft(CellStyle.BORDER_THIN);
		HeadStyle.setBorderRight(CellStyle.BORDER_THIN);
		HeadStyle.setBorderTop(CellStyle.BORDER_THIN);
		HeadStyle.setFont(HeadFont);
		
		// ���� Style ����
		CellStyle BodyStyle = workbook.createCellStyle();
		BodyStyle.setAlignment(CellStyle.ALIGN_CENTER);
		BodyStyle.setBorderBottom(CellStyle.BORDER_THIN);
		BodyStyle.setBorderLeft(CellStyle.BORDER_THIN);
		BodyStyle.setBorderRight(CellStyle.BORDER_THIN);
		BodyStyle.setBorderTop(CellStyle.BORDER_THIN);
		
		// ���� Cell ����
		row = sheet.createRow(rowCount++);
		cell = row.createCell(cellCount++);
		cell.setCellValue("�̸�");
		cell.setCellStyle(HeadStyle);
		cell = row.createCell(cellCount++);
		cell.setCellValue("����ó");
		cell.setCellStyle(HeadStyle);
		
		// ������ Cell ����
		for(Map<String, Object> map : listPhones){
			row = sheet.createRow(rowCount++);
			cellCount = 0;
			cell = row.createCell(cellCount++);
			cell.setCellValue(map.get("name").toString());
			cell.setCellStyle(BodyStyle);
			cell = row.createCell(cellCount++);
			cell.setCellValue(map.get("phone_num").toString());
			cell.setCellStyle(BodyStyle);
		}
	}
	
	@Override
	protected Workbook createWorkbook() {
		return new XSSFWorkbook();
	}

}
