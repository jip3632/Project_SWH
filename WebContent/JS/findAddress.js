/**
 * 
 */
function goPopup(){ 
	var pop = window.open("addressPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");  
}

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
		, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.\
	document.getElementById("roadFullAddr").value = roadFullAddr;
	//document.getElementById("roadAddrPart1").value = roadAddrPart1;
	//document.getElementById("roadAddrPart2").value = roadAddrPart2;
	//document.getElementById("addrDetail").value = addrDetail;
	//document.getElementById("zipNo").value = zipNo;
}

function chkSubmit(){
	frm = document.forms["frm"];
	
	$("#pw_check").html("");
	var name = frm["user_name"].value.trim();
	var number = frm["phone_number"].value.trim();
	var address = frm["roadFullAddr"].value.trim();
	var id = frm["user_id"].value.trim();
	var pw = frm["user_pw"].value.trim();
	var email = frm["user_email"].value.trim();
	var pw = document.getElementById("user_pw").value;
	var pwC = document.getElementById("user_pw_confirm").value;
    var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
    var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //이메일 정규식
	
    var emailField = document.getElementById("user_email");
	var idField = document.getElementById("user_id");
	var pwField = document.getElementById("user_pw");
    
	//아이디 체크
	if(!check(re,idField, "아이디는 영문과 숫자 조합으로 4자리~12자리만 가능합니다")){
		return false;
	}
	//비밀번호 체크
	if(!check(re, pwField, "비밀번호는 영문과 숫자 조합으로 4자리~12자리만 가능합니다")){
		return false;
	}
	//이메일 체크
	if(!check(re2, emailField, "이메일 형식이 올바르지 못합니다")){
		return false;
	}
	
	if(name == ""){
		alert("이름 란은 반드시 입력해야 합니다");
		frm["name"].focus();
		return false;
	}
	if(number == ""){
		alert("번호는 반드시 작성해야 합니다");
		frm["phone_number"].focus();
		return false;
	}
	if(address == ""){
		alert("주소는 반드시 작성해야 합니다");
		frm["roadFullAddr"].focus();
		return false;
	}
	if(id == ""){
		alert("아이디는 반드시 작성해야 합니다");
		frm["user_id"].focus();
		return false;
	}
	if(pw == ""){
		alert("비밀번호는 반드시 작성해야 합니다");
		frm["user_pw"].focus();
		return false;
	}
	if(email == ""){
		alert("이메일은 반드시 작성해야 합니다");
		frm["user_email"].focus();
		return false;
	}
	if(pw!=pwC){
		pwTxt="비밀번호가 불일치 합니다";
		$("#pw_check").html(pwTxt);
		return false;
	}
	return true;
	
}

function check(re, what, message) {
    if(re.test(what.value)) {
        return true;
    }
    alert(message);
    what.focus();
    //return false;
}

function ajax() {
	userId = document.getElementById("user_id").value;
	console.log(userId);
	console.log("ajax 실행전");
	var url = "http://localhost:8085/Project_SWH/signUpUser.ajax?mb_id=" + encodeURI(userId);
	//document.write(url);
	$.ajax({
		url : url,
		type : "GET",
		cache : false,
		success : function(data, status){
			if (status == "success") parseJSON(data);
		}
	});
}

function parseJSON(data) {
	$("#id_check").html("");
    var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
	var idField = document.getElementById("user_id");
	var i;
	var count = data.count;
	var list = data.list;
	console.log(document.getElementById("user_id").value);
	var htmlTxt = "";
	var pwTxt="";
	if(document.getElementById("user_id").value == "" || !check(re,idField, "아이디는 영문과 숫자 조합으로 4자리~12자리만 가능합니다")){
		htmlTxt="아이디 형식이 올바르지 않습니다"
		var button = document.getElementById("submit_button");
		button.disabled=true;
	}else{
		if(count==0){
			htmlTxt="아이디 사용 가능합니다";
			var button = document.getElementById("submit_button");
			button.disabled = false;
		}else{
			htmlTxt="중복 아이디가 존재합니다";
			var button = document.getElementById("submit_button");
			button.disabled=true;
		}
	}
	$("#id_check").html(htmlTxt);

}