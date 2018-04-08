package control;



import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;



public class UploadAction extends ActionSupport {
	// username����������װ�û���
	
	// myFile����������װ�����ϴ����ļ�
	private List<File> myFile;
	
	// myFileContentType����������װ�����ϴ��ļ�������
	private List<String> myFileContentType;
	
	// myFileFileName����������װ�����ϴ��ļ����ļ���
	private List<String> myFileFileName;

	private String savePath = "upload";

	//����ϴ��ļ�����Ŀ¼
	public String getSavePath() {
		return savePath;
	}
	
	//�����ϴ��ļ�����Ŀ¼
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	
	//���myFileֵ
	public List<File> getMyFile() {
		return myFile;
	}

	//����myFileֵ
	public void setMyFile(List<File> myFile) {
		this.myFile = myFile;
	}

	//���myFileContentTypeֵ
	public List<String> getMyFileContentType() {
		return myFileContentType;
	}

	//����myFileContentTypeֵ
	public void setMyFileContentType(List<String> myFileContentType) {
		this.myFileContentType = myFileContentType;
	}

	//���myFileFileNameֵ
	public List<String> getMyFileFileName() {
		return myFileFileName;
	}

	//����myFileFileNameֵ
	public void setMyFileFileName(List<String> myFileFileName) {
		this.myFileFileName = myFileFileName;
	}

	



	public String execute() throws Exception {
		ServletActionContext.getResponse().setContentType("text/html");
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		//ȡ�������ϴ����ļ�����
		String newFileName=null;
		try {
			List<File> files = getMyFile();
			//ѭ��ÿ���ϴ����ļ�
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd-hh-mm-ss");//�������ڸ�ʽ
			//System.out.println(df.format(new Date()));// 
			for (int i = 0; i < files.size(); i++) {
				
				//����file[i]����һ���ļ�������
				InputStream is = new FileInputStream(files.get(i));
				
				// �����ϴ��ļ�Ŀ¼
				String uploadPath = ServletActionContext.getServletContext()
						.getRealPath(getSavePath());
				
				
				
				// ����Ŀ���ļ�
				String oldFileName = getMyFileFileName().get(i);
				newFileName = df.format(new Date())+oldFileName.substring(oldFileName.lastIndexOf("."));
				//System.out.println(newFileName);
				getMyFileFileName().set(i,newFileName);
				File toFile = new File(uploadPath,newFileName);
				 
				if(!toFile.getParentFile().exists()) {  
			            //���Ŀ���ļ����ڵ�Ŀ¼�����ڣ��򴴽���Ŀ¼  
			            System.out.println("Ŀ���ļ�����Ŀ¼�����ڣ�׼����������");  
			            if(!toFile.getParentFile().mkdirs()) {  
			                System.out.println("����Ŀ���ļ�����Ŀ¼ʧ�ܣ�");  
			            }  
			        } 
				
				// �����
				OutputStream os = new FileOutputStream(toFile);

				//���û���
				byte[] buffer = new byte[1024];

				int length = 0;

				//��ȡfile[i]�ļ������toFile�ļ���
				while ((length = is.read(buffer)) > 0) {
					os.write(buffer, 0, length);
				}
				
				//�ر�������
				is.close();
				
				//�ر������
				os.close();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			this.addActionError("�ļ��ϴ�ʧ��");
			out.print(0);
			return ActionSupport.ERROR;
		}
		//this.addActionMessage("�ϴ��ɹ�");
		System.out.println(newFileName+"11");
		out.print(newFileName);
		ServletActionContext.getRequest().setAttribute("myFileFileName", myFileFileName);
		out.close();
		return ActionSupport.NONE;
	}
}
