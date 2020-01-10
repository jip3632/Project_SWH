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

public class NewProductOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		int st_uid = Integer.parseInt(request.getParameter("st_uid"));
		SearchDAO sdao = new SearchDAO();
		
		ServletContext context = request.getServletContext();
		String saveDirectory = context.getRealPath("upload/product");
		
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
		}
		
		String pd_name = multi.getParameter("pd_name");
		String pd_description = multi.getParameter("pd_description");
		int mk_uid = Integer.parseInt(multi.getParameter("mk_uid"));
		if(pd_description == null) {
			pd_description = "";
		}
		
		try {
			cnt = sdao.insertProduct(pd_name, pd_description, originalFileName, fileSystemName, mk_uid);
			request.setAttribute("result", cnt);
			request.setAttribute("st_uid", st_uid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		

	}

}
