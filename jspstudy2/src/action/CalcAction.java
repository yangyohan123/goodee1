package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalcAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		try {
		int num1 = Integer.parseInt(request.getParameter("num1"));
		String calc = request.getParameter("op");
		int num2 = Integer.parseInt(request.getParameter("num2"));
		switch(calc) {
		case "+" : request.setAttribute("result", num1 + num2); break; 
		case "-" : request.setAttribute("result", num1 - num2); break; 
		case "*" : request.setAttribute("result", num1 * num2); break; 
		default : request.setAttribute("result", (double)num1 / num2); 
			
		
		}
		}catch(NullPointerException e) {
			request.setAttribute("ressult", 0);
		}
		return new ActionForward(false, "calc.jsp");
		
	}
}
