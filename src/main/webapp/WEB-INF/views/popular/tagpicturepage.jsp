<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="text/javascript">
	
	
	$(document).on('click','#like',function(){
		var data = {userNo : ${sessionScope.user.userNo},
			    picNo : $(this).attr("value")};
		var respect =  $(this);
		var rpa = $(this).parent();
		 $.ajax({
			url : "<%=request.getContextPath()%>/picture/increaserespect.ps",
			data : data,
			success : function(data){
				if(data.result==1){
					  $(respect)[0].innerHTML = 'favorite_border';
					  $(rpa)[0].childNodes[1].nodeValue--;
				  }else{
					  $(respect)[0].innerHTML = 'favorite';
					  $(rpa)[0].childNodes[1].nodeValue++;
				  }
			}
		 }) 
	})
	
	$(document).on('click','#down',function(){
		var data = {userNo : ${sessionScope.user.userNo},
			    picNo : $(this).attr("value")};
		var bookmark = $(this);
		var bpa = $(this).parent();
		 $.ajax({
			url : "<%=request.getContextPath()%>/picture/increasebookmark.ps",
			data : data,
			success : function(data){
				if(data.result==1){
					  $(bookmark)[0].innerHTML = 'bookmark_border';
					  $(bpa)[0].childNodes[1].nodeValue--;
				  }else{
					  $(bookmark)[0].innerHTML = 'bookmark';
					  $(bpa)[0].childNodes[1].nodeValue++;
				  }
			}
		 }) 
	}) 
</script>

<style type="text/css">
.img-size {
	height: 300px;
}
</style>

<div class="page-header header-filter" data-parallax="true"
	style="background-image: url('<%=request.getContextPath()%>/assets/img/city-profile.jpg');">
	
</div>
<div class="main main-raised">
	<div class="profile-content">
		<div class="container">
		
			<div class="row">
				<div class="col-md-12 ml-auto mr-auto">
					<select class="selectpicker " data-style="select-with-transition" title="#${tag}" data-size="7">
					    <option value="1">#TEST1</option>
					    <option value="2">#TEST2</option>
					    <option value="3">#TEST3</option>
					</select>
				</div>
			</div> 
			<div id="gallery">
				<div class="flex_grid credits">
					<c:forEach items="${tagpicList}" var="tagpic"
						varStatus="status">
						<div class="item" data-w="640" data-h="426"
							style="width: 255px; height: 300px; display: block;">
							<a href="<%=request.getContextPath()%>/picture/picinfo.ps?picNo=${tagpic.picNo}"> <img class="rounded img-size"
								src="<%=request.getContextPath()%>/${tagpic.picPath}"
								alt="">
							</a>
							<div>
			                    <div class="counts hide-xs hide-sm ">
			                    <c:choose>
									<c:when test="${tagpic.respectCheck eq 'T'}">
										<em><i id="like" value="${tagpic.picNo}" class="material-icons">favorite</i>${tagpic.respectCount}</em>
									</c:when>
									<c:otherwise>
										<em><i id="like" value="${tagpic.picNo}" class="material-icons">favorite_border</i>${tagpic.respectCount}</em>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${tagpic.bookmarkCheck eq 'T'}">
										<em><i id="down" value="${tagpic.picNo}" class="material-icons">bookmark</i>${tagpic.bookmarkCount}</em>
									</c:when>
									<c:otherwise>
										<em><i id="down" value="${tagpic.picNo}" class="material-icons">bookmark_border</i>${tagpic.bookmarkCount}</em>
									</c:otherwise>
								</c:choose>
			                    </div>
			                    <a href="<%=request.getContextPath()%>/picture/mystudio.ps?userNo=1"></a>
               				</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
