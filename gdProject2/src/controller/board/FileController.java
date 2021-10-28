package controller.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import org.apache.commons.io.IOUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;



@MultipartConfig
@WebServlet(name="FileController", urlPatterns= {"/upload","/download"})
public class FileController extends HttpServlet{

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
		if(action.equals("upload")) {
			// ������ ���� ���
			String applicationPath = req.getServletContext().getRealPath("/WebContent/upload");
			String uploadFilePath = applicationPath + UPLOAD_DIR;
						
			System.out.println(" LOG :: [���� ��Ʈ ���] :: " + applicationPath);
			System.out.println(" LOG :: [���� ���� ���] :: " + uploadFilePath);
						
			// creates the save directory if it does not exists
			File fileSaveDir = new File(uploadFilePath);
						
			// ���� ��� ������ ����
			if (!fileSaveDir.exists()) {
				fileSaveDir.mkdirs();
			}

			String fileName = null;
			//Get all the parts from request and write it to the file on server
			for (Part part : req.getParts()) {
				getPartConfig(part);
				fileName = getFileName(part);
				System.out.println(" LOG :: [ ���ε� ���� ��� ] :: " + uploadFilePath + File.separator + fileName);
				part.write(uploadFilePath + File.separator + fileName);
			}
			req.setAttribute("fileName", fileName);
			//1. ������ �����̸��� �����.
			//2. db�� ������ �����Ѵ�.
			//3. ������ �̸����� ���ϼ����� ������ �����Ѵ�.
			//db : �ۼ���, �ۼ��ð�, �������� �����̸�, ������ �����̸�(timestamp), ���ϻ�����(part.getSize()) �� ����
					
					
			
		}else if(action.equals("download")) {
			String fileName = req.getParameter("fileName");
			
			// ������ �ö� ��θ� ������
			ServletContext context = getServletContext();
			String uploadFilePath = context.getRealPath(UPLOAD_DIR);
			String filePath = uploadFilePath + File.separator + fileName;
			
			resp.setContentType("image/jpeg");
			byte[] image = IOUtils.toByteArray(new FileInputStream(new File(filePath)));
			resp.getOutputStream().write(image);
			
			
		}
		
		//������
		String dispatcherUrl = null;
		if(action.equals("upload")) {
			dispatcherUrl="";
			
		}else if(action.equals("download")) {
			dispatcherUrl="";
			
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(dispatcherUrl);
		dispatcher.forward(req, resp);
	}
	
	private void getPartConfig(Part part) {
		System.out.println("------------------------------------------------------------");
		System.out.println(" LOG :: [HTML�±��� ���±� �̸�] :: " + part.getName());
		System.out.println(" LOG :: [ ���� ������ ] :: " + part.getSize());
		for(String name : part.getHeaderNames()) {
			System.out.println(" LOG :: HeaderName :: " + name + ", HeaderValue :: " + part.getHeader(name) + "\n");
		}
		System.out.println("------------------------------------------------------------");
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
