/**
 * 
 */
function goPopup(){ 
	var pop = window.open("/popup/www.juso.go.kr/addrlink/addrLinkUrl.do","pop","width=570,height=420, scrollbars=yes, resizable=yes");  
}

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){ 
	
	   document.form.roadFullAddr.value = roadFullAddr;    
	   document.form.roadAddrPart1.value = roadAddrPart1;    
	   document.form.roadAddrPart2.value = roadAddrPart2;    
	   documentform.addrDetail.value = addrDetail;    
	   document.form.zipNo.value = zipNo;
}