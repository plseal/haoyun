
package ssm.blog.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import ssm.blog.entity.Express;
import ssm.blog.service.ExpressService;

@Controller
@RequestMapping("uploadFile")
public class uploadFileController
{
	private static Logger logger = Logger.getLogger(uploadFileController.class);

	@Resource(name="expressService")
	private ExpressService expressService;
	
	public uploadFileController()
	{
	}

	

	

	
	@RequestMapping("upload_express_file")
	public String upload_express_file(MultipartFile fileObj, HttpServletRequest request) throws Exception{
		logger.info("["+this.getClass().getName()+"][upload_express_file][start]");
        Integer cnt_for_update = 0;
        Integer cnt_for_insert = 0;
        Integer cnt_for_row = 0;
		Integer cnt_for_sheet = 0;
		if (fileObj != null){
			if (fileObj.getSize() == 0) {
				return "addFileFailed";
			}
			
			logger.info("["+this.getClass().getName()+"][upload_express_file][SaveFile---strFile.Size]:"+fileObj.getSize());
			
			
			String strTruePath = "";
			
			//上传到服务器
			strTruePath = (new StringBuilder(String.valueOf(request.getRealPath("/")))).append("haoyun\\upload_files\\express\\").toString();

			Date date = new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
			String todayyyyMMddHHmmss = df.format(date);
			String filename = todayyyyMMddHHmmss + ".xlsx";

			String file_with_path = strTruePath+filename;
			logger.info("["+this.getClass().getName()+"][upload_express_file][SaveFile---file_with_path]:"+file_with_path);
			logger.info("["+this.getClass().getName()+"][upload_express_file][SaveFile---strFile.Name]:"+filename);
			SaveFileFromInputStream(fileObj.getInputStream(), strTruePath, filename);
			//System.out.println((new StringBuilder("SaveFile---:")).append(strTruePath).toString());
	        try {

	            File excelFile = new File(file_with_path);
	            FileInputStream is = new FileInputStream(excelFile);
	            Workbook wb = WorkbookFactory.create(is);
				cnt_for_sheet =wb.getNumberOfSheets();
				logger.info("["+this.getClass().getName()+"][upload_express_file][cnt_for_sheet]:"+cnt_for_sheet);
	            Sheet sheet = wb.getSheetAt(cnt_for_sheet-1);
	            Iterator<Row> rows = sheet.rowIterator();
	            Row row;
	            
	            //row 1跳过
	            row = (Row) rows.next();
	            cnt_for_row++;
	            //row 2跳过
	            row = (Row) rows.next();
	            cnt_for_row++;
	            //row 3跳过
	            row = (Row) rows.next();
	            cnt_for_row++;

	            while (rows.hasNext()) {
	                row = (Row) rows.next();
	                cnt_for_row++;
	                if (row.getRowNum() ==0 ) {
	                    continue;
	                }
	                logger.info("["+this.getClass().getName()+"][upload_express_file][cnt_for_row]:"+cnt_for_row);
	                Express express = new Express();
	                Iterator<Cell> cells = row.cellIterator();
	                while (cells.hasNext()) {
	                	Cell cell = (Cell) cells.next();
	                    if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC && cell.getColumnIndex() == 0) {
	                        //book.setCode((int)cell.getNumericCellValue());
	                        //logger.info("["+this.getClass().getName()+"][cell]:"+getCellData(cell));
	                        continue;
	                    }
	                    if (cell.getColumnIndex() == 1) {
	                    	//logger.info("["+this.getClass().getName()+"][cell]:"+getCellData(cell));
	                    	//express.setId(getCellData(cell).toString());
	                    	express.setDate(getCellData(cell).toString());
	                    	continue;
	                    }
	                    if (cell.getColumnIndex() == 2) {
	                    	//logger.info("["+this.getClass().getName()+"][cell]:"+getCellData(cell));
	                    	//express.setDate(getCellData(cell).toString());
	                    	express.setName(getCellData(cell).toString());
	                    	continue;
	                    }
	                    if (cell.getColumnIndex() == 3) {
	                    	//logger.info("["+this.getClass().getName()+"][cell]:"+getCellData(cell));
	                    	express.setNumber(getCellData(cell).toString());
	                    	continue;
	                    }
	                    if (cell.getColumnIndex() == 4) {
	                    	//logger.info("["+this.getClass().getName()+"][cell]:"+getCellData(cell));
	                    	express.setDes(getCellData(cell).toString());
	                    	continue;
	                    }
	                    if (cell.getColumnIndex() == 5) {
	                    	//logger.info("["+this.getClass().getName()+"][cell]:"+getCellData(cell));
	                    	express.setPrice(getCellData(cell).toString());
	                    	continue;
	                    }
	                    if (cell.getColumnIndex() == 6) {
	                    	express.setContent(getCellData(cell).toString());
	                    	//logger.info("["+this.getClass().getName()+"][cell]:"+getCellData(cell));
	                    	continue;
	                    }
	                    if (cell.getColumnIndex() == 7) {
	                    	express.setE_from(getCellData(cell).toString());
	                    	//logger.info("["+this.getClass().getName()+"][cell]:"+getCellData(cell));
	                    	continue;
	                    }
	                    if (cell.getColumnIndex() == 8) {
	                    	express.setRemark(getCellData(cell).toString());
	                    	//logger.info("["+this.getClass().getName()+"][cell]:"+getCellData(cell));
	                    	
	                    }
	                    if (cell.getColumnIndex() == 9) {
	                    	
	                    	//logger.info("["+this.getClass().getName()+"][cell]:"+getCellData(cell));
	                    }

	                }
	                List<Express> expresses = expressService.get_by_number(express.getNumber());
	                if (expresses.size() == 0) {
	                	expressService.insert(express);
	                	cnt_for_insert ++;
	                } else {
	                	express.setId(expresses.get(0).getId());
	                	expressService.update(express);
	                	cnt_for_update ++;
	                }
	                
	                
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
			

			request.setAttribute("cnt_for_insert", cnt_for_insert);
			request.setAttribute("cnt_for_update", cnt_for_update);
		}
		
		logger.info("["+this.getClass().getName()+"][upload_express_file][goto][check_express_insert_bat_result.jsp]");
		logger.info("["+this.getClass().getName()+"][upload_express_file][end]");
		return "../../haoyun/check_express_insert_bat_result";
	}
	

	private Object getCellData(Cell cell) {
	    if(cell == null) {
	        return "";
	    }
	    switch (cell.getCellType()) {
	    case Cell.CELL_TYPE_STRING:
	        return cell.getRichStringCellValue().getString();
	    case Cell.CELL_TYPE_NUMERIC:
	        if (DateUtil.isCellDateFormatted(cell)) {
	            return cell.getDateCellValue();
	        } else {
	            return cell.getNumericCellValue();
	        }
	    case Cell.CELL_TYPE_BOOLEAN:
	        return cell.getBooleanCellValue();
	    case Cell.CELL_TYPE_FORMULA:
	        return "";
	    default:
	        return "";
	    }
	}   

	
	public void SaveFileFromInputStream(InputStream stream, String path, String savefile) throws IOException{
		logger.info("["+this.getClass().getName()+"][SaveFileFromInputStream][start]");
		FileOutputStream fs = new FileOutputStream((new StringBuilder(String.valueOf(path))).append(savefile).toString());
		
		logger.info("["+this.getClass().getName()+"][SaveFileFromInputStream][path][savefile]"+path+savefile);
		byte buffer[] = new byte[0x100000];
		
		for (int byteread = 0; (byteread = stream.read(buffer)) != -1;){
			fs.write(buffer, 0, byteread);
			fs.flush();
		}

		fs.close();
		stream.close();
		logger.info("["+this.getClass().getName()+"][SaveFileFromInputStream][end]");
	}

	
}
