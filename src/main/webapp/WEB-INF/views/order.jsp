<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: 김성태
  Date: 2023-11-09
  Time: 오전 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>order</title>
    <style>

        /* styles.css 파일 내용 */

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

        .container {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border: 1px solid black;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
        }



        h1 {
            margin-top: 0;
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            display: grid;
            gap: 20px;
        }

        .goto{
            padding-top: 10px;
        }

        .endCheck{
            padding-top: 10px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        select {
            width: calc(100% - 10px);
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        input[type="checkbox"] {
            margin-right: 5px;
        }

        button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #333;
            color: #fff;
            cursor: pointer;
        }

        button:hover {
            background-color: #555;
        }

        .orderInfo{
            display: flex;
            justify-items: center;
            flex-direction: column;
            align-content: space-around;
            width: 500px;
            height: 247px;
            padding-top: 10px;
        }
        .orderInfo1{
            display: flex;
            flex-direction: column;
            width: 500px;
            height: 247px;

        }
        .orderInfo2{

            display: flex;
            flex-direction: column;
            flex-wrap: wrap;
            width: 500px;
            height: 120px;
            padding-top: 39px;

        }
        .payment-info{
            display: flex;
            flex-direction: column;
            flex-wrap: wrap;
            width: 500px;
            height: 200px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<div class="container">

    <div class="totalShoppingList">
<table id="totalShoppingList">

    <h3>주문 상품 정보</h3>
    <th>
        <tr>
    <td> 주문자 ID : ${Cart.id}</td>
    </tr>
        <tr>
    <td>총 주문 상품 개수 : ${Cart.sellCount}</td>
    </tr>
    <tr>
        <td>총 주문 가격 : ${Cart.totalPrice}</td>
    </tr>
    </th>
</table>

    </div>
<form class="oderInformation">

    <div class="delivery-info">

        <div class="orderInfo">
    <h3>주문자 정보</h3>
    <input name="name" placeholder="이름" value="${User.id}">
    <input name="phoneNum" placeholder="연락처" value="${User.phoneNum}">
    <input name="email" placeholder="이메일 주소 aaaa@aaa.com" value="${User.email}">
            <input name="addressNum" placeholder="우편번호">
    <button>주소 찾기</button>
    <input name="address" placeholder="주소">
    <input name="detailAddress" placeholder="상세 주소">
        </div>

        <div class="orderInfo1">
    <h3>배송정보</h3>
            <label>주문자 정보와 동일</label>
    <input type="checkbox" id="Dupli" onclick="Dupli(this)" >
    <input name="receiverName" placeholder="수령인 이름" >
    <input name="receiverPhoneNum" placeholder="연락처">
            <input name="receiverEmail" placeholder="이메일 주소 aaaa@aaa.com" >
    <input name="receiverAddressNum" placeholder="우편번호">
    <button>주소 찾기</button>
    <input name="receiverAddress" placeholder="주소">
    <input name="receiverDetailAddress" placeholder="상세 주소">
        </div>

        <div class="orderInfo2">
    <h3>배송 메모</h3>
    <select>
        <option>부재시 연락 부탁드립니다.</option>
        <option>문 앞에 두고 가주세요</option>
        <option>경비실에 보관 부탁드립니다</option>
        <option>직접입력</option>
    </select>

        </div>
    </div>
</form>

        <div class="payment-info">
    <h3>결제 수단</h3>
    <select class="payChoice">
        <option>신용카드</option>
        <option >실시간 계좌이체</option>
        <option>가상계좌</option>
        <option>무통장입금</option>
        <option>휴대폰</option>
        <option>카카오페이</option>
    </select>

            <div class="goto"  style="display: none;">
        <input  type="text"  class="goto1" value="홍길은행 123-12344-123456 홍길동">
            <div class="copyNumberBtn">계좌번호 복사</div>
            </div>


       <div class="endCheck">
        <labal>현금 영수증 신청</labal><input type="checkbox" name="현금영수증 신청" >
       </div>


        </div>


    <button class="orderCompli" formaction="<c:url value='/payment'/>" formmethod="post">결제하기</button>
</form>
</div>

<script>
   $(document).ready(function () {
       $('#Dupli').change(function () {
           if ($(this).is(':checked')) {
               // 지금 인풋창에 있는 값을 변수에 저장
               var name = $('input[name="name"]').val();
               var phoneNum = $('input[name="phoneNum"]').val();
               var email = $('input[name="email"]').val();
               var addressNum = $('input[name="addressNum"]').val();
               var address = $('input[name="address"]').val();
               var detailAddress = $('input[name="detailAddress"]').val();


               // 넘겨주는 곳에
               $('input[name="receiverName"]').val(name);
               $('input[name="receiverPhoneNum"]').val(phoneNum);
               $('input[name="receiverEmail"]').val(email);
               $('input[name="receiverAddressNum"]').val(addressNum);
               $('input[name="receiverAddress"]').val(address);
               $('input[name="receiverDetailAddress"]').val(detailAddress);

           } else {

               // 클릭이 안되면 빈 문자열
               $('input[name="receiverName"]').val('');
               $('input[name="receiverPhoneNum"]').val('');
               $('input[name="receiverEmail"]').val('');
               $('input[name="receiverAddressNum"]').val('');
               $('input[name="receiverAddress"]').val('');
               $('input[name="receiverDetailAddress"]').val('');
           }
       });
   });


   $(document).ready(function () {
       $('.payChoice').change(function () {
           if ($(this).val() === "무통장입금") {
               $('.goto').show()
               $('.goto1').prop("readOnly",true)
           }else {
               $('.goto').hide()
           }


       });
   })

   $(document).ready(function () {
       $('.copyNumberBtn').click(function () {
           const inputValue = $('.goto1').val();
           const numberOnly = inputValue.match(/\d+/g); // 숫자만 추출

           if (numberOnly) {
               const numbers = numberOnly.join(''); // 배열을 하나의 문자열로 결합
               navigator.clipboard.writeText(numbers)
                   .then(() => {
                       alert("계좌 번호 가 복사되었습니다: " + numbers);
                   })
                   .catch(err => {
                       console.error('복사 실패: ', err);
                       alert("숫자를 복사하는 도중에 문제가 발생했습니다.");
                   });
           } else {
               alert("숫자가 없습니다.");
           }
       });
   });
</script>
</body>
</html>
