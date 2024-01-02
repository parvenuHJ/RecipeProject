package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.command.Command;
import com.smhrd.model.ActionForward;
import com.smhrd.model.CommentDAO;
import com.smhrd.model.CommentVO;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberVO;

public class CommentUpdate implements Command {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		String path = request.getServletContext().getRealPath("./file");
		// System.out.println(path);

		// 3. 파일 최대크기
		int maxSize = 1024 * 1024 * 10; // 10MB

		// 4. 인코딩방식
		String encoding = "UTF-8";

		// 5. 중복제거
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();

		// 파일 선택 후 전송버튼을 누르면 MultipartRequest객체를 통해서 넘어온다
		MultipartRequest multi;
		ActionForward forward = null;
		int cnt = 0;
		try {
			multi = new MultipartRequest(request, path, maxSize, encoding, rename);
			// 데이터 가져오기
			String co_num = multi.getParameter("co_num");
			String co_text = multi.getParameter("co_text");
			String co_img = multi.getFilesystemName("co_img");


			// 잘 넘어왔는 지 확인 -> 콘솔창에 데이터 잘 뜨는 지, file 폴더에 사진이 들어가 있는 지 , 똑같은 file 업로드 시 중복 제거가
			// 되는 지
			System.out.println("co_num : " + co_num);
			System.out.println("co_img : " + co_img);
			System.out.println("co_text : " + co_text);

			CommentVO comment = new CommentVO(co_num, co_text, co_img);
				
			
			if (co_img == null) {
				cnt = new CommentDAO().CommentUpdate1(comment);
			} else {
				cnt = new CommentDAO().CommentUpdate2(comment);
			}

			if (cnt > 0) {
				System.out.println("댓글 등록 성공!!!!");

			} else {
				System.out.println("댓글등록 실패");
			}


		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		forward = new ActionForward();
		forward.setPath("MemberComment.jsp");
		forward.setRedirect(true);

		return forward;
		
		
		
	}

}
