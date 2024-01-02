package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.command.Command;
import com.smhrd.model.ActionForward;
import com.smhrd.model.CommentDAO;
import com.smhrd.model.CommentVO;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.RecipeDAO;
import com.smhrd.model.RecipeDetailDAO;
import com.smhrd.model.RecipeVO;

public class CommentInsert implements Command {

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
		String nick = "";
		String re_code = "";

		try {
			multi = new MultipartRequest(request, path, maxSize, encoding, rename);
			// 데이터 가져오기
			String mem_id = multi.getParameter("mem_id");
			String co_text = multi.getParameter("co_text");
			String co_img = multi.getFilesystemName("co_img");
			re_code = multi.getParameter("re_code");
			String food_name = multi.getParameter("food_name");
			String co_num = "";

			// 잘 넘어왔는 지 확인 -> 콘솔창에 데이터 잘 뜨는 지, file 폴더에 사진이 들어가 있는 지 , 똑같은 file 업로드 시 중복 제거가
			// 되는 지
			System.out.println("mem_id : " + mem_id);
			System.out.println("co_text : " + co_text);
			System.out.println("co_img : " + co_img);
			System.out.println("re_code : " + re_code);

			CommentVO comment = new CommentVO(co_num, mem_id, co_text, co_img, re_code);
			CommentVO comment2 = new CommentVO(co_num, mem_id, co_text, re_code);

			if (co_img == null) {
				cnt = new CommentDAO().CommentInsert2(comment2);
			} else {
				cnt = new CommentDAO().CommentInsert(comment);
			}

			MemberDAO dao = new MemberDAO();
			nick = dao.getNick(mem_id).getMem_nick();
			
			
			if (cnt > 0) {
				System.out.println("댓글등록 성공!!!!");
				forward = new ActionForward();
				forward.setPath("RecipeDetail2.jsp?food_name="+food_name+"&re_code="+re_code+"&mem_id="+mem_id);
				forward.setRedirect(false);
				
			} else {
				System.out.println("댓글등록 실패");
				forward = new ActionForward();
				forward.setPath("RecipeDetail2.jsp?re_code=" + re_code);
				forward.setRedirect(false);
			
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return forward;

	}

}
