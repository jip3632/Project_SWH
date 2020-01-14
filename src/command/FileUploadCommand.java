package command;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;
import java.util.Enumeration;
import java.io.File;
import java.io.IOException;


public class FileUploadCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		final String SAVE_URL = "ckupload";
		
		// 실제 저장되는 물리적인 경로 확인하기
		ServletContext context = request.getServletContext();
		String saveDirectory = context.getRealPath(SAVE_URL);
		System.out.println("업로드 경로: " + saveDirectory);
			
		Enumeration names = null;   
		String name = null;         // parameter 로 넘어오는 name 값
		String originalFileName = null;   // 원본 파일 이름
		String fileSystemName = null;     // 실제 저장되는 파일 이름
		String fileType = null;           // 파일 MIME 타입
		String fileUrl = null;            // 업로드된 파일의 URL

		int maxPostSize = 5 * 1024 * 1024;  // POST 받기, 최대 5M byte
		String encoding = "utf-8";  // response 인코딩
		FileRenamePolicy policy = new DefaultFileRenamePolicy(); //업로딩 파일 이름 중복에 대한 정책
		
		MultipartRequest multi = null; // com.oreilly.servlet.MultipartRequest 임포트
		
		// MultipartRequest 객체 생성,  이미 저장되었다.
		try {
			multi = new MultipartRequest(
				request,
				saveDirectory,
				maxPostSize,
				encoding,
				policy
			);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		// 2. File 들 추출
		names = multi.getFileNames();   // type="file" 요소 name들 추출
		while(names.hasMoreElements()){
			// <input type="file"> 의 name 가져오기
			name = (String)names.nextElement();  
			System.out.println("input name: " + name);  // CKEditor 에선 name 이 'upload' 일것이다

			// 위 name 에는 폼요소의 name 이 담겨있다.
			// 그 name 을 가지고 원래 파일 (업로드 할 파일) 을 가져온다
			originalFileName = multi.getOriginalFileName(name);
			System.out.println("원본파일 이름: " + originalFileName);
		
			// 실제 업로딩 된 파일 이름 (FileRenamePolicy 적용후)
			fileSystemName = multi.getFilesystemName(name);
			System.out.println("파일시스템 이름: " + fileSystemName);
		
			// 업로딩된 파일의 타입 : MIME 타입 ( ex: image/png ...)
			fileType = multi.getContentType(name);
			System.out.println("파일타입: " + fileType);
			
			// 파일 url, 나중에 link url 을 response 해줘야 한다
			fileUrl = request.getContextPath()+ "/" + SAVE_URL + "/" + fileSystemName;
			System.out.println("fileUrl: " + fileUrl);
			
		} // end while
			
		// JSON respnse 하기
		String jsonString = "{\"filename\" : \"" + fileSystemName 
				+ "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}";
				
		try {
			response.setContentType("application/json; charset=utf-8"); // MIME 설정
			response.getWriter().write(jsonString);   // response 내보내기
		} catch (IOException e) {
			e.printStackTrace();
		} 
		
		
		
	}

}








