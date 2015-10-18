package com.enclothe_core.sqlquerybuilder;

import java.io.Console;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.enclothe_core.sqlquerybuilder.impl.QbFactoryImp;
import com.enclothe_core.sqlquerybuilder.interfaces.QbFactory;
import com.enclothe_core.sqlquerybuilder.interfaces.QbInsert;

public class SqlQueryBuilderMain {
	
	private static final String FILE_PATH = "C:/Users/Jothiram/query.xlsx";
	// The name of the file to create.
    static String fileName = "C:/Users/Jothiram/query.txt";
    static FileOutputStream outputStream = null;
	public static void main(String args[]) throws SQLException, ClassNotFoundException {
		List<HashMap<String, List<HashMap<String, String>>>> enclotheList = getStudentsListFromExcel(args);
/*		for (HashMap<String, List<HashMap<String, String>>> hashMap : enclotheList) {
			for (Map.Entry<String, List<HashMap<String, String>>> entry : hashMap.entrySet()) {
				String key = entry.getKey();
				List<HashMap<String, String>> list = entry.getValue();
				for (HashMap<String, String> hashMap2 : list) {
					for (Map.Entry<String, String> vEntry : hashMap2.entrySet()) {
						System.out.println("key : "+vEntry.getKey()+", val : "+vEntry.getValue());
					}
				}
			}
		}
*/		QbFactory fac = new QbFactoryImp();
		insertTests(fac, enclotheList);

	}
	
