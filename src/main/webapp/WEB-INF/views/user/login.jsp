<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <div class="section section-signup page-header" style="background-image: url('<%=request.getContextPath()%>/assets/img/bg3.jpg');">
      <div class="container">
        <div class="row">
          <div class="col-md-4 ml-auto mr-auto">
            <div class="card card-signup">
              <form class="form" method="post" action="">
                <div class="card-header card-header-primary text-center">
                  <h4>Sign Up</h4>
                  <div class="social-line">
                    <a href="#pablo" class="btn btn-link btn-just-icon">
                      <i class="fa fa-facebook-square"></i>
                    </a>
                    <a href="#pablo" class="btn btn-link btn-just-icon">
                      <i class="fa fa-twitter"></i>
                    </a>
                    <a id="naver_id_login"></a>
                  </div>
                </div>
                <p class="text-divider">Or Be Classical</p>
                <div class="card-body">
                  <span class="bmd-form-group"><div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="material-icons">face</i>
                      </span>
                    </div>
                    <input type="text" class="form-control" name="userId" placeholder="아이디...">
                  </div></span>
                  <span class="bmd-form-group">
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="material-icons">lock_outline</i>
                      </span>
                    </div>
                    <input type="password" class="form-control" name="pwd" placeholder="비밀번호...">
                  </div>
                  </span>

                <div class="form-check">
                    <label class="form-check-label">
                        <input class="form-check-input" type="checkbox" value="">
                        		아이디 기억하기
                        <span class="form-check-sign">
                            <span class="check"></span>
                        </span>
                    </label>
                </div>
                </div>
                <div class="card-footer justify-content-center">
                  <button type="submit" class="btn btn-link btn-primary btn-lg">Start</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <input type="hidden" value="${sessionScope.result}" id="result">
    
<script type="text/javascript">
  	var naver_id_login = new naver_id_login("AavwsVovOeUd6Ijvt3W0", "http://127.0.0.1:8090/picsion/naver/login.ps");
  	var state = naver_id_login.getUniqState();
    naver_id_login.response_type="code"; 
  	naver_id_login.setDomain("http://127.0.0.1:8090/picsion/login.ps"); 
  	naver_id_login.setState(state);
  	naver_id_login.init_naver_id_login();
  	
  	var result = $('#result').val()
  	setTimeout(() => {
  		if(result =="F"){
  			alert('연동된 계정이 없습니다')
  		  	<%session.removeAttribute("result");%>
  		}
	}, 1000);
  	

</script>