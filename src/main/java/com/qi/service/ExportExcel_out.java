package com.qi.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.stereotype.Service;

import com.qi.model.In_danju;
import com.qi.model.Out_danju;

@Service
public class ExportExcel_out {
	
	 private FileOutputStream fos;  
	    private static int NUM = 10000;// 一个sheet的记录数  
	    
	public void export (String[] title,List data,String fileName) throws IOException {
		if (title == null || title.equals("")) {  
            System.out.println("Excel表格 标题(表头)为空");  
        }  
       
        if (data == null || data.equals("")) {  
            System.out.println("没有定义导出数据集合");  
        }  
        if (fileName == null || fileName.equals("")) {  
            System.out.println("没有定义输出文件名");  
        }  
        HSSFWorkbook workbook = null;  
        
        File file=new File("C:\\Users\\brotherQI\\Desktop" + fileName + ".xls");
        try {
			fos = new FileOutputStream(file);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
        
        try {
        workbook = new HSSFWorkbook();// 创建Excel  
        HSSFSheet sheet = null; // 工作表  
        HSSFRow row = null; // 行  
        HSSFCell cell = null; // 行--列  

        Iterator it = data.iterator();  
        int i = 0;  

      
          
        sheet = workbook.createSheet("Sheet0"); // 工作簿  
        row = sheet.createRow(0);  
        for (int j = 0; j < title.length; j++) {  
            cell = row.createCell(j);  
            cell.setCellValue(new HSSFRichTextString(title[j]));  
        }  
        // 逐行添加数据  
        int k = 0;  
        while (it.hasNext()) {  
            if (i / NUM > k) { // 每50000条记录分一页  
                k = i / NUM;  
                sheet = workbook.createSheet("Sheet" + k);  
                row = sheet.createRow(0);  
                for (int j = 0; j < title.length; j++) {  
                    cell = row.createCell(j);  
                    cell.setCellValue(new HSSFRichTextString(title[j]));  
                }  
            }  
            
       
		Out_danju datamap=(Out_danju) it.next();
              
            row = sheet.createRow(i - NUM * k + 1);  

            // 输出数据  
                int j=0;
                cell = row.createCell(j++);  
                cell.setCellValue(new HSSFRichTextString(String.valueOf(datamap.getOut_dnum())));  
                cell = row.createCell(j++);  
                cell.setCellValue(new HSSFRichTextString(String.valueOf(datamap.getProduct().getPnum())));
                cell = row.createCell(j++);  
                cell.setCellValue(new HSSFRichTextString(String.valueOf(datamap.getProduct().getPname())));  
                cell = row.createCell(j++);  
                cell.setCellValue(new HSSFRichTextString(String.valueOf(datamap.getProduct().getModle())));  
                cell = row.createCell(j++);  
                cell.setCellValue(new HSSFRichTextString(String.valueOf(datamap.getProduct().getSize())));  
                cell = row.createCell(j++);  
                cell.setCellValue(new HSSFRichTextString(String.valueOf(datamap.getProduct().getFactory())));  
                cell = row.createCell(j++);  
                cell.setCellValue(new HSSFRichTextString(String.valueOf(datamap.getSnum())));  
                cell = row.createCell(j++);  
                cell.setCellValue(new HSSFRichTextString(String.valueOf(datamap.getNum())));  
                cell = row.createCell(j++);  
                cell.setCellValue(new HSSFRichTextString(String.valueOf(datamap.getOut_person_info().getOut_person())));  
                cell = row.createCell(j++);  

                cell.setCellValue(new HSSFRichTextString(String.valueOf(datamap.getOut_person_info().getOut_company())));  
                cell = row.createCell(j++);  

                cell.setCellValue(new HSSFRichTextString(String.valueOf(datamap.getOut_person_info().getTel()))); 
                cell = row.createCell(j++);  

                cell.setCellValue(new HSSFRichTextString(String.valueOf(datamap.getDate())));
                cell = row.createCell(j++);  

                cell.setCellValue(new HSSFRichTextString(String.valueOf(datamap.getTime())));  




              
                  
            
            i++;  
        }  
        // 写入流  
        workbook.write(fos);  
        fos.flush();  
        fos.close();  
        System.out.println("Excel 文件导出完成");  
        }catch (Exception e) {
        	System.out.println("Excel 文件导出失败");
        	file.delete();
			// TODO: handle exception
		}
   
    }  

 
	

}