	static void insertTests(QbFactory fac, List<HashMap<String, List<HashMap<String, String>>>> enclotheList)
	{
		QbInsert insert, insertXref = null;
		try {
			outputStream =
			        new FileOutputStream(fileName);
		
		for (int i = 0; i < enclotheList.size(); i++) {
			HashMap<String, List<HashMap<String, String>>>  tables = enclotheList.get(i);
			for (Map.Entry<String, List<HashMap<String, String>>> entry : tables.entrySet()) {
				if (entry.getKey().contains("CATEGORY")) {
					List<HashMap<String, String>> rowList = tables.get(entry.getKey());
					for (int j = 0; j < rowList.size(); j++) {
						// insert query for BLC_CATEGORY
			   			insert = fac.newInsertQuery();
						HashMap<String, String> v = rowList.get(j);
						for (Map.Entry<String, String> vEntry : v.entrySet()) {
							if(vEntry.getKey().equals("")){
							}else{
								insert.set(fac.newStdField(vEntry.getKey()), vEntry.getValue());
							}
						}
						insert.inTable(entry.getKey());
						
			   			//studentList.get(i).getTabName()
			   			//System.out.println("BLC_CATEGORY : "+insert.getQueryString());
			   			outputStream.write(insert.getQueryString().getBytes());
			   			outputStream.write(System.getProperty("line.separator").getBytes());
			   			
			   		   // insert query for BLC_CATEGORY_XREF
						insertXref = fac.newInsertQuery();
						if (v.containsKey("DEFAULT_PARENT_CATEGORY_ID")) {
							insertXref.set(fac.newStdField("SUB_CATEGORY_ID"), v.get("CATEGORY_ID"));
							insertXref.set(fac.newStdField("CATEGORY_ID"), v.get("DEFAULT_PARENT_CATEGORY_ID"));
							insertXref.set(fac.newStdField("DISPLAY_ORDER"), String.valueOf(j));
							insertXref.inTable("BLC_CATEGORY_XREF");
							
							//studentList.get(i).getTabName()
				   			//System.out.println("BLC_CATEGORY_XREF : "+insertXref.getQueryString());
				   			outputStream.write(insertXref.getQueryString().getBytes());
				   			outputStream.write(System.getProperty("line.separator").getBytes());
						}
					}
				}else if (entry.getKey().contains("OPTION")) {
					List<HashMap<String, String>> rowList = tables.get(entry.getKey());
					for (int j = 0; j < rowList.size(); j++) {
						// insert query for BLC_PRODUCT_OPTION
			   			insert = fac.newInsertQuery();
						HashMap<String, String> v = rowList.get(j);
						for (Map.Entry<String, String> vEntry : v.entrySet()) {
							if(vEntry.getKey().equals("PRODUCT_ID")){
							}else if(vEntry.getKey().equals("SKU_ID")) {
							}else if(vEntry.getKey().equals("PRODUCT_OPTION_VALUE_ID")){
							}else if(vEntry.getKey().equals("ATTRIBUTE_VALUE")){
							}else if(vEntry.getKey().equals("DISPLAY_ORDER")){
							}else{
								insert.set(fac.newStdField(vEntry.getKey()), vEntry.getValue());	
							}
						}
						insert.inTable(entry.getKey());
						
			   			//studentList.get(i).getTabName()
						//System.out.println("BLC_PRODUCT : "+insert.getQueryString());
						outputStream.write(insert.getQueryString().getBytes());
						outputStream.write(System.getProperty("line.separator").getBytes());
						
						// insert query for BLC_PRODUCT_OPTION_VALUE
						insertXref = fac.newInsertQuery();
						if (v.containsKey("PRODUCT_OPTION_VALUE_ID")) {
							insertXref.set(fac.newStdField("PRODUCT_OPTION_VALUE_ID"), v.get("PRODUCT_OPTION_VALUE_ID"));
							insertXref.set(fac.newStdField("ATTRIBUTE_VALUE"), v.get("ATTRIBUTE_VALUE"));
							insertXref.set(fac.newStdField("DISPLAY_ORDER"), v.get("DISPLAY_ORDER"));
							insertXref.set(fac.newStdField("PRODUCT_OPTION_ID"), v.get("PRODUCT_OPTION_ID"));
							insertXref.inTable("BLC_PRODUCT_OPTION_VALUE");
							
							//studentList.get(i).getTabName()
				   			//System.out.println("ENC_MATERIAL : "+insertXref.getQueryString());
				   			outputStream.write(insertXref.getQueryString().getBytes());
				   			outputStream.write(System.getProperty("line.separator").getBytes());
						}
						
						// insert query for BLC_PRODUCT_OPTION_XREF
						insertXref = fac.newInsertQuery();
						if (v.containsKey("PRODUCT_ID")) {
							insertXref.set(fac.newStdField("PRODUCT_OPTION_ID"), v.get("PRODUCT_OPTION_ID"));
							insertXref.set(fac.newStdField("PRODUCT_ID"), v.get("PRODUCT_ID"));
							insertXref.inTable("BLC_PRODUCT_OPTION_XREF");
							
							//studentList.get(i).getTabName()
				   			//System.out.println("ENC_MATERIAL : "+insertXref.getQueryString());
				   			outputStream.write(insertXref.getQueryString().getBytes());
				   			outputStream.write(System.getProperty("line.separator").getBytes());
						}
						
						// insert query for BLC_SKU_OPTION_VALUE_XREF
						insertXref = fac.newInsertQuery();
						if (v.containsKey("SKU_ID")) {
							insertXref.set(fac.newStdField("PRODUCT_OPTION_VALUE_ID"), v.get("PRODUCT_OPTION_VALUE_ID"));
							insertXref.set(fac.newStdField("SKU_ID"), v.get("SKU_ID"));
							insertXref.inTable("BLC_SKU_OPTION_VALUE_XREF");
							
							//studentList.get(i).getTabName()
				   			//System.out.println("ENC_MATERIAL : "+insertXref.getQueryString());
				   			outputStream.write(insertXref.getQueryString().getBytes());
				   			outputStream.write(System.getProperty("line.separator").getBytes());
						}
			   			
					}
				}else if (entry.getKey().contains("PRODUCT")) {
					List<HashMap<String, String>> rowList = tables.get(entry.getKey());
					for (int j = 0; j < rowList.size(); j++) {
						// insert query for BLC_PRODUCT
			   			insert = fac.newInsertQuery();
						HashMap<String, String> v = rowList.get(j);
						for (Map.Entry<String, String> vEntry : v.entrySet()) {
							if(vEntry.getKey().equals("")){
							}else if(vEntry.getKey().equals("CATEGORY")) {
//							}else if(vEntry.getKey().equals("TYPE")){
							}else{
								insert.set(fac.newStdField(vEntry.getKey()), vEntry.getValue());	
							}
						}
						insert.inTable(entry.getKey());
						
			   			//studentList.get(i).getTabName()
						//System.out.println("BLC_PRODUCT : "+insert.getQueryString());
						outputStream.write(insert.getQueryString().getBytes());
						outputStream.write(System.getProperty("line.separator").getBytes());


						insertXref = fac.newInsertQuery();
						// insert query for ENC_MATERIAL
						if (v.get("CATEGORY").contains("Mat")) {//v.get("TYPE")
							insertXref.set(fac.newStdField("PRODUCT_ID"), v.get("PRODUCT_ID"));
							if (v.get("URL").contains("blouse")) {
//								System.out.println("mat blouse:"+v.get("URL"));
								insertXref.set(fac.newStdField("TYPE"), "blouse");
							}else if (v.get("URL").contains("chud")) {
//								System.out.println("mat chud:"+v.get("URL"));
								insertXref.set(fac.newStdField("TYPE"), "chud");
							}
							insertXref.set(fac.newStdField("IS_DUMMY"), String.valueOf(j));
							insertXref.inTable("ENC_MATERIAL");
							
							//studentList.get(i).getTabName()
				   			//System.out.println("ENC_MATERIAL : "+insertXref.getQueryString());
				   			outputStream.write(insertXref.getQueryString().getBytes());
				   			outputStream.write(System.getProperty("line.separator").getBytes());
				   		// insert query for ENC_DESIGN
						}else if (v.get("CATEGORY").contains("Des")) {//v.get("TYPE")
							insertXref.set(fac.newStdField("PRODUCT_ID"), v.get("PRODUCT_ID"));
							if (v.get("URL").contains("blouse")) {
//								System.out.println("des blouse:"+v.get("URL"));
								insertXref.set(fac.newStdField("TYPE"), "blouse");
							}else if (v.get("URL").contains("chud")) {
//								System.out.println("des chud:"+v.get("URL"));
								insertXref.set(fac.newStdField("TYPE"), "chud");
							}
							insertXref.set(fac.newStdField("CATEGORY"), v.get("CATEGORY"));
							insertXref.inTable("ENC_DESIGN");
							
							outputStream.write(insertXref.getQueryString().getBytes());
				   			outputStream.write(System.getProperty("line.separator").getBytes());
				   		// insert query for ENC_TAILOR
						}else if (v.get("CATEGORY").contains("Tail")) {
							insertXref.set(fac.newStdField("PRODUCT_ID"), v.get("PRODUCT_ID"));
							insertXref.set(fac.newStdField("SP_ID"), "1");
							insertXref.inTable("ENC_TAILOR");
							
							outputStream.write(insertXref.getQueryString().getBytes());
				   			outputStream.write(System.getProperty("line.separator").getBytes());
						}
						
						// insert query for BLC_CATEGORY_PRODUCT_XREF
						insertXref = fac.newInsertQuery();
						if (v.containsKey("DEFAULT_CATEGORY_ID")) {
							insertXref.set(fac.newStdField("PRODUCT_ID"), v.get("PRODUCT_ID"));
							insertXref.set(fac.newStdField("CATEGORY_ID"), v.get("DEFAULT_CATEGORY_ID"));
							insertXref.set(fac.newStdField("DISPLAY_ORDER"), String.valueOf(j+1));
							insertXref.inTable("BLC_CATEGORY_PRODUCT_XREF");
							
							//studentList.get(i).getTabName()
				   			//System.out.println("ENC_MATERIAL : "+insertXref.getQueryString());
				   			outputStream.write(insertXref.getQueryString().getBytes());
				   			outputStream.write(System.getProperty("line.separator").getBytes());
						}
						
					}
				}else if (entry.getKey().contains("SKU")) {
					List<HashMap<String, String>> rowList = tables.get(entry.getKey());
					for (int j = 0; j < rowList.size(); j++) {
						// insert query for BLC_SKU
			   			insert = fac.newInsertQuery();
						HashMap<String, String> v = rowList.get(j);
						for (Map.Entry<String, String> vEntry : v.entrySet()) {
								insert.set(fac.newStdField(vEntry.getKey()), vEntry.getValue());
						}
						insert.inTable(entry.getKey());
						
			   			//studentList.get(i).getTabName()
						//System.out.println("BLC_PRODUCT : "+insert.getQueryString());
						outputStream.write(insert.getQueryString().getBytes());
						outputStream.write(System.getProperty("line.separator").getBytes());
						
						// insert query for BLC_PRODUCT_SKU_XREF
						insertXref = fac.newInsertQuery();
						if (v.containsKey("DEFAULT_PRODUCT_ID")) {
							insertXref.set(fac.newStdField("SKU_ID"), v.get("SKU_ID"));
							insertXref.set(fac.newStdField("PRODUCT_ID"), v.get("DEFAULT_PRODUCT_ID"));
							insertXref.inTable("BLC_PRODUCT_SKU_XREF");
							
							//studentList.get(i).getTabName()
				   			//System.out.println("ENC_MATERIAL : "+insertXref.getQueryString());
				   			outputStream.write(insertXref.getQueryString().getBytes());
				   			outputStream.write(System.getProperty("line.separator").getBytes());
						}
			   			
					}
				}else if (entry.getKey().contains("MEDIA")) {
					List<HashMap<String, String>> rowList = tables.get(entry.getKey());
					for (int j = 0; j < rowList.size(); j++) {
						// insert query for BLC_MEDIA
			   			insert = fac.newInsertQuery();
						HashMap<String, String> v = rowList.get(j);
						for (Map.Entry<String, String> vEntry : v.entrySet()) {
							if (!vEntry.getKey().contains("SKU")) {
								insert.set(fac.newStdField(vEntry.getKey()), vEntry.getValue());
							}
						}
						insert.inTable(entry.getKey());
						
			   			//studentList.get(i).getTabName()
						//System.out.println("BLC_PRODUCT : "+insert.getQueryString());
						outputStream.write(insert.getQueryString().getBytes());
						outputStream.write(System.getProperty("line.separator").getBytes());
			   			
						// insert query for BLC_SKU_MEDIA_MAP
						insertXref = fac.newInsertQuery();
						if (v.containsKey("BLC_SKU_SKU_ID")) {
							for (Map.Entry<String, String> vEntry : v.entrySet()) {
								if (vEntry.getKey().contains("SKU")) {
									insertXref.set(fac.newStdField(vEntry.getKey()), vEntry.getValue());
								}else if (vEntry.getKey().contains("MEDIA")) {
									insertXref.set(fac.newStdField(vEntry.getKey()), vEntry.getValue());
								}else if (vEntry.getKey().contains("ALT")) {
									insertXref.set(fac.newStdField("MAP_KEY"), vEntry.getValue());
								}
							}
							insertXref.inTable("BLC_SKU_MEDIA_MAP");
							
							//studentList.get(i).getTabName()
				   			//System.out.println("ENC_MATERIAL : "+insertXref.getQueryString());
				   			outputStream.write(insertXref.getQueryString().getBytes());
				   			outputStream.write(System.getProperty("line.separator").getBytes());
						}
					}
				}else if (entry.getKey().contains("FIELD")) {
					List<HashMap<String, String>> rowList = tables.get(entry.getKey());
					for (int j = 0; j < rowList.size(); j++) {
						// insert query for BLC_FIELD
			   			insert = fac.newInsertQuery();
						HashMap<String, String> v = rowList.get(j);
						for (Map.Entry<String, String> vEntry : v.entrySet()) {
							if(vEntry.getKey().equals("SEARCHABLE_FIELD_TYPE")){
							}else if(vEntry.getKey().equals("SEARCH_FACET_ID")) {
							}else if(vEntry.getKey().equals("LABEL")){
							}else if(vEntry.getKey().equals("SHOW_ON_SEARCH")){
							}else if(vEntry.getKey().equals("MULTISELECT")){
							}else if(vEntry.getKey().equals("SEARCH_DISPLAY_PRIORITY")) {
							}else if(vEntry.getKey().equals("CATEGORY_SEARCH_FACET_ID")){
							}else if(vEntry.getKey().equals("CATEGORY_ID")){
							}else if(vEntry.getKey().equals("SEQUENCE")){
							}else if(vEntry.getKey().equals("SEARCH_FACET_RANGE_ID")){
							}else if(vEntry.getKey().equals("MIN_VALUE")){
							}else if(vEntry.getKey().equals("MAX_VALUE")){
							}else{
								insert.set(fac.newStdField(vEntry.getKey()), vEntry.getValue());	
							}
						}
						insert.inTable(entry.getKey());
						
			   			//studentList.get(i).getTabName()
						//System.out.println("BLC_PRODUCT : "+insert.getQueryString());
						outputStream.write(insert.getQueryString().getBytes());
						outputStream.write(System.getProperty("line.separator").getBytes());
						
						// insert query for BLC_FIELD_SEARCH_TYPES
						insertXref = fac.newInsertQuery();
						if (v.containsKey("SEARCHABLE_FIELD_TYPE")) {
							insertXref.set(fac.newStdField("FIELD_ID"), v.get("FIELD_ID"));
							insertXref.set(fac.newStdField("SEARCHABLE_FIELD_TYPE"), v.get("SEARCHABLE_FIELD_TYPE"));
							insertXref.inTable("BLC_FIELD_SEARCH_TYPES");
							
							//studentList.get(i).getTabName()
				   			//System.out.println("ENC_MATERIAL : "+insertXref.getQueryString());
				   			outputStream.write(insertXref.getQueryString().getBytes());
				   			outputStream.write(System.getProperty("line.separator").getBytes());
						}
						
						// insert query for BLC_SEARCH_FACET
						insertXref = fac.newInsertQuery();
						if (v.containsKey("SEARCH_FACET_ID")) {
							insertXref.set(fac.newStdField("SEARCH_FACET_ID"), v.get("SEARCH_FACET_ID"));
							insertXref.set(fac.newStdField("FIELD_ID"), v.get("FIELD_ID"));
							insertXref.set(fac.newStdField("LABEL"), v.get("LABEL"));
							insertXref.set(fac.newStdField("SHOW_ON_SEARCH"), v.get("SHOW_ON_SEARCH"));
							insertXref.set(fac.newStdField("MULTISELECT"), v.get("MULTISELECT"));
							insertXref.set(fac.newStdField("SEARCH_DISPLAY_PRIORITY"), v.get("SEARCH_DISPLAY_PRIORITY"));
							insertXref.inTable("BLC_SEARCH_FACET");
							
							//studentList.get(i).getTabName()
				   			//System.out.println("ENC_MATERIAL : "+insertXref.getQueryString());
				   			outputStream.write(insertXref.getQueryString().getBytes());
				   			outputStream.write(System.getProperty("line.separator").getBytes());
						}
						
						// insert query for BLC_CAT_SEARCH_FACET_XREF
						insertXref = fac.newInsertQuery();
						if (v.containsKey("CATEGORY_SEARCH_FACET_ID")) {
							insertXref.set(fac.newStdField("CATEGORY_SEARCH_FACET_ID"), v.get("CATEGORY_SEARCH_FACET_ID"));
							insertXref.set(fac.newStdField("CATEGORY_ID"), v.get("CATEGORY_ID"));
							insertXref.set(fac.newStdField("SEARCH_FACET_ID"), v.get("SEARCH_FACET_ID"));
							insertXref.set(fac.newStdField("SEQUENCE"), v.get("SEQUENCE"));
							insertXref.inTable("BLC_CAT_SEARCH_FACET_XREF");
							
							//studentList.get(i).getTabName()
				   			//System.out.println("ENC_MATERIAL : "+insertXref.getQueryString());
				   			outputStream.write(insertXref.getQueryString().getBytes());
				   			outputStream.write(System.getProperty("line.separator").getBytes());
						}
						
						// insert query for BLC_SEARCH_FACET_RANGE
						insertXref = fac.newInsertQuery();
						if (v.containsKey("SEARCH_FACET_RANGE_ID")) {
							insertXref.set(fac.newStdField("SEARCH_FACET_RANGE_ID"), v.get("SEARCH_FACET_RANGE_ID"));
							insertXref.set(fac.newStdField("SEARCH_FACET_ID"), v.get("SEARCH_FACET_ID"));
							insertXref.set(fac.newStdField("MIN_VALUE"), v.get("MIN_VALUE"));
							insertXref.set(fac.newStdField("MAX_VALUE"), v.get("MAX_VALUE"));
							insertXref.inTable("BLC_SEARCH_FACET_RANGE");
							
							//studentList.get(i).getTabName()
				   			//System.out.println("ENC_MATERIAL : "+insertXref.getQueryString());
				   			outputStream.write(insertXref.getQueryString().getBytes());
				   			outputStream.write(System.getProperty("line.separator").getBytes());
						}
			   			
					}
				}
			}
		   }
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			// Always close files.
         	try {
				outputStream.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}


	private static List<HashMap<String, List<HashMap<String, String>>>> getStudentsListFromExcel(String[] args) {
				List<HashMap<String, List<HashMap<String, String>>>> enclotheList = new ArrayList<HashMap<String, List<HashMap<String, String>>>>();
				HashMap<String, List<HashMap<String, String>>> tablesMap;
				List<HashMap<String, String>> rowList = null;
				String TableName = "", ColumnName0 = "", ColumnName1 = "", ColumnName2 = "", ColumnName3 = "", ColumnName4 = "", ColumnName5 = "", ColumnName6 = "",
						ColumnName7 = "", ColumnName8 = "", ColumnName9 = "", ColumnName10 = "", ColumnName11 = "", ColumnName12 = "", ColumnName13 = "", ColumnName14 = "", 
						ColumnName15 = "", ColumnName16 = "", ColumnName17 = "", ColumnName18 = ""; 
		        FileInputStream fis = null;
		        try {
		            fis = new FileInputStream(FILE_PATH);
		 
		            // Using XSSF for xlsx format, for xls use HSSF
		            Workbook workbook = new XSSFWorkbook(fis);
		 
		            int numberOfSheets = workbook.getNumberOfSheets();
		 
		            //looping over each workbook sheet
		            for (int i = 0; i < numberOfSheets; i++) {
		            	tablesMap = new HashMap<String, List<HashMap<String, String>>>();
		            	rowList = new ArrayList<HashMap<String, String>>();
		                Sheet sheet = workbook.getSheetAt(i);
		                Iterator rowIterator = sheet.iterator();
		                int j = 0;
		                boolean checked = false;
		                //iterating over each row
		                while (rowIterator.hasNext()) {
		                	if (j == 0) {
		                		/*c = new ColumnName();
		                		
		                		Row row = (Row) rowIterator.next();
			                    Iterator cellIterator = row.cellIterator();
			 
			                    //Iterating over each cell (column wise)  in a particular row.
			                    while (cellIterator.hasNext()) {
			 
			                        Cell cell = (Cell) cellIterator.next();
			                        //Check the cell type and format accordingly
			                        switch (cell.getCellType())
			                        {
			                            case Cell.CELL_TYPE_NUMERIC:
			                            	break;
			                            case Cell.CELL_TYPE_STRING:
			                            	//Cell with index 1 contains marks in Maths
				                            if (cell.getColumnIndex() == 0) {
				                                c.setColCatId(cell.getStringCellValue());
				                            }
				                            //Cell with index 2 contains marks in Science
				                            else if (cell.getColumnIndex() == 1) {
				                                c.setColDesc(cell.getStringCellValue());
				                            }
				                            //Cell with index 2 contains marks in Science
				                            else if (cell.getColumnIndex() == 2) {
				                                c.setColName(cell.getStringCellValue());
				                            }
				                            //Cell with index 2 contains marks in Science
				                            else if (cell.getColumnIndex() == 3) {
				                                c.setColUrl(cell.getStringCellValue());
				                            }
				                            //Cell with index 2 contains marks in Science
				                            else if (cell.getColumnIndex() == 4) {
				                                c.setColParCatId(cell.getStringCellValue());
				                            }
			                                break;
			                        }
							  }
			                    m.put(COLUMNNAMES, c);*/
		                		
		                		Row row = (Row) rowIterator.next();
		                		if (workbook.getSheetName(i).contains("Category")) {
		                			TableName = "BLC_CATEGORY";
		                			ColumnName0 = "CATEGORY_ID";
		                			ColumnName1 = "DESCRIPTION";
		                			ColumnName2 = "NAME";
		                			ColumnName3 = "URL";
		                			ColumnName4 = "DEFAULT_PARENT_CATEGORY_ID";
		                			ColumnName5 = "ACTIVE_START_DATE";
		                			ColumnName6 = "DISPLAY_TEMPLATE";
								}else if (workbook.getSheetName(i).contains("Product")) {
									TableName = "BLC_PRODUCT";
		                			ColumnName0 = "PRODUCT_ID";
		                			ColumnName1 = "DEFAULT_CATEGORY_ID";
		                			ColumnName2 = "URL";
		                			ColumnName3 = "MANUFACTURE";
		                			ColumnName4 = "IS_FEATURED_PRODUCT";
//it's handled in code     			ColumnName5 = "TYPE";
		                			ColumnName6 = "CATEGORY";
								}else if (workbook.getSheetName(i).contains("Sku")) {
									TableName = "BLC_SKU";
		                			ColumnName0 = "SKU_ID";
		                			ColumnName1 = "DEFAULT_PRODUCT_ID";
		                			ColumnName2 = "NAME";
		                			ColumnName3 = "LONG_DESCRIPTION";
		                			ColumnName4 = "RETAIL_PRICE";
		                			ColumnName5 = "SALE_PRICE";
		                			ColumnName6 = "TAXABLE_FLAG";
		                			ColumnName7 = "DISCOUNTABLE_FLAG";
		                			ColumnName8 = "ACTIVE_START_DATE";
		                			ColumnName9 = "INVENTORY_TYPE";
								}else if (workbook.getSheetName(i).contains("Media")) {
									TableName = "BLC_MEDIA";
		                			ColumnName0 = "MEDIA_ID";
		                			ColumnName1 = "BLC_SKU_SKU_ID";
		                			ColumnName2 = "URL";
		                			ColumnName3 = "TITLE";
		                			ColumnName4 = "ALT_TEXT";
		                			ColumnName5 = "TAGS";
								}else if (workbook.getSheetName(i).contains("Option")) {
									TableName = "BLC_PRODUCT_OPTION";
		                			ColumnName0 = "PRODUCT_OPTION_ID";
		                			ColumnName1 = "PRODUCT_ID";
		                			ColumnName2 = "SKU_ID";
		                			ColumnName3 = "PRODUCT_OPTION_VALUE_ID";
		                			ColumnName4 = "OPTION_TYPE";
		                			ColumnName5 = "ATTRIBUTE_NAME";
		                			ColumnName6 = "ATTRIBUTE_VALUE";
		                			ColumnName7 = "LABEL";
		                			ColumnName8 = "REQUIRED";
		                			ColumnName9 = "DISPLAY_ORDER";
								}else if (workbook.getSheetName(i).contains("Search")) {
									TableName = "BLC_FIELD";
		                			ColumnName0 = "FIELD_ID";
		                			ColumnName1 = "ENTITY_TYPE";
		                			ColumnName2 = "PROPERTY_NAME";
		                			ColumnName3 = "ABBREVIATION";
		                			ColumnName4 = "SEARCHABLE";
		                			ColumnName5 = "TRANSLATABLE";
		                			ColumnName6 = "FACET_FIELD_TYPE";
		                			ColumnName7 = "SEARCHABLE_FIELD_TYPE";
		                			ColumnName8 = "SEARCH_FACET_ID";
		                			ColumnName9 = "LABEL";
		                			ColumnName10 = "SHOW_ON_SEARCH";
		                			ColumnName11 = "MULTISELECT";
		                			ColumnName12 = "SEARCH_DISPLAY_PRIORITY";
		                			ColumnName13 = "CATEGORY_SEARCH_FACET_ID";
		                			ColumnName14 = "CATEGORY_ID";
		                			ColumnName15 = "SEQUENCE";
		                			ColumnName16 = "SEARCH_FACET_RANGE_ID";
		                			ColumnName17 = "MIN_VALUE";
		                			ColumnName18 = "MAX_VALUE";
								}
		                		
			                    j++;
		                    }else {

		                    	Row row = (Row) rowIterator.next();
		                    	HashMap<String, String> val = null;
		                    	if (!isRowEmpty(row)) {
			                    Iterator cellIterator = row.cellIterator();
			                    
			                    //Iterating over each cell (column wise)  in a particular row.
			                    while (cellIterator.hasNext()) {
			                    	
			                        Cell cell = (Cell) cellIterator.next();
			                          //if(cell != null && cell.getCellType() != Cell.CELL_TYPE_BLANK){

			                        	//Check the cell type and format accordingly
				                        switch (cell.getCellType())
				                        {
				                            case Cell.CELL_TYPE_NUMERIC:
				                            	//Cell with index 0 contains marks in Maths
					                            if (cell.getColumnIndex() == 0) {
					                            	if ((Integer.parseInt(args[i])) == (int)cell.getNumericCellValue()) {
					                            		val = new HashMap<String, String>();
					                            		checked = true;
					                            		val.put(ColumnName0, String.valueOf((int)cell.getNumericCellValue()));
						                            	if ((int)cell.getNumericCellValue() == 1 || (int)cell.getNumericCellValue() == 2) {
						                            		val.put(ColumnName9, "BASIC");
														}
													}
					                            }else if (checked) {
					                            	if (cell.getColumnIndex() == 1) {
						                            	val.put(ColumnName1, String.valueOf((int)cell.getNumericCellValue()));
													}else if (cell.getColumnIndex() == 2) {
						                            	val.put(ColumnName2, String.valueOf((int)cell.getNumericCellValue()));
													}else if (cell.getColumnIndex() == 3) {
						                            	val.put(ColumnName3, String.valueOf((int)cell.getNumericCellValue()));
													}else if (cell.getColumnIndex() == 4) {
														if (ColumnName4.contains("RETAIL")) {
															val.put(ColumnName4, String.valueOf(cell.getNumericCellValue()));
														}
													}else if (cell.getColumnIndex() == 5) {
														if (ColumnName5.contains("SALE")) {
															val.put(ColumnName5, String.valueOf(cell.getNumericCellValue()));
														}
													}else if (cell.getColumnIndex() == 8) {
						                            	val.put(ColumnName8, String.valueOf((int)cell.getNumericCellValue()));
													}else if (cell.getColumnIndex() == 9) {
						                            	val.put(ColumnName9, String.valueOf((int)cell.getNumericCellValue()));
													}else if (cell.getColumnIndex() == 12) {
						                            	val.put(ColumnName12, String.valueOf((int)cell.getNumericCellValue()));
													}else if (cell.getColumnIndex() == 13) {
						                            	val.put(ColumnName13, String.valueOf((int)cell.getNumericCellValue()));
													}else if (cell.getColumnIndex() == 14) {
						                            	val.put(ColumnName14, String.valueOf((int)cell.getNumericCellValue()));
													}else if (cell.getColumnIndex() == 15) {
						                            	val.put(ColumnName15, String.valueOf((int)cell.getNumericCellValue()));
													}else if (cell.getColumnIndex() == 16) {
						                            	val.put(ColumnName16, String.valueOf((int)cell.getNumericCellValue()));
													}else if (cell.getColumnIndex() == 17) {
						                            	val.put(ColumnName17, String.valueOf((int)cell.getNumericCellValue()));
													}else if (cell.getColumnIndex() == 18) {
						                            	val.put(ColumnName18, String.valueOf((int)cell.getNumericCellValue()));
													}
												}
				                                break;
				                            case Cell.CELL_TYPE_STRING:
				                            	if (checked) {
				                            		//Cell with index 1 contains marks in Science
						                            if (cell.getColumnIndex() == 1) {
						                            	if (ColumnName1.contains("DESC")) {
						                            		val.put(ColumnName1, cell.getStringCellValue());
														}else if (ColumnName1.contains("DEF")) {
															val.put(ColumnName6, cell.getStringCellValue());
															HashMap<String, List<HashMap<String, String>>> tMap = enclotheList.get(i-1);
															if (tMap.containsKey("BLC_CATEGORY")) {
																List<HashMap<String, String>> lMap = tMap.get("BLC_CATEGORY");
																//for get default category id in category table
								                            	for (int k = 0; k < lMap.size(); k++) {
																	HashMap<String, String> rowMap = lMap.get(k);
																	if (rowMap.containsValue(cell.getStringCellValue())) {
																		val.put(ColumnName1,rowMap.get("CATEGORY_ID"));
																	}
																}
															}
														}else if (ColumnName1.contains("SKU")) {
															HashMap<String, List<HashMap<String, String>>> tMap = enclotheList.get(i-1);
															if (tMap.containsKey("BLC_SKU")) {
																List<HashMap<String, String>> lMap = tMap.get("BLC_SKU");
																//for get default category id in category table
								                            	for (int k = 0; k < lMap.size(); k++) {
																	HashMap<String, String> rowMap = lMap.get(k);
																	if (rowMap.containsValue(cell.getStringCellValue())) {
																		val.put(ColumnName1,rowMap.get("SKU_ID"));
																	}
																}
															}
														}else if(ColumnName1.contains("ENTITY")){
															val.put(ColumnName1, cell.getStringCellValue());
														}
						                            }
						                            //Cell with index 2 contains marks in Science
						                            else if (cell.getColumnIndex() == 2) {
						                            	if (ColumnName2.equalsIgnoreCase("Name")) {
						                            		val.put(ColumnName2, cell.getStringCellValue());
							                            	if (cell.getStringCellValue().contains("Home")) {
							                            		val.put(ColumnName6, "layout/home");
															}
														}else if (ColumnName2.equalsIgnoreCase("url")) {
															if (!cell.getStringCellValue().contains(".")) {
																val.put(ColumnName2, cell.getStringCellValue()+val.get(ColumnName0));
															}else {
																val.put(ColumnName2, cell.getStringCellValue());
															}
														}else if (ColumnName2.contains("PROPERTY")) {
															val.put(ColumnName2, cell.getStringCellValue());
														}
						                            }
						                            //Cell with index 3 contains marks in Science
						                            else if (cell.getColumnIndex() == 3) {
						                            	val.put(ColumnName3, cell.getStringCellValue());
						                            }
						                          //Cell with index 4 contains marks in Science
						                            else if (cell.getColumnIndex() == 4) {
						                            	if (ColumnName4.contains("DEF")) {
						                            		//for get default category id in category table
							                            	for (int k = 0; k < rowList.size(); k++) {
																HashMap<String, String> rowMap = rowList.get(k);
																if (rowMap.containsValue(cell.getStringCellValue())) {
																	val.put(ColumnName4,rowMap.get(ColumnName0));
																}
															}
							                            	val.put(ColumnName5, "CURRENT_TIMESTAMP");
														}else if (ColumnName4.contains("ALT")) {
															val.put(ColumnName4, cell.getStringCellValue());
														}else if (ColumnName4.contains("OPTION")) {
															val.put(ColumnName4, cell.getStringCellValue());
														}
						                            }
						                          //Cell with index 4 contains marks in Science
						                            else if (cell.getColumnIndex() == 5) {
						                            	/*if (ColumnName5.contains("TYPE")) {
															val.put(ColumnName5, cell.getStringCellValue());
														}else */
//						                            	if (ColumnName5.contains("TAG")) {
															val.put(ColumnName5, cell.getStringCellValue());
//														}
						                            }else if (cell.getColumnIndex() == 6) {
						                            	val.put(ColumnName6, cell.getStringCellValue());
													}else if (cell.getColumnIndex() == 7) {
														val.put(ColumnName7, cell.getStringCellValue());
														if (ColumnName7.contains("DISCOUNTABLE")) {
															val.put(ColumnName8, "CURRENT_TIMESTAMP");
														}
													}else if (cell.getColumnIndex() == 9) {
						                            	val.put(ColumnName9, cell.getStringCellValue());
													}
												}
				                                break;
				                            case Cell.CELL_TYPE_BOOLEAN:
				                            	if (checked) {
				                            		if (cell.getColumnIndex() == 4) {
//					                            		if (ColumnName4.contains("IS")) {
															val.put(ColumnName4, String.valueOf(cell.getBooleanCellValue()));
//														}
													}else if (cell.getColumnIndex() == 5) {
														val.put(ColumnName5, String.valueOf(cell.getBooleanCellValue()));
													}else if (cell.getColumnIndex() == 8) {
														val.put(ColumnName8, String.valueOf(cell.getBooleanCellValue()));
													}else if (cell.getColumnIndex() == 10) {
														val.put(ColumnName10, String.valueOf(cell.getBooleanCellValue()));
													}else if (cell.getColumnIndex() == 11) {
														val.put(ColumnName11, String.valueOf(cell.getBooleanCellValue()));
													}
												}
				                            	break;
				                        }
			                     }
			                    if (val != null) {
			                    	//end iterating a row, add all the elements of a row in list
				                    rowList.add(val);
								}
							}
			                  
		                }
		             }
		                tablesMap.put(TableName, rowList);
		                enclotheList.add(tablesMap);
		            }
		            fis.close();
		 
		        } catch (FileNotFoundException e) {
		            e.printStackTrace();
		        } catch (IOException e) {
		            e.printStackTrace();
		        }
		        return enclotheList;
		    }
	
	public static boolean isRowEmpty(Row row) {
	    for (int c = row.getFirstCellNum(); c < row.getLastCellNum(); c++) {
	        Cell cell = row.getCell(c);
	        if (cell != null && cell.getCellType() != Cell.CELL_TYPE_BLANK)
	            return false;
	    }
	    return true;
	}

}
