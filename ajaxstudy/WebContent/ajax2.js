/*
 * 자바스크립트에서 객체를 생성.
 * 콜백함수에서 ajax 객체를 매개변수로 전달하는 방법.
 */
var ajax = {} // 객체
ajax.xhr = {} // 객체
ajax.xhr.Request = function(url,params,callback,method) { // ajax.xhr.Request 객체의 생성자 구현
   // 멤버 변수 : url , params , callback , method, req
   // 멤버 메서드 : send, getXmlHttpRequest, onStateChange
   this.url = url;
   this.params = params;
   this.callback = callback;
   this.method = method;
   this.send();
}
// prototype : 멤버 구현.
ajax.xhr.Request.prototype = {
      getXmlHttpRequest : function() {
         if(window.ActiveXObject) {
            try {
               return new ActiveXObject("Msxml2.XMLHTTP");
            } catch(e) {
               try {
                  return new ActiveXObject("Microsoft.XMLHTTP");
               } catch(e2) { return null; }
            }         
         } else if(window.XMLHttpRequest) {
         return new XMLHttpRequest();
      } else {
         return null;
      }
   },
      send : function () {
         // this.req : ajax 객체 저장
         this.req = this.getXmlHttpRequest();
         var httpMethod = this.method?this.method:"GET";
         if(httpMethod != "GET" && httpMethod != "POST") {
            httpMethod = "GET";
         }
         var httpParams =
      (this.params == null || this.params == '')?null:this.params;
         var httpUrl = this.url;
         if(httpMethod == 'GET' && httpParams != null) {
            httpUrl = httpUrl + "?" + httpParams;
         }
         this.req.open(httpMethod,httpUrl,true); // ajax 준비
         this.req.setRequestHeader // 전송을 위한 Header 정보 설정
            ("Content-Type","application/x-www-form-urlencoded");
         var request = this; // this : ajax.xhr.Request 객체
            this.req.onreadystatechange = function() { // 콜백함수 등록
               request.onStateChange.call(request); // call : 매개변수 설정.
            }
            this.req.send(httpMethod =="POST"?httpParams:null); // 서버로전송.
         },
         onStateChange : function() {
            this.callback(this.req); // 콜백함수 호출시 ajax 객체 전달
         }
      }