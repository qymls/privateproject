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
	// username属性用来封装用户名
	
	// myFile属性用来封装所有上传的文件
	private List<File> myFile;
	
	// myFileContentType属性用来封装所有上传文件的类型
	private List<String> myFileContentType;
	
	// myFileFileName属性用来封装所有上传文件的文件名
	private List<String> myFileFileName;

	private String savePath = "upload";

	//获得上传文件保存目录
	public String getSavePath() {
		return savePath;
	}
	
	//设置上传文件保存目录
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	
	//获得myFile值
	public List<File> getMyFile() {
		return myFile;
	}

	//设置myFile值
	public void setMyFile(List<File> myFile) {
		this.myFile = myFile;
	}

	//获得myFileContentType值
	public List<String> getMyFileContentType() {
		return myFileContentType;
	}

	//设置myFileContentType值
	public void setMyFileContentType(List<String> myFileContentType) {
		this.myFileContentType = myFileContentType;
	}

	//获得myFileFileName值
	public List<String> getMyFileFileName() {
		return myFileFileName;
	}

	//设置myFileFileName值
	public void setMyFileFileName(List<String> myFileFileName) {
		this.myFileFileName = myFileFileName;
	}

	



	public String execute() throws Exception {
		ServletActionContext.getResponse().setContentType("text/html");
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		//取得用来上传的文件数组
		String newFileName=null;
		try {
			List<File> files = getMyFile();
			//循环每个上传的文件
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd-hh-mm-ss");//设置日期格式
			//System.out.println(df.format(new Date()));// 
			for (int i = 0; i < files.size(); i++) {
				
				//基于file[i]创建一个文件输入流
				InputStream is = new FileInputStream(files.get(i));
				
				// 设置上传文件目录
				String uploadPath = ServletActionContext.getServletContext()
						.getRealPath(getSavePath());
				
				
				
				// 设置目标文件
				String oldFileName = getMyFileFileName().get(i);
				newFileName = df.format(new Date())+oldFileName.substring(oldFileName.lastIndexOf("."));
				//System.out.println(newFileName);
				getMyFileFileName().set(i,newFileName);
				File toFile = new File(uploadPath,newFileName);
				 
				if(!toFile.getParentFile().exists()) {  
			            //如果目标文件所在的目录不存在，则创建父目录  
			            System.out.println("目标文件所在目录不存在，准备创建它！");  
			            if(!toFile.getParentFile().mkdirs()) {  
			                System.out.println("创建目标文件所在目录失败！");  
			            }  
			        } 
				
				// 输出流
				OutputStream os = new FileOutputStream(toFile);

				//设置缓存
				byte[] buffer = new byte[1024];

				int length = 0;

				//读取file[i]文件输出到toFile文件中
				while ((length = is.read(buffer)) > 0) {
					os.write(buffer, 0, length);
				}
				
				//关闭输入流
				is.close();
				
				//关闭输出流
				os.close();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			this.addActionError("文件上传失败");
			out.print(0);
			return ActionSupport.ERROR;
		}
		//this.addActionMessage("上传成功");
		System.out.println(newFileName+"11");
		out.print(newFileName);
		ServletActionContext.getRequest().setAttribute("myFileFileName", myFileFileName);
		out.close();
		return ActionSupport.NONE;
	}
}
