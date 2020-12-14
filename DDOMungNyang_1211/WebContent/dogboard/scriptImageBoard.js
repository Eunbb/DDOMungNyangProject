function checkImageBoardWrite() {
	var adopt=document.getElementById("adoptType");
	if($("input:checkbox[name=petId]").is(":checked") == true)
		alert("분류코드를 선택하세요");
	else if($("input:checkbox[name=sex]").is(":checked") == true)
		alert("성별을 선택하세요");
	else if(document.imageBoardWriteForm.age.value=="")
		alert("나이를 입력하세요");
	else if(document.imageBoardWriteForm.price.value=="")
		alert("금액을 입력하세요");
	else if(document.imageBoardWriteForm.imagepath.value=="")
		alert("사진 이미지를 첨부하세요");
	else
		document.imageBoardWriteForm.submit();
}