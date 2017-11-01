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
		
		// Sheet 积己
		Sheet sheet = workbook.createSheet("楷遏贸");
		sheet.setDefaultColumnWidth(25);
		Row row = null;
		Cell cell = null;
		int rowCount = 0;
		int cellCount = 0;
		
		// Font 积己
		Font HeadFont = workbook.createFont();
		HeadFont.setBoldweight(Font.BOLDWEIGHT_BOLD);
		
		// 力格 Style 积己
		CellStyle HeadStyle = workbook.createCellStyle();
		HeadStyle.setAlignment(CellStyle.ALIGN_CENTER);
		HeadStyle.setBorderBottom(CellStyle.BORDER_THIN);
		HeadStyle.setBorderLeft(CellStyle.BORDER_THIN);
		HeadStyle.setBorderRight(CellStyle.BORDER_THIN);
		HeadStyle.setBorderTop(CellStyle.BORDER_THIN);
		HeadStyle.setFont(HeadFont);
		
		// 夯巩 Style 积己
		CellStyle BodyStyle = workbook.createCellStyle();
		BodyStyle.setAlignment(CellStyle.ALIGN_CENTER);
		BodyStyle.setBorderBottom(CellStyle.BORDER_THIN);
		BodyStyle.setBorderLeft(CellStyle.BORDER_THIN);
		BodyStyle.setBorderRight(CellStyle.BORDER_THIN);
		BodyStyle.setBorderTop(CellStyle.BORDER_THIN);
		
		// 力格 Cell 积己
		row = sheet.createRow(rowCount++);
		cell = row.createCell(cellCount++);
		cell.setCellValue("捞抚");
		cell.setCellStyle(HeadStyle);
		cell = row.createCell(cellCount++);
		cell.setCellValue("楷遏贸");
		cell.setCellStyle(HeadStyle);
		
		// 单捞磐 Cell 积己
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
