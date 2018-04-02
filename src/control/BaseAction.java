package control;

import java.util.List;

import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;

import com.opensymphony.xwork2.ActionSupport;

import page.PageInfo;

public class BaseAction extends ActionSupport {
	protected PageInfo pageInfo;
	protected String type;

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public DefaultCategoryDataset getDcdfromList(List<Object[]> list) {
		// �յ���״ͼ�����ݼ�
		DefaultCategoryDataset dcd = new DefaultCategoryDataset();
		// �������ݿ��ѯ����ѡ����ֵ�ļ���
		for (int i = 0; i < list.size(); i++) {
			Object[] obj = list.get(i);
			String title = (String) obj[0];// obj.getClass().getDeclaredField("name").get(obj).toString();

			int no = 0;

			try {
				no = Integer.valueOf(String.valueOf(obj[1]));// Integer.parseInt(obj.getClass().getDeclaredField("no").get(obj).toString());
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			dcd.setValue(no, title, title);
		}
		return dcd;
	}
	
	public DefaultCategoryDataset getDzdfromList(List<Object[]> list) {
		
		DefaultCategoryDataset dzd = new DefaultCategoryDataset();
		// �������ݿ��ѯ����ѡ����ֵ�ļ���
		for (int i = 0; i < list.size(); i++) {
			Object[] obj = list.get(i);
			String title = (String) obj[0];// obj.getClass().getDeclaredField("name").get(obj).toString();
           // System.out.println(title);
			String mouth = (String) obj[2];
		
			int no = 0;

			try {
				no = Integer.valueOf(String.valueOf(obj[1]));// Integer.parseInt(obj.getClass().getDeclaredField("no").get(obj).toString());
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			dzd.setValue(no,title , mouth);
		}
		return dzd;
	}

	public DefaultPieDataset getDfdfromList(List<Object[]> list) {
		// �յı�ͼ�����ݼ�
		DefaultPieDataset dfd = new DefaultPieDataset();
		// �������ݿ��ѯ����ѡ����ֵ�ļ���
		for (int i = 0; i < list.size(); i++) {
			Object[] obj = list.get(i);
			String title = (String) obj[0];// obj.getClass().getDeclaredField("name").get(obj).toString();
			int no = Integer.valueOf(String.valueOf(obj[1]));// Integer.parseInt(obj.getClass().getDeclaredField("no").get(obj).toString());
			dfd.setValue(title, no);
		}
		return dfd;
	}

}
