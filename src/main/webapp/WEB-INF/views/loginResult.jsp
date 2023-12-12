<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
    <!-- (1) LoginWithNaverId Javscript SDK -->
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</head>
<body>
<!-- callback 처리중입니다. 이 페이지에서는 callback을 처리하고 바로 main으로 redirect하기때문에 이 메시지가 보이면 안됩니다. -->

<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
<script>

    var naver_id_login = new naver_id_login("Q6268OHw9RpPoJv6vatk", "http://localhost/login/callback/naverLogin");
    // 접근 토큰 값 출력
    /* alert(naver_id_login.oauthParams.access_token); */
    var naverToken = naver_id_login.oauthParams.access_token;

    // 네이버 사용자 프로필 조회
    naver_id_login.get_naver_userprofile("naverSignInCallback()");

    // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
    function naverSignInCallback() {
        /* alert(naver_id_login.getProfileData('email'));
        alert(naver_id_login.getProfileData('name'));
        alert(naver_id_login.getProfileData('birthday')); */

        var email = naver_id_login.getProfileData('email');
        var name = naver_id_login.getProfileData('name');

        $.ajax({
            url: '/login/naverLogin',
            data: {emailAccount: email, memName: name, naverToken: naverToken},
            dataType: 'text',
            type: 'POST',
            success: function (result) {
                if (result == 'success') {
                    alert("로그인 되었습니다.");
                    window.location.replace("/");
                } else {
                    alert("오류가 생겼습니다. 잠시 후 다시 시도해주세요.");
                }
            }
        });	// $.ajax
    }
</script>
</body>
</html>