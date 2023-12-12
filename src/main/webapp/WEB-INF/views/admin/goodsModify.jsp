<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="../resources/css/admin/goodsModify.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
    <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<body>



<div class="admin_content_wrap">
    <div class="admin_content_subject"><span>상품 등록</span></div>
    <div class="admin_content_main">
        <form action="<c:url value='admin/goodsModify' />" method="post" id="modifyForm">
            <div class="form_section">
                <div class="form_section_title">
                    <label>상품명 </label>
                </div>
                <div class="form_section_content">
                    <input name="bookName" value="${goodsInfo.sellName}">
                    <span class="ck_warn bookName_warn">상품명을 입력해주세요</span>
                </div>
            </div>

            <div class="form_section">
                <div class="form_section_title">
                    <label>상품 가격</label>
                </div>
                <div class="form_section_content">
                    <input name="bookPrice" value="${goodsInfo.sellPrice}">
                    <span class="ck_warn bookPrice_warn">상품 가격을 입력해주세요.</span>
                </div>
            </div>
            <div class="form_section">
                <div class="form_section_title">
                    <label>상품 재고</label>
                </div>
                <div class="form_section_content">
                    <input name="bookStock" value="${goodsInfo.sellCount}">
                    <span class="ck_warn bookStock_warn">상품 재고를 입력해주세요.</span>
                </div>
            </div>

            <div class="form_section">
                <div class="form_section_title">
                    <label>상품 소개</label>
                </div>
                <div class="form_section_content bit">
                    <textarea name="bookIntro" id="bookIntro_textarea">${goodsInfo.sellIntro}</textarea>
                    <span class="ck_warn bookIntro_warn">상품 소개를 입력해주세요.</span>
                </div>
            </div>

            <div class="form_section">
                <div class="form_section_title">
                    <label>상품 이미지</label>
                </div>
                <div class="form_section_content">
                    <input type="file" id ="fileItem" name='uploadFile' style="height: 30px;">
                    <div id="uploadResult">

                    </div>
                </div>
            </div>
            <input type="hidden" name='bookId' value="${goodsInfo.sellId}">
        </form>
        <div class="btn_section">
            <button id="cancelBtn" class="btn">취 소</button>
            <button id="modifyBtn" class="btn modify_btn">수 정</button>
            <button id="deleteBtn" class="btn delete_btn">삭 제</button>
        </div>
    </div>
    <form id="moveForm" action="<c:url value='admin/goodsModify' />" method="get" >
        <input type="hidden" name="pageNum" value="${cri.pageNum}">
        <input type="hidden" name="amount" value="${cri.amount}">
        <input type="hidden" name="keyword" value="${cri.keyword}">
        <input type="hidden" name='bookId' value="${goodsInfo.bookId}">
    </form>
</div>


<script>

    $(document).ready(function(){


        /* 위지윅 적용 */

        /* 책 소개 */
        ClassicEditor
            .create(document.querySelector('#bookIntro_textarea'))
            .catch(error=>{
                console.error(error);
            });


        /* 기존 이미지 출력 */
        let bookId = '<c:out value="${goodsInfo.bookId}"/>';
        let uploadResult = $("#uploadResult");

        $.getJSON("/getAttachList", {bookId : bookId}, function(arr){

            console.log(arr);

            if(arr.length === 0){


                let str = "";
                str += "<div id='result_card'>";
                str += "<img src='/resources/img/goodsNoImage.png'>";
                str += "</div>";

                uploadResult.html(str);
                return;
            }

            let str = "";
            let obj = arr[0];

            let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
            str += "<div id='result_card'";
            str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
            str += ">";
            str += "<img src='/display?fileName=" + fileCallPath +"'>";
            str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
            str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
            str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
            str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
            str += "</div>";

            uploadResult.html(str);

        });// GetJSON

    }); // document ready

</script>


</body>
</html>