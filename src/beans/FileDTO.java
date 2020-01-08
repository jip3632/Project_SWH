package beans;

public class FileDTO {
	private int uid; 		// 매장: st_uid, 마켓: mk_uid, 제품: pd_uid 담을 변수
	private String source; 	// 매장: st_img 마켓: mk_logo 제품: pd_img
	private String file;	// 매장: st_file 마켓: mk_file 제품: pd_file
	
	public FileDTO() {}
	
	public FileDTO(int uid, String source, String file) {
		super();
		this.uid = uid;
		this.source = source;
		this.file = file;
	}

	public int getUid() {return uid;}
	public void setUid(int uid) {this.uid = uid;}
	public String getSource() {return source;}
	public void setSource(String source) {this.source = source;}
	public String getFile() {return file;}
	public void setFile(String file) {this.file = file;}
}
