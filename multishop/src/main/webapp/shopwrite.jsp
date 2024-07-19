<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
var n=0; // type="file"의 class이름뒤에 붙이기 위한 값
function add()
{
	   // 객체를 자바스크립트 변수에 전달
	   var imgform=document.getElementById("imgform");  // $("#imgform")
	   var file=document.getElementsByClassName("file"); // $(".file")
	   
	   // 최대크기를 제한
	   if(file.length < 10)
	   {
		   n++;
		   var oldvalue=imgform.innerHTML;
		   imgform.innerHTML=oldvalue+"<p class='file'> <input type='file' name='fname"+n+"'> </p>";
	   }
}
function del()
{
	   var file=document.getElementsByClassName("file");
	   // 최소크기를 제한 => 무조건 하나를 남기겠다
	   if(file.length > 1)
	   {
		   // class="file"의 가장 앞에 있는 것 지우기
		   file[file.length-1].remove();
	   }
	   
}



</script>
</head>
<body>
<form method="post" action="shopwriteOk.jsp" enctype="multipart/form-data">
    <table width="700" align="center">
     <caption> <h3> 쇼핑몰 상품 등록 </h3></caption>
      <tr>
        <td> 옷 종류</td>
        <td>
        <select name="clothes_type" id="clothes_type">
        	<option value="0">티셔츠</option>
        	<option value="1">바지</option>
        	<option value="2">치마</option>
        	<option value="3">원피스</option>
        	<option value="4">아우터</option>
        </select>
      	</td>
      </tr>
      <tr>
        <td> 가 격 </td>
        <td> <input type="text" name="price" id="price"> </td>
      </tr>
      <tr>
        <td> 상품명 </td>
        <td> <input type="text" name="itemname" id="itemname"> </td>
      </tr>
      <tr>
        <td> 상품 한줄 설명 </td>
        <td> <input type="text" name="itemline" id="itemline"> </td>
      </tr>
      <tr>
        <td> 상품 상세 설명 </td>
        <td> <textarea name="detail" id="detail"></textarea> </td>
      </tr>
      <tr>
        <td>상품 사진</td>
        <td>
          <button type="button" onclick="add()">추가</button>
          <button type="button" onclick="del()">삭제</button>
          <input type="button" onclick="view()" value="소스보기">
          <div id="imgform">
            <p class="file"> <input type="file" name="fname0"> </p>
          </div> 
        </td>
      </tr>
      <tr>
        <td colspan="2" align="center"> <input type="submit" value="올리기" id="submit"> </td>
      </tr>
    </table>
  </form>
  
  <hr>
  <div id="bb"></div>

</body>
</html>