package controller.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import common.Sql;
import common.page.PageDao;
import common.page.PageDaoImpl;
import common.page.PageGroupResult;
import common.page.PageManager;
import dao.board.FileDao;
import dao.board.FileDaoImpl;
import dao.board.NoticeDao;
import dao.board.NoticeDaoImpl;
import model.board.Files;
import model.board.Notice;

@MultipartConfig
@WebServlet(name="NoticeController", urlPatterns= {"/notice_list","/notice_input","/notice_save","/notice_detail","/notice_update_input","/notice_update","/notice_delete","/file_download"})
public class NoticeController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		process(req,resp);

	}
	
	public void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String uri = req.getRequestURI();
		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex+1);
		
		String UPLOAD_DIR = "upload";
		
		//����
		if(action.equals("notice_list")) {
			int requestPage = Integer.parseInt(req.getParameter("reqPage"));
			System.out.println("���������� : "+requestPage);
			String name=req.getParameter("search");
			System.out.println("�������װ˻��� : "+name);
			
			
			if(name==null || name=="") {
				
				
				
				NoticeDao dao = new NoticeDaoImpl();
				List<HashMap<String,Object>> list = dao.selectAll(requestPage);
				
				//�� �ټ� ��������
				PageDao pdao = new PageDaoImpl();
				int line = pdao.getCountNotice(Sql.NOTICE_COUNT_SQL);
				
				//getPageGroupResult() �ҷ�����
				PageManager manager = new PageManager(requestPage);
				PageGroupResult pgr =  manager.getPageGroupResult(line);
				
				req.setAttribute("noticeList", list);
				req.setAttribute("pageGroupResult", pgr);
			}else {
				//�˻�
				
				req.setAttribute("search", name);
				
				NoticeDao dao = new NoticeDaoImpl();
				List<HashMap<String,Object>> list = dao.selectByTitleContent(name, requestPage);
				
				//�� �ټ� ��������
				PageDao pdao = new PageDaoImpl();
				int line = pdao.getCountNoticeSearch(name);
				
				//getPageGroupResult() �ҷ�����
				PageManager manager = new PageManager(requestPage);
				PageGroupResult pgr =  manager.getPageGroupResult(line);
				
				req.setAttribute("noticeList", list);
				req.setAttribute("pageGroupResult", pgr);
			}
			
			
			
		}else if(action.equals("notice_input")) {
			
			
			
		}else if(action.equals("notice_detail")) {
			int ncode = Integer.parseInt(req.getParameter("ncode"));
			int pageNum = Integer.parseInt(req.getParameter("pageNum"));
			
			NoticeDao dao = new NoticeDaoImpl();
			List<HashMap<String,Object>> detail = dao.selectByNcode(ncode);
			req.setAttribute("detail", detail);
			req.setAttribute("ncode", ncode);
			req.setAttribute("pageNum", pageNum);
			dao.count(ncode);
			
			FileDao fdao = new FileDaoImpl();
			List <Files> fileList = fdao.returnFiles(ncode);
			if(!fileList.isEmpty()) {
				req.setAttribute("fileList", fileList);
				System.out.println(fileList);
			}
			
			
			
			
			
		}else if(action.equals("file_download")) {
			
			
			
				int ncode = Integer.parseInt(req.getParameter("ncode"));
				
				FileDao fdao = new FileDaoImpl();
				List <Files> fileList = fdao.returnFiles(ncode);
				if(!fileList.isEmpty()) {
					String fileName = null;
					String orgFileName = null;
					
					for (Files files : fileList) {
						fileName = files.getName();
						orgFileName = files.getBeforename();
					}
					//���� �ٿ�ε�
					
					System.out.println(fileName);
					
					// ������ �ö� ��θ� ������
					ServletContext context = getServletContext();
					System.out.println("context : "+context);
					String uploadFilePath = context.getRealPath(UPLOAD_DIR);
					System.out.println("uploadFilePath : "+uploadFilePath);
					String filePath = uploadFilePath + File.separator + fileName;
					System.out.println("filePath : "+filePath);
					
			         
			         InputStream in = null;
			          OutputStream os = null;
			          File file = null;
			          boolean skip = false;
			          String client = "";
			          
			       
			          try{
			               
			       
			              // ������ �о� ��Ʈ���� ���
			              try{
			                  file = new File(filePath);
			                  in = new FileInputStream(file);
			                  file.getAbsolutePath();
			              }catch(FileNotFoundException fe){
			                  skip = true;
			              }
			       
			       
			       
			               
			              client = req.getHeader("User-Agent");
			       
			              // ���� �ٿ�ε� ��� ����
			              resp.reset() ;
			              resp.setContentType("application/octet-stream");
			              resp.setHeader("Content-Description", "JSP Generated Data");
			       
			       
			              if(!skip){
			       
			                   
			                  // IE
			                  if(client.indexOf("MSIE") != -1){
			                      resp.setHeader ("Content-Disposition", "attachment; filename="+new String(orgFileName.getBytes("KSC5601"),"ISO8859_1"));
			       
			                  }else{
			                      // �ѱ� ���ϸ� ó��
			                      orgFileName = new String(orgFileName.getBytes("utf-8"),"iso-8859-1");
			       
			                      resp.setHeader("Content-Disposition", "attachment; filename=\"" + orgFileName + "\"");
			                      resp.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
			                  } 
			                   
			                  resp.setHeader ("Content-Length", ""+file.length() );
			       
			       
			             
			                  os = resp.getOutputStream();
			                  byte b[] = new byte[(int)file.length()];
			                  int leng = 0;
			                   
			                  while( (leng = in.read(b)) > 0 ){
			                      os.write(b,0,leng);
			                  }
			       
			              }else{
			                  resp.setContentType("text/html;charset=UTF-8");
			                  System.out.println("<script language='javascript'>alert('������ ã�� �� �����ϴ�');history.back();</script>");
			       
			              }
			               
			              in.close();
			              os.close();
			       
			          }catch(Exception e){
			            e.printStackTrace();
			          }
				}
				
				
			
		}else if(action.equals("notice_save")) {
			
		    
		    //�Խñ�
			HttpSession session = req.getSession(false);
			
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			int mcode = (int) session.getAttribute("mcode");
			
			Notice notice = new Notice(mcode,title,content);
			
			NoticeDao dao = new NoticeDaoImpl();
			dao.insert(notice);
			
			int ncode = dao.returnNcode();
			
			//����
			
			
			Part part = req.getPart("filename");
			System.out.println("part���: " + part);
		    
			if(part.getSize()!=0) {
			// ������ ���� ���
			String applicationPath = req.getServletContext().getRealPath("");
			String uploadFilePath = applicationPath + UPLOAD_DIR;
				
			System.out.println(" LOG :: [���� ��Ʈ ���] :: " + applicationPath);
			System.out.println(" LOG :: [���� ���� ���] :: " + uploadFilePath);
				
			File fileSaveDir = new File(uploadFilePath);
				
			//���� ��ΰ� ������ ���� �����Ѵ�
			if (!fileSaveDir.exists()) {
				fileSaveDir.mkdirs();
			}
				
			String fileName=null;
				
			fileName = getFileName(part);
		    System.out.println( "LOG :: [���ε� ���� ���] :: " + uploadFilePath + File.separator + fileName);
		    
		    int uriLastIndex = fileName.lastIndexOf(".");
		    String uriAction = fileName.substring(uriLastIndex+1);
		    FileDao fdao = new FileDaoImpl();
		    String newFileName = fdao.returnSeq()+"."+uriAction;
		    
		    System.out.println("fcode�θ����̸�: "+newFileName);
		    System.out.println(uploadFilePath + File.separator + newFileName);
		    part.write(uploadFilePath + File.separator + newFileName);
		    
		    long fileSize = part.getSize();
		    
		    Files files = new Files(ncode,newFileName,fileName,fileSize);
		    fdao.insert(files);
			}
			
		

		}else if(action.equals("notice_update_input")) {
			int ncode = Integer.parseInt(req.getParameter("ncode"));
			NoticeDao dao = new NoticeDaoImpl();
			List<HashMap<String,Object>> detail = dao.selectByNcode(ncode);
			req.setAttribute("detail", detail);
			req.setAttribute("ncode", ncode);
			
		}else if(action.equals("notice_update")) {
			
			int ncode = Integer.parseInt(req.getParameter("ncode"));
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			
			Notice notice = new Notice(title,ncode,content);
			NoticeDao dao = new NoticeDaoImpl();
			dao.update(notice);
			
			//÷�������� �ִٸ� ���� ������ �����.
			FileDao fdao = new FileDaoImpl();
			
			List <Files> fileList = fdao.returnFiles(ncode);
			System.out.println("��������Ȯ�� : "+fileList.size());
			if(fileList.size()!=0) {
				String fileName = null;
				for (Files files : fileList) {
					fileName = files.getName();
				}
				System.out.println("�����������̸� : "+fileName);
				String directory = getServletContext().getRealPath(UPLOAD_DIR+ File.separator +fileName);
				File file = new File(directory);
		        
			    if(file.exists()) {    //�����ϰ��� �ϴ� ������ �ش� ������ �����ϸ� ������Ų��
			        file.delete();
			    }
			    
			    fdao.delete(ncode);
			    
			}
			
			//÷�������� �ִٸ� ���ε�
			Part part = req.getPart("filename");
			System.out.println("part���: " + part);
		    
			if(part.getSize()!=0) {
			// ������ ���� ���
			String applicationPath = req.getServletContext().getRealPath("");
			String uploadFilePath = applicationPath + UPLOAD_DIR;
				
			System.out.println(" LOG :: [���� ��Ʈ ���] :: " + applicationPath);
			System.out.println(" LOG :: [���� ���� ���] :: " + uploadFilePath);
				
			File fileSaveDir = new File(uploadFilePath);
				
			//���� ��ΰ� ������ ���� �����Ѵ�
			if (!fileSaveDir.exists()) {
				fileSaveDir.mkdirs();
			}
				
			String fileName=null;
				
			fileName = getFileName(part);
		    System.out.println( "LOG :: [���ε� ���� ���] :: " + uploadFilePath + File.separator + fileName);
		    
		    int uriLastIndex = fileName.lastIndexOf(".");
		    String uriAction = fileName.substring(uriLastIndex+1);
		    String newFileName = fdao.returnSeq()+"."+uriAction;
		    
		    System.out.println("fcode�θ����̸�: "+newFileName);
		    System.out.println(uploadFilePath + File.separator + newFileName);
		    part.write(uploadFilePath + File.separator + newFileName);
		    
		    long fileSize = part.getSize();
		    
		    Files files = new Files(ncode,newFileName,fileName,fileSize);
		    fdao.insert(files);
			}
			
			
		}else if(action.equals("notice_delete")) {
			int ncode = Integer.parseInt(req.getParameter("ncode"));
			FileDao fdao = new FileDaoImpl();
			
			List <Files> fileList = fdao.returnFiles(ncode);
			
			String fileName = null;
			for (Files files : fileList) {
				fileName = files.getName();
			}
			System.out.println(fileName);
			
			
		        
		    String directory = getServletContext().getRealPath(UPLOAD_DIR+ File.separator +fileName);
		    
		    System.out.println(directory);
		        
		    File file = new File(directory);
		        
		    if(file.exists()) {    //�����ϰ��� �ϴ� ������ �ش� ������ �����ϸ� ������Ų��
		        file.delete();
		    }
		    fdao.delete(ncode);
			NoticeDao dao = new NoticeDaoImpl();
			dao.delete(ncode);
		}
			
		
		//������
		String dispatcherUrl = null;
		if(action.equals("notice_list")) {
			dispatcherUrl="/jsp/board/noticeList.jsp";
			
		}else if(action.equals("notice_input")) {
			dispatcherUrl="/jsp/board/newNotice.jsp";
			
		}else if(action.equals("notice_detail")) {
			dispatcherUrl="/jsp/board/noticeDetail.jsp";
			
		}else if(action.equals("file_download")) {
			dispatcherUrl="notice_list?reqPage=1";
		}
		else if(action.equals("notice_save")) {
			dispatcherUrl="notice_list?reqPage=1";
		}else if(action.equals("notice_update_input")) {
			dispatcherUrl="/jsp/board/updateNotice.jsp";
			
		}else if(action.equals("notice_update")) {
			dispatcherUrl="notice_list?reqPage=1";
		}else if(action.equals("notice_delete")) {
			dispatcherUrl="notice_list?reqPage=1";
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(dispatcherUrl);
		dispatcher.forward(req, resp);
		
	}
	
	
	private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        System.out.println(" LOG :: content-disposition ��� :: = "+contentDisp);
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
            	System.out.println(" LOG :: ���� �̸� :: " + token);
                return token.substring(token.indexOf("=") + 2, token.length()-1);
            }
        }
        return "";
    }

}
