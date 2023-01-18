package com.semi.playlist;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.auth.Auth;
import com.semi.auth.AuthDAO;

/**
 * Servlet implementation class regPlaylistC
 */
@WebServlet("/RegPlaylistC")
public class RegPlaylistC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	AuthDAO.loginCheck(request);
	
	HttpSession hs = request.getSession();
	Auth a =(Auth)hs.getAttribute("account");
	
	
	PlaylistDAO.getRdao().getAllPlMusic(request);
	PlaylistDAO.getRdao().paging(1, request);
	
	if(a==null) {
		request.setAttribute("alert", "세션이 만료되었습니다. 재로그인 해주세요.");
		request.setAttribute("contentPage", "jsp/auth/login.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	} else {
	request.setAttribute("a", a);
	request.setAttribute("contentPage", "jsp/playlist/regPlaylistMusic_test.jsp");
	request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
	
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	
		//플리 만들기
		PlaylistDAO.getRdao().regPlaylist(request);
		
		AuthDAO.loginCheck(request);
		
		//만든 플리 조회하기
		PlaylistDAO.getRdao().getAllPlaylist(request);
		request.setAttribute("contentPage", "jsp/playlist/playlist.jsp");	
		request.getRequestDispatcher("index.jsp").forward(request, response);
	
	
	
	}

}
