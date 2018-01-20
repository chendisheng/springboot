package cds.com.demo.webapp.controller;

import io.swagger.annotations.*;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import cds.com.demo.webapp.model.User;
import cds.com.demo.webapp.service.IUserService;

import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author edison
 */
@Api(value="用户相关的接口")
@RestController
@RequestMapping("/user")
public class UserController {
	@Autowired
	private IUserService userService;
	/**
	 * 添加用户
	 * @param user 用户对象
	 * @since 2016年9月21日21:01:50
	 */
	@RequestMapping("/add")
	@ApiOperation(notes="添加用户",value="添加一个用户",httpMethod="POST")
	public String add(@ApiParam(name="user",value="user对象") @RequestBody User user){
		return "hello "+ userService.add(user);
	}
	
	/**
	 * 查询所有用户
	 * @since 2016年9月22日20:32:43
	 * @return
	 */
	@RequestMapping("/all")
	@ApiOperation(notes="查询所有用户",value="查询所有有，目前只返回数量",httpMethod="GET")
	@ResponseBody
	public List<User> find(){
		return userService.findAll();
	}


	@RequestMapping("/exportExcel")
	public void exportExcel(HttpServletResponse response) throws Exception{
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet("统计表");
		createTitle(workbook, sheet);
		List<User> entities = (List<User>) userService.findAll();

		//设置日期格式
		HSSFCellStyle style=workbook.createCellStyle();
		style.setDataFormat(HSSFDataFormat.getBuiltinFormat("m/d/yy h:mm"));

		//新增数据行，并且设置单元格数据
		int rowNum = 1;
		for (User user:entities) {

			HSSFRow row = sheet.createRow(rowNum);
			row.createCell(0).setCellValue(user.getId());
			row.createCell(1).setCellValue(user.getUsername());
			row.createCell(2).setCellValue(user.getPsw());
//			HSSFCell cell = row.createCell(3);
//			cell.setCellValue(statisticsInfo.getCurrentdate());
//			cell.setCellStyle(style);
			rowNum++;
		}

		//拼装blobName
		String fileName = "测试表.xlsx";
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		String dateTime = dateFormat.format(new Date());
		String blobName =  dateTime + "/" + UUID.randomUUID().toString().replaceAll("-", "") + "/" + fileName;

		//获取或创建container

		OutputStream out = response.getOutputStream();;
		try {
			response.setHeader("content-Type", "application/vnd.ms-excel");
			response.flushBuffer();
			workbook.write(out);


		} catch (Exception e)
		{
			e.printStackTrace();
		}
		finally{
			if(out != null){
				out.close();
			}
			workbook.close();
		}
	}
	/***
	 * 创建表头
	 * @param workbook
	 * @param sheet
	 */
	private void createTitle(HSSFWorkbook workbook, HSSFSheet sheet)
	{
		HSSFRow row = sheet.createRow(0);
		//设置列宽，setColumnWidth的第二个参数要乘以256，这个参数的单位是1/256个字符宽度
		sheet.setColumnWidth(2, 12*256);
		sheet.setColumnWidth(3, 17*256);

		//设置为居中加粗
		HSSFCellStyle style = workbook.createCellStyle();
		HSSFFont font = workbook.createFont();
		font.setBold(true);
		style.setAlignment(HorizontalAlignment.CENTER);
		style.setFont(font);

		HSSFCell cell;
		cell = row.createCell(0);
		cell.setCellValue("序号");
		cell.setCellStyle(style);

		cell = row.createCell(1);
		cell.setCellValue("用户名");
		cell.setCellStyle(style);

		cell = row.createCell(2);
		cell.setCellValue("密码");
		cell.setCellStyle(style);


	}

}
