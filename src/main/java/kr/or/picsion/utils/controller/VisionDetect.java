package kr.or.picsion.utils.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.View;

import kr.or.picsion.utils.GoogleTranslationApi;
import kr.or.picsion.utils.VisionApi;

@Controller
public class VisionDetect {
	
	@Autowired
	private VisionApi vision;
	
	@Autowired
	private GoogleTranslationApi googleTranslation;
	
	@Autowired
	private View jsonview;
	
	@RequestMapping(value = "opervision.ps", method=RequestMethod.POST)
	public View opervision(String filePath,Model model) {
		
		String logocheck=vision.detectLogos(filePath);//vision : 로고감지
		String safecheck=vision.detectSafeSearch(filePath);//vision : 유해감지
		List<String> labelBag=vision.detectLabels(filePath);//vision : 태그뽑기
//		List<Face> faceList = vision.detectFaces(uploadedPath);//vision : 얼굴감지
		List<String> addLabel = vision.detectWebDetections(filePath);

		model.addAttribute("logo", logocheck);
		model.addAttribute("safe", safecheck);
		model.addAttribute("label", labelBag);
		model.addAttribute("label2", addLabel);
		model.addAttribute("picPath",vision.picturePath);
//		model.addAttribute("face",faceList);
		
		System.out.println("labelBag: "+labelBag);//지워라라라라라라라라라ㅏㄹㄹㄹ
		return jsonview;
	}
	
	/**
	* 날      짜 : 2018. 6. 8.
	* 메소드명 : upload
	* 작성자명 : 이아림
	* 기      능 : 업로드 페이지로 이동
	*
	* @return String
	*/
	@RequestMapping("upload.ps")
	public String upload() {
		return "mypage.upload";
	}
	
	/**
	* 날      짜 : 2018. 6. 7.
	* 메소드명 : visionCheck
	* 작성자명 : 이아림
	* 기      능 : 비전으로 사진정보 가져오기
	*
	* @param filePath
	* @param model
	* @return View
	* @throws Exception
	*/
	@RequestMapping(value = "vision.ps", method=RequestMethod.POST)
	public View visionCheck(MultipartHttpServletRequest filePath,Model model) {
		String uploadedPath= vision.fileUpload(filePath);//실경로 파일 업로드
		String logocheck=vision.detectLogos(uploadedPath);//vision : 로고감지
		String safecheck=vision.detectSafeSearch(uploadedPath);//vision : 유해감지
		List<String> labelList=vision.detectLabels(uploadedPath);//vision : 태그뽑기
//		List<Face> faceList = vision.detectFaces(uploadedPath);//vision : 얼굴감지
		for(String label : vision.detectWebDetections(uploadedPath)) {
			labelList.add(label);
		}
		
		List<String> labelListKo = googleTranslation.translation(labelList);
		
		
		model.addAttribute("logo", logocheck);
		model.addAttribute("safe", safecheck);
		model.addAttribute("label", labelList);
		model.addAttribute("label2", labelListKo);
		model.addAttribute("picPath",vision.picturePath);
//		model.addAttribute("face",faceList);
		
		return jsonview;
	}
}