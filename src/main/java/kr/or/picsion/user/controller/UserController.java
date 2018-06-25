package kr.or.picsion.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.picsion.picture.dto.Picture;
import kr.or.picsion.picture.service.PictureService;
import kr.or.picsion.user.dto.User;
import kr.or.picsion.user.service.UserService;


/**
 * @project Final_Picsion
 * @package kr.or.picsion.user.controller 
 * @className UserController
 * @date 2018. 6. 12.
 */

@Controller
@RequestMapping("/user/")
public class UserController {

	@Autowired
	private View jsonview;

	@Autowired
	private UserService userService;
	
	@Autowired
	private PictureService pictureService;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping(value="register.ps", method=RequestMethod.GET)
    public String register(){
        return "user.register";
    }
	
	@RequestMapping(value="register.ps", method=RequestMethod.POST)
	public String userRegister(User user) {
		userService.register(user);
		return "redirect:/home.ps";
	}
	
	@RequestMapping(value="login.ps", method=RequestMethod.GET)
	public String userLogint() {
		return "user.login";
	}
	
	
	@RequestMapping(value="login.ps", method=RequestMethod.POST)
	public String userLogin(User user, HttpSession session) {
		User loginUser = userService.login(user);
		String result="";
		if(loginUser != null) {
			session.setAttribute("user", loginUser);
			if(loginUser.getRoleNo()==3) {
				result = "redirect:/user/admin.ps";
			}else {
				result = "redirect:/home.ps";
			}
		}else {
			result = "redirect:/user/login.ps";
		}
		return result;
	}
	
	@RequestMapping("logout.ps")
	public String userLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/home.ps";
	}
	
	@RequestMapping("admin.ps")
	public String adminPage(Model model) {
		
		List<User> userList = userService.userList();
		model.addAttribute("userList",userList);
		return "admin.admin";
	}
	
	@RequestMapping("adminUserDel.ps")
	public View userDel(int userNo, Model model) {
		
		int result = userService.userDel(userNo);
		model.addAttribute("result",result);
		return jsonview;
	}
	
	@RequestMapping("adminAllUser.ps")
	public View userFindAll(Model model) {
		List<User> userList = userService.userList();
		model.addAttribute("allUser",userList);
		return jsonview;
	}
	
	@RequestMapping("adminUserSearch.ps")
	public View userSearch(String userId, Model model) {
		
		User user = userService.searchUserId(userId);
		model.addAttribute("searchUser",user);
		return jsonview;
	}
	
	
	//팔로잉하는 사람의 최신 사진 전체 페이지
	@RequestMapping(value="popular.ps", method=RequestMethod.GET)
	public String getList(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		List<Picture> followingPicList = userService.listpic(user.getUserNo()); //팔로잉 최신 사진 리스트
		List<User> followingPicListOwner = userService.listpicown(user.getUserNo()); //사진 주인 리스트
		System.out.println(followingPicList);
		model.addAttribute("imagelistall", followingPicList);
		model.addAttribute("ownlist",followingPicListOwner);
		
		return "popular.followingpicall";
	}
	
	@RequestMapping(value="userlist.ps")
	public String userList(Model model) {
		
		List<User> userList = userService.userList();
		model.addAttribute("testbb", userList);
		return "home.admin";
	}
	
	//팔로잉 하고 있는지 확인
	@RequestMapping("following.ps")
	public View followingConfirm(int userNo, int followingUserNo, Model model) {
		
		int result = userService.followingConfirm(userNo, followingUserNo); 

		if(result!=0) {		//result가 1이면 팔로잉 취소 처리
			userService.deleteFollow(userNo, followingUserNo);
			System.out.println("팔로잉 취소 완료!!");
		}else {				//result가 0이면 팔로우 처리
			userService.insertFollow(userNo, followingUserNo);
			System.out.println("팔로잉 완료!!!");
		}		
		
		model.addAttribute("result", result);
		
		return jsonview;
	}
	
	//즐겨찾기한 사진 목록보기 페이지로 이동
	@RequestMapping("bookmarklist.ps")
	public String myBookmark(HttpSession session, Model model) {
		System.out.println("myBookmark 컨트롤");
		User user = (User)session.getAttribute("user");
		System.out.println(user.getUserNo());
		List<Picture> bookmarkPicList = userService.bookmarkPicList(user.getUserNo());
		List<User> bookmarkPicUserList = userService.bookmarkPicUserList(user.getUserNo());
		model.addAttribute("bookmarkPicList", bookmarkPicList);
		model.addAttribute("bookmarkPicUserList",bookmarkPicUserList);
		
		return "mypage.bookmark";
	}
	
	//팔로잉한 회원의 목록보기 페이지로 이동
	@RequestMapping("followinglist.ps")
	public String myFollowing(HttpSession session, Model model) {
		System.out.println("myFollowing 컨트롤");
		User user = (User)session.getAttribute("user");
		
		List<User> followingList = userService.followingUserList(user.getUserNo());
		
		model.addAttribute("followingList", followingList);
		
		return "mypage.following";
	}
	
	//정보 수정 페이지로 이동 (회원의 정보 검색해서)
	@RequestMapping("updateinfo.ps")
	public String updatePage(HttpSession session) {
		User user = (User)session.getAttribute("user");
		
		return "mypage.updateinfo";
	}
	
}
