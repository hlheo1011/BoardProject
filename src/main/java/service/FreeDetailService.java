package service;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.ActionForward;
import repository.FreeDao;

public class FreeDetailService implements FreeService {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Optional<String> opt = Optional.ofNullable(request.getParameter("freeNo"));
		Long freeNo = Long.parseLong(opt.orElse("0"));
		
		
		/////
		String referer = request.getHeader("referer");
		HttpSession session = request.getSession();
		if(referer.endsWith("list.do") && session.getAttribute("updateHit") == null) {
			FreeDao.getInstance().updateHit(freeNo);
			session.setAttribute("updateHit", "done");
		}
		
		request.setAttribute("free", FreeDao.getInstance().selectBoardByNo(freeNo));
		
		return new ActionForward("/free/detail.jsp", false);
	}

}
