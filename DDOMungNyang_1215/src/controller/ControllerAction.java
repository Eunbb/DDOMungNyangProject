package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="ControllerAction", urlPatterns={"*.do"})
public class ControllerAction extends HttpServlet{
	
	Map map = new HashMap();

    public void init(ServletConfig config) throws ServletException { 
        String props = config.getServletContext().getRealPath(
        		                    "/WEB-INF/commandPro.properties");
	    
        FileInputStream fin=null;
		Properties properties = new Properties();
		
		try {
			fin = new FileInputStream(props);
			properties.load(fin);
//			System.out.println("properties="+properties);
			
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				fin.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		Iterator it = properties.keySet().iterator();
		while(it.hasNext()){
			String key = (String)it.next();
//			System.out.println("key="+key);
			
			String className = properties.getProperty(key);
//			System.out.println("className="+className);
			
			try {
				Class classType = Class.forName(className);
				Object ob = classType.newInstance();
				
				map.put(key, ob);//맵에 저장
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}//while
	}//init()
    
    //get방식의 서비스 메소드
    public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
        requestPro(request, response);
    }
    //post방식의 서비스 메소드
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        requestPro(request, response);
    }

    //시용자의 요청을 분석해서 해당 작업을 처리
    private void requestPro(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	//요청
		System.out.println("test : " + request.getRequestURI());
		String category = request.getServletPath().substring(1);
		System.out.println("category = " + category);

		CommandAction command = (CommandAction) map.get(category);
		System.out.println("command = " + command);
		
		String view=null;
		try {
			view = command.requestPro(request, response);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		System.out.println("view = " + view);
		
		//응답
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);//상대번지
		dispatcher.forward(request, response);
    }   
}












