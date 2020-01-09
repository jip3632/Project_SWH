/**
 * 
 */

function init(){
	var url = location.href;
	var confmKey = "devU01TX0FVVEgyMDIwMDEwOTE1MjExNTEwOTM3Nzk="
	var resultType = "4";
	
	var inputYn= "<%=inputYn%>";
	
	if(inputYn != "Y"){
		document.form.confmKey.value = confmKey;
		document.form.returnURL.value = url;
		document.form.resultType.value = resultType;
		document.form.action= "http://www.juso.go.kr/addrlink/addrLinkUrl.do";
		
		document.form.submit();
	}else{
		opener.jusoCallBack("<%=roadFullAddr%>","<%=roadAddrPart1%>","<%=addrDetail%>","<%=roadAddrPart2%>", "<%=engAddr%>", "<%=jibunAddr%>","<%=zipNo%>","<%=admCd%>","<%=rnMgtSn%>","<%=bdMgtSn%>", "<%=detBdNmList%>","<%=bdNm%>","<%=bdKdcd%>", "<%=siNm%>","<%=sggNm%>","<%=emdNm%>", "<%=liNm%>","<%=rn%>","<%=udrtYn%>","<%=buldMnnm%>","<%=buldSlno%>","<%=mtYn%>", "<%=lnbrMnnm%>","<%=lnbrSlno%>","<%=emdNo%>");
		window.close();
	}
}