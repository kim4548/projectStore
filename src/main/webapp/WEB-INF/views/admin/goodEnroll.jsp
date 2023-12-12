<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style>
                          #result_card img{
                              max-width: 100%;
                              height: auto;
                              display: block;
                              padding: 5px;
                              margin-top: 10px;
                              margin: auto;
                          }
    #result_card {
        position: relative;
    }
    .imgDeleteBtn{
        position: absolute;
        top: 0;
        right: 5%;
        background-color: #ef7d7d;
        color: wheat;
        font-weight: 900;
        width: 30px;
        height: 30px;
        border-radius: 50%;
        line-height: 26px;
        text-align: center;
        border: none;
        display: block;
        cursor: pointer;
    }






    /* Styles for the Product Registration form */
    .admin_content_wrap {
        width: 40%;
        margin: 50px auto;
        background-color: #f9f9f9;
        border: 1px solid #ddd;
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .admin_content_subject {
        text-align: center;
        font-size: 24px;
        margin-bottom: 20px;
    }

    .admin_content_main {
        display: flex;
        flex-direction: column;
    }

    .form_section {
        margin-bottom: 20px;
    }

    .form_section_title {
        font-weight: bold;
        margin-bottom: 5px;
    }

    .form_section_content {
        display: flex;
        flex-direction: column;
    }

    .form_section_content input,
    .form_section_content textarea {
        width: 100%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
        margin-top: 5px;
        font-size: 16px;
    }

    .form_section_content input[type="file"] {
        height: 30px;
        margin-top: 10px;
    }

    .ck_warn {
        display: none;
        color: red;
        margin-top: 5px;
    }

    .btn_section {
        display: flex;
        justify-content: flex-end;
        margin-top: 20px;
    }

    .btn {
        padding: 10px 20px;
        margin-left: 10px;
        font-size: 16px;
        cursor: pointer;
        border: none;
        border-radius: 4px;
        background-color: #007bff;
        color: #fff;
    }

    .btn:hover {
        background-color: #0056b3;
    }

</style>




</head>
<body>


<div class="admin_content_wrap">
    <div class="admin_content_subject"><span>상품 등록</span></div>
    <div class="admin_content_main">
        <form action='<c:url value="/admin/goodEnroll1"/>' method="post" id="enrollForm">
            <div class="form_section">
                <div class="form_section_title">
                    <label>상품명</label>
                </div>
                <div class="form_section_content">
                    <input name="sellName">
                    <span class="ck_warn sellName_warn">상품명을 입력해주세요.</span>
                </div>
            </div>

            <div class="form_section">
                <div class="form_section_title">
                    <label>상품 가격</label>
                </div>
                <div class="form_section_content">
                    <input name="sellPrice" value="0">
                    <span class="ck_warn sellPrice_warn">상품 가격을 입력해주세요.</span>
                </div>
            </div>
            <div class="form_section">
                <div class="form_section_title">
                    <label>상품 재고</label>
                </div>
                <div class="form_section_content">
                    <input name="sellCount" value="0">
                    <span class="ck_warn sellCount_warn">상품 재고를 입력해주세요.</span>
                </div>
            </div>

            <div class="form_section">
                <div class="form_section_title">
                    <label>상품 소개</label>
                </div>
                <div class="form_section_content bit">
                    <textarea name="sellIntro" id="bookIntro_textarea"></textarea>
                    <span class="ck_warn sellIntro_warn">상품 소개를 입력해주세요.</span>
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
        <div class="btn_section">
            <button id="cancelBtn" class="btn">취 소</button>
            <button id="enrollBtn" class="btn enroll_btn" formaction="<c:url value='/admin/goodEnroll1'/>">등 록</button>
        </div>
        </form>
    </div>
</div>



<script>

    let enrollForm = $("#enrollForm")

    /* 취소 버튼 */
    $("#cancelBtn").click(function(){

        location.href="/admin/goodsManage"

    });

    /* 상품 등록 버튼 */
    $("#enrollBtn").on("click",function(e){

        e.preventDefault();

        /* 체크 변수 */
        let sellNameCk = false;
        let priceCk = false;
        let countCk = false;
        let introCk = false;


        /* 체크 대상 변수 */
        let sellName = $("input[name='sellName']").val();
        let sellPrice = $("input[name='sellPrice']").val();
        let sellCount = $("input[name='sellCount']").val();
        let sellIntro = $(".bit p").html();


        /* 공란 체크 */
        if(sellName){
            $(".sellName_warn").css('display','none');
            sellNameCk = true;
        } else {
            $(".sellName_warn").css('display','block');
            sellNameCk = false;
        }




        if(sellPrice != 0){
            $(".sellPrice_warn").css('display','none');
            priceCk = true;
        } else {
            $(".sellPrice_warn").css('display','block');
            priceCk = false;
        }

        if(sellCount != 0){
            $(".sellCount_warn").css('display','none');
            countCk = true;
        } else {
            $(".sellCount_warn").css('display','block');
            countCk = false;
        }



        if(sellIntro != '<br data-cke-filler="true">'){
            $(".sellIntro_warn").css('display','none');
            introCk = true;
        } else {
            $(".sellIntro_warn").css('display','block');
            introCk = false;
        }


        /* 최종 확인 */
        if(sellNameCk  && countCk &&  introCk ){
            //alert('통과');
            enrollForm.submit();
        } else {
            return false;
        }

    });


    /* 위지윅 적용 */

    /* 소개 */
    ClassicEditor
        .create(document.querySelector('#sellIntro_textarea'))
        .catch(error=>{
            console.error(error);
        });

    /* 이미지 업로드 */
    $("input[type='file']").on("change", function(e){

        /* 이미지 존재시 삭제 */
        if($(".imgDeleteBtn").length > 0){
            deleteFile();
        }

        let formData = new FormData();
        let fileInput = $('input[name="uploadFile"]');
        let fileList = fileInput[0].files;
        let fileObj = fileList[0];

        if(!fileCheck(fileObj.name, fileObj.size)){
            return false;
        }

        formData.append("uploadFile", fileObj);

        $.ajax({
            url: "/admin/uploadAjaxAction",
            processData : false,
            contentType : false,
            data : formData,
            type : 'post',
            dataType : 'json',
            success : function(result){
                console.log(result);
                showUploadImage(result);
            },
            error : function(result){
                alert("이미지 파일이 아닙니다.");
            }
        });


    });

    /* var, method related with attachFile */
    let regex = new RegExp("(.*?)\.(jpg|png)$");
    let maxSize = 1048576; //1MB

    function fileCheck(fileName, fileSize){

        if(fileSize >= maxSize){
            alert("파일 사이즈 초과");
            return false;
        }

        if(!regex.test(fileName)){
            alert("해당 종류의 파일은 업로드할 수 없습니다.");
            return false;
        }

        return true;

    }


    <%--/* 이미지 출력 */--%>
    <%--function showUploadImage(uploadResultArr){--%>

    <%--    /* 전달받은 데이터 검증 */--%>
    <%--    if(!uploadResultArr || uploadResultArr.length === 0){return}--%>
    <%--    let uploadResult = $("#uploadResult");--%>
    <%--    let obj = uploadResultArr[0];--%>
    <%--    let str = "";--%>
    <%--    let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);--%>
    <%--    str += "<div id='result_card'>";--%>
    <%--    str += <c:url var="fileUrl" value="/display">--%>
    <%--        <c:param name="fileName" value="${fileCallPath}" />--%>
    <%--        </c:url>--%>

    <%--        <c:out value="<img src='${fileUrl}' />" escapeXml="false" />--%>
    <%--    str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";--%>
    <%--    str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";--%>
    <%--    str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";--%>
    <%--    str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";--%>
    <%--    str += "</div>";--%>
    <%--    uploadResult.append(str);--%>
    <%--}--%>
    function showUploadImage(uploadResultArr) {
        if (!uploadResultArr || uploadResultArr.length === 0) {
            return;
        }

        const uploadResult = $("#uploadResult");
        const { uploadPath, uuid, fileName } = uploadResultArr[0];

        const fileCallPath = encodeURIComponent(`${uploadPath.replace('/\\/g', '/')}/s_${uuid}_${fileName}`);

        const imageElement =
        `<div id="result_card">
            <img src="/display?fileName=${fileCallPath}">
            <div class="imgDeleteBtn" data-file="${fileCallPath}">x</div>
            <input type="hidden" name="imageList[0].fileName" value="${fileName}">
            <input type="hidden" name="imageList[0].uuid" value="${uuid}">
            <input type="hidden" name="imageList[0].uploadPath" value="${uploadPath}">
        </div>
    `;

        uploadResult.append(imageElement);
    }


    /* 이미지 삭제 버튼 동작 */
    $("#uploadResult").on("click", ".imgDeleteBtn", function(e){

        deleteFile();

    });

    /* 파일 삭제 메서드 */
    function deleteFile(){

        let targetFile = $(".imgDeleteBtn").data("file");

        let targetDiv = $("#result_card");

        $.ajax({
            url: '/admin/deleteFile',
            data : {fileName : targetFile},
            dataType : 'text',
            type : 'POST',
            success : function(result){
                console.log(result);

                targetDiv.remove();
                $("input[type='file']").val("");

            },
            error : function(result){
                console.log(result);

                alert("파일을 삭제하지 못하였습니다.")
            }
        });
    }


</script>

</body>
</html>