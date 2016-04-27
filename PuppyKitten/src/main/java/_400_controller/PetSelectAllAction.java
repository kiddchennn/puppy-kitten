package _400_controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import _400_model.BlockadeBean;
import _400_model.PetAllBean;
import _400_model.PetBean;
import _400_model.PetImgBean;
import _400_model.PetService;
import _400_model.PetSortCatBean;
import _400_model.PetSortDogBean;

public class PetSelectAllAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest req;

	public HttpServletRequest getReq() {
		return req;
	}

	public void setReq(HttpServletRequest req) {
		this.req = req;
	}

	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	public String execute(){
		PetService petService = new PetService();
		List<PetBean> petBean = petService.selectAll();// 先將所有寵物資訊抓出來放到petBean內
		HttpSession session = req.getSession();
		List<PetAllBean> list = new ArrayList<PetAllBean>();
		for(int j=0;j<petBean.size();j++){
			PetAllBean petAllBean = new PetAllBean();
			petAllBean.setPET_ID(petBean.get(j).getPET_ID().toString());
			petAllBean.setPET_OWN_ID(petBean.get(j).getPET_OWN_ID().toString());
			petAllBean.setPET_NAME(petBean.get(j).getPET_NAME().toString());
			petAllBean.setPET_WEIGHT(petBean.get(j).getPET_WEIGHT().toString());
			petAllBean.setPET_KING(petBean.get(j).getPET_KING().toString());
			petAllBean.setPET_SEX(petBean.get(j).getPET_SEX().toString());
			petAllBean.setPET_BODY(petBean.get(j).getPET_BODY().toString());
			
			
				if (petBean.get(j).getPET_SORT_ID().startsWith("41")) {
					PetSortCatBean Catbean = petService
							.selectSortCat(petBean.get(j).getPET_SORT_ID());
					petAllBean.setPET_SORT_NAME(Catbean.getPET_SORT_NAME());

				} else {
					PetSortDogBean Dogbean = petService
							.selectSortDog(petBean.get(j).getPET_SORT_ID());
					petAllBean.setPET_SORT_NAME(Dogbean.getPET_SORT_NAME());
				}

				Date now = new Date();
				long PET_AGE = (now.getTime() - petBean.get(j).getPET_AGE().getTime()) / 1000
						/ (60 * 60 * 24) / 365;
				petAllBean.setPET_AGE(PET_AGE);
				PetImgBean Imgbean = petService.selectId2(petBean.get(j).getPET_ID());
				petAllBean.setPET_IMAGE(Imgbean.getPET_IMAGE());
				list.add(petAllBean);
		}
			if(list.isEmpty()){
				session.setAttribute("noPet", "目前沒有任何寵物資訊");
				session.removeAttribute("PetList");
			}else{
				session.setAttribute("PetList", list);
				session.removeAttribute("noPet");
			}		
		
		
		return "success";
	}
}
