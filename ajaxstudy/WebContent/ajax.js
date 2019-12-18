var ajax = null;
//ajax 객체 생성 기능
//표준객체의 이름: XMLHttpRequest 객체임.
function getAjaxObject(){
	if(window.ActiveXObject){//브라우저가 익스플로러?
		try{
			return new ActiveXObject("Msxml2.XMLHTTP");//익스플로러 버전 6.0이상 버전
			
		}catch(e){
			try{
				return new ActiveXObject("Microsoft.XMLHTTP");//익스플로러 버전 6.0이 버전
			}catch(e2){
				return null;
			}
		}
	}else if(window.XMLHttpRequest){ //표준화된 브라우저  익스플로러 이외의 브라우저?
		return new XMLHttpRequest(); //표준객체
	}else{
		return null;
	}
}//getAjaxObject() 함수 끝

//url : "hello.jsp"
//params : "name="+김삿갓
//callback : helloFromServer
//method : "POST"
function sendRequest(url,params,callback,method){
	//ajax : XMLHTTPRequest 객체를 저장. ajax실행하는 객체. server와 통신할 수 있는 객체
	ajax = getAjaxObject();
	//httpMethod : GET || POST둘중 한개의 값만 가질 수 있다.
	var httpMethod = method?method:"GET";
	if(httpMethod != "GET" && httpMethod != "POST"){
		httpMethod = "GET";
	}
	
	//httpParams : name=김삿갓
	var httpParams = (params == null || params == '')?null:params;
	
	//GET방식
	//httpUrl : hello.jsp?name=김삿갓 
	//POST방식
	//httpUrl : hello.jsp
	var httpUrl= url;
	if(httpMethod == "GET" && httpParams != null){
		httpUrl = httpUrl + "?" + httpParams;
	
	}
	//ajax.open : 준비하기
	//true : 비동기 방식. ajax은 비동기 방식을 쓰기 위해서 쓰이기떄문에 true넣으면된다.
	ajax.open(httpMethod,httpUrl, true);
	
	//ajax의 환경설정 헤더값.
	ajax.setRequestHeader
		("Content-Type","application/x-www-form-urlencoded");
	//callback 함수 등록
	//callback 함수는 ajax 객체의 상태가 변경 될때 마다 호출되는 함수 
	ajax.onreadystatechange = callback;
	
	//서버에 요청
	//POST방식만 send할 때 파라미터 값(name=김삿갓)전달
	ajax.send(httpMethod == "POST"?httpParams:null);
}