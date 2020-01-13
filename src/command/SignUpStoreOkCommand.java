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

public class SignUpStoreOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		SearchDAO dao = new SearchDAO();
		
		ServletContext context = request.getServletContext();
		String saveDirectory = context.getRealPath("upload/offstore");
		
		int maxPostSize = 5 * 1024 * 1024;
		String encoding = "utf-8";
		FileRenamePolicy policy = new DefaultFileRenamePolicy();
		
		MultipartRequest multi = null;
		
		try {
			multi = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		String originalFileName = "";
		String fileSystemName = "";
		Enumeration names=  null;
		names = multi.getFileNames();
		if(names.hasMoreElements()) {
			String name = (String) names.nextElement();
			originalFileName = multi.getOriginalFileName(name);
			fileSystemName = multi.getFilesystemName(name);
		}
		
		int mb_uid = Integer.parseInt(multi.getParameter("mb_uid"));
		String st_name = multi.getParameter("st_name");
		String st_address = multi.getParameter("st_address");
		String st_contact = multi.getParameter("st_contact");
		String st_hours = multi.getParameter("st_start") + "-" + multi.getParameter("st_end");
		int st_valid_key = Integer.parseInt(multi.getParameter("st_valid_key"));
		String st_latitude = multi.getParameter("st_latitude");
		String st_longitude = multi.getParameter("st_longitude");
		
		try {
			cnt = dao.insertNewStore(mb_uid, st_name, st_address, st_contact, st_hours, st_valid_key, originalFileName, fileSystemName, st_latitude, st_longitude);
			System.out.println(cnt);
			request.setAttribute("result", cnt);
		}catch(SQLException e){
			e.printStackTrace();
		}

	}

}
