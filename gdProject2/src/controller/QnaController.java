package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QnaDao;
import dao.QnaDaoImpl;
import formError.QnaError;
import model.Qna;
import validator.QnaValidator;

@WebServlet(name="QnaController", 
	urlPatterns= {"/qna_input", "/qna_save", "/qna_search", "/qna_detail", "/qna_update", "/qna_delete"})
public class QnaController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}
	
	private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String uri = req.getRequestURI();
		
		int lastIndex = uri.lastIndexOf("/");
		
		String action = uri.substring(lastIndex+1);
		System.out.println(action);
		
		if(action.equals("qna_input")) {
		}
		
		else if(action.equals("qna_save")) {
			
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			
			Qna qnaForm = new Qna(title, content); //ȭ�鿡�� �޾ƿ� ������ ����
			
			//üũ
			QnaValidator validator = new QnaValidator();
			QnaError qnaErrors = validator.validate(qnaForm);//v2

			if(!qnaErrors.isResult()) {//v2
				Qna qna = new Qna();
				qna.setTitle(qnaForm.getTitle());
				qna.setContent(qnaForm.getContent());
				
				QnaDao dao = new QnaDaoImpl();
				dao.insert(qna);
				
				req.setAttribute("message", "�� ����Ǿ����ϴ�.");
			}
			else {
				req.setAttribute("qnaErrors", qnaErrors);//v2
				req.setAttribute("qnaForm", qnaForm);
			}
		}
		else if(action.equals("qna_search")) {
			
			QnaDao dao = new QnaDaoImpl();
			List<HashMap> qnaList = dao.selectAll();
			
			req.setAttribute("qnaList", qnaList);
			
		}
		else if(action.equals("qna_detail")) {
			
			int qno = Integer.parseInt(req.getParameter("qno")); //ȭ�鿡�� ������
			
			QnaDao dao = new QnaDaoImpl();
			
			Qna qna = dao.selectByQno(qno);
			
			req.setAttribute("qnadetail", qna);
			
		}
		else if(action.equals("qna_update")) {
			
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String image = req.getParameter("image");
			
			Qna qna = new Qna(title, content, image);
			
			QnaDao dao = new QnaDaoImpl();
			dao.update(qna);
			
			req.setAttribute("message", "�� �����Ǿ����ϴ�.");
			
		}
		else if(action.equals("qna_delete")) {
			
			int qno = Integer.parseInt(req.getParameter("qno")); //ȭ�鿡�� ������
			
			QnaDao dao = new QnaDaoImpl();
			dao.delete(qno);
			
			List<HashMap> qnaList = dao.selectAll();
			
			req.setAttribute("qnaList", qnaList);
			
		}
		
		String dispatcherUrl = null;
		
		if(action.equals("qna_input")) {
			dispatcherUrl = "jsp/memo/memo.jsp";
		}
		else if(action.equals("qna_save")) {
			
			dispatcherUrl = "jsp/memo/memo.jsp";
		}
		else if(action.equals("qna_search")) {
			
			dispatcherUrl = "jsp/memo/list.jsp";
		}
		else if(action.equals("qna_detail")) {
			
			dispatcherUrl = "jsp/memo/detail.jsp";
		}
		else if(action.equals("qna_update")) {
			
			dispatcherUrl = "jsp/memo/memo_search.jsp";
		}
		else if(action.equals("qna_delete")) {
			
			dispatcherUrl = "jsp/memo/list.jsp"; 
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(dispatcherUrl);
		dispatcher.forward(req, resp);
	}
}