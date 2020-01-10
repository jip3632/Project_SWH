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
	document.getElementById("roadAddrPart1").value = roadAddrPart1;
	document.getElementById("roadAddrPart2").value = roadAddrPart2;
	document.getElementById("addrDetail").value = addrDetail;
	document.getElementById("zipNo").value = zipNo;
}