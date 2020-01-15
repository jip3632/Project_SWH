package command;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import beans.SearchDAO;

public class NewMarketOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		int st_uid = Integer.parseInt(request.getParameter("st_uid"));
		SearchDAO sdao = new SearchDAO();
		
		ServletContext context = request.getServletContext();
		String saveDirectory = context.getRealPath("upload/market");
		
		int maxPostSize = 5 * 1024 * 1024;
		String encoding = "utf-8";
		FileRenamePolicy policy = new DefaultFileRenamePolicy();
		
		MultipartRequest multi = null;
		
		try {
			multi = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
		} catch (IOException e) {
			e.printStackTrace();
		}
		String originalFileName = "";
		String fileSystemName = "";
		String fileType = "";
		Enumeration names = multi.getFileNames();
		if(names.hasMoreElements()) {
			String name = (String) names.nextElement();
			originalFileName = multi.getOriginalFileName(name);
			fileSystemName = multi.getFilesystemName(name);
			if(originalFileName == null) {
				originalFileName = "";
			}
			if(fileSystemName == null) {
				fileSystemName = "";
			}
			fileType = multi.getContentType(name);
			if(fileType == null) fileType = "";
		}
		
		String mk_name = multi.getParameter("mk_name");
		String mk_insta = multi.getParameter("mk_insta");
		if(mk_insta == null) {
			mk_insta = "";
		}
		
		try {
			request.setAttribute("st_uid", st_uid);
			if(!fileType.equals("image/jpg") && !fileType.equals("image/png") && !fileType.equals("image/gif") && !fileType.contentEquals("")) {
				sdao.close();
				request.setAttribute("result", -1);
				return;
			}
			cnt = sdao.insertMarket(mk_name, mk_insta, originalFileName, fileSystemName);
			request.setAttribute("result", cnt);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
