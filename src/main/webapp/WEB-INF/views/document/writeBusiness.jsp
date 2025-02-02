<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BHP SYSTEM</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="/resources/summernote/summernote-lite.css"/>
    <style>
      

      
        .container {
         	display: flex;
			justify-content: center;
			align-items: center;
			box-sizing: border-box;
			flex-direction: column;
		}
        

        .header {
           
         margin : auto 0;
        }

        .header h1 {
          display: flex;
			justify-content: center;
			font-size: 26px;
		   color: #333;
		   margin-bottom: 20px;
		   text-align: center;
        }


        

        .main-container{
			border: 1px solid #ccc;
			padding: 10px;
			border-radius: 8px;
		}

        .main-container> div{
            margin-left: 2%;
        }
        .main-container .content{
            width:500px;
            display: flex;
            align-items: center;

        }
        .doc-title{
           
            margin:0px ;
            margin-bottom: 10px;

        }
        
		.doc-title .title{
           
			width:100%;
            height:100%;
            font-size:17;
            
		}

       .title input{
        width: 100%;
        font-size: 20px;
        height:100%;
        align-items: center;
        border: none;
        border: 1px solid #ccc;
        border-radius: 5px;
        outline: none;
        
       }

       
        
        
        .content .type{
            width:30%;
            height:100%;
            font-weight: bold;
           background-color:#ccc;
            padding:3px;
            
            box-sizing: border-box;
           text-align: center;
        }
        

       
       .ref {
	display: flex;
	align-items: center;
	gap: 10px;
	margin-bottom: 15px;
}

.ref > button {
	padding: 8px 12px;
	border-radius: 6px;
	background-color: #007bff;
	color: white;
	border: none;
	cursor: pointer;
	transition: all 0.3s;
}

.ref > button:hover {
	background-color: #0056b3;
	transform: scale(1.05);
}

.ref > button:active {
	background-color: #003f80;
	transform: scale(1);
}

/* 선택된 버튼 스타일 */
.selectedBtn {
	border: none;
	background: none;
	font-size: 16px;
	padding: 3px;
	cursor: pointer;
	color: #007bff;
}

.selectedBtn:hover {
	text-decoration: underline;
}

/* 날짜 선택 */
.set-date {
	display: flex;
	gap: 10px;
	margin-bottom: 20px;
	align-items: center;
}

.date {
	display: flex;
	flex-direction: column;
	gap: 5px;
}

.date span {
	background: none;
	border: none;
	color: #333;
	font-weight: bold;
	margin-bottom: 5px;
}

.date input {
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 16px;
}

/* 결과 출력 */
.set-date .result {
	font-size: 16px;
	font-weight: bold;
	color: #007bff;
	margin-top: 10px;
}



/* 휴가 내용 입력 */
.bui-content {
	width: 100%;
	height: 200px;
	border: 1px solid #ccc;
	border-radius: 6px;
	padding: 10px;
	font-size: 16px;
	resize: none;
	background: #f9f9f9;
}

	.insert-file input {
	   padding: 10px;
	   cursor: pointer;
	  }

/* 버튼 스타일 */
.buttons {
	display: flex;
	justify-content: flex-end;
	gap: 15px;
	margin-top: 20px;
}

.buttons button {
	padding: 10px 20px;
	border: none;
	border-radius: 6px;
	font-size: 16px;
	cursor: pointer;
	transition: all 0.3s;
}

.buttons .submit {
	background-color: #28a745;
	color: white;
}

.buttons .submit:hover {
	background-color: #218838;
	transform: scale(1.05);
}

.buttons .cancel {
	background-color: #dc3545;
	color: white;
}

.buttons .cancel:hover {
	background-color: #c82333;
	transform: scale(1.05);
}


    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>출장 보고서</h1>
            <div class="signs"><!--결재자 정보-->
               
               
            </div>
        </div>
        <div class="main-container">
           
                <div class="doc-title">
                    <div class="content">
                        
                        <div  class="title">
                        <input id="title" type="text" name="title" placeholder="제목 입력" />
                        </div>
                    </div>
                   
               
                <div class="content">
                    <div class="type">출장지</div>
                    <div class="title">
                    <input id="place" type="text" name="place" placeholder="출장지 입력" />
                    </div>
                </div>
                <div class="content">
                    <div class="type">출장목적</div>
                    <div class="title">
                    <input id="purpose" type="text" name="purpose" placeholder="출장 목적 입력" />
                    </div>
                </div>
            </div>
              <div class="ref">
						<button type="button" onclick="searchMan('sign')">결재자 검색</button>
						<%--결재자 목록 --%>
						<div id="sign" class="sign">
						
						</div>
					</div>
					<div class="ref">
						<button type="button" onclick="searchMan('ref')">참조자 검색</button>
						<div id="ref" class="reference">
						
						</div>
					</div>

				

					<div class="set-date">
						<div class="date">
							<span >시작일자</span> <input type="date"
								id="btStart" name="start" max="9999-12-31"
								onchange="onDateChange()">
						</div>
						<div class="date" id="endDate">
							<span >종료일자</span> <input type="date" id="btEnd"
								name="end" max="9999-12-31" onchange="totalDays()">
						</div>
						<div class="result">
							<span class="result">총 0일</span>
						</div>
					</div>

					<div>
						<span >내용</span>
						<textarea  id="summernote" class="vac-content">
							
						</textarea>
					</div>
					<div class="insert-file">
						<input type="file" name="files" multiple>
					</div>
				
				<div class="buttons">
					<button class="submit" type="button" onclick="writeDocument()">작성</button>
					<button class="cancel" type="button" onclick="cancel()">취소</button>
				</div>
			</div>
		</div>
	
<script src="/resources/summernote/summernote-lite.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
              
    <script>
    var checkDocument={
    		"docTitle":	false,
    		"sign":		false,
    		"date":		false,
    		"place":	false,
    		"purpose":	false
    };
    
   
    
   
    var signList = [];
    var refList = [];


    function msg(title, text, icon, callback){
    	swal({
    		title : title,
    		text : text,
    		icon : icon
    	}).then(function(){
    		if(callback != "0"){
    			location.href = "/";
    		}
    	});
    	
    }


    //const checkDocument=null;

    //섬머노트 테스트
//          $(document).ready(function() {
            	
             $('#summernote').summernote(   {
                codeviewFilter : false, // 코드 보기 필터 비활성화
                codeviewIframeFilter : true, // 코드 보기 iframe 필터 비활성화
                height : 300, // 에디터 높이
                width : '100%',
                minHeight : null, // 최소 높이
                maxHeight : null, // 최대 높이
                focus : false, // 에디터 로딩 후 포커스 설정
                lang : 'ko-KR', // 언어 설정 (한국어)
                disableDragAndDrop : false,
                tabDisable : true,
                
                disableResizeEditor : true, // Does not work either   
                
                toolbar : [ [ 'style', [ 'style' ] ], // 글자 스타일 설정 옵션
                [ 'fontsize', [ 'fontsize' ] ], // 글꼴 크기 설정 옵션
                [ 'font', [ 'bold', 'underline', 'clear' ] ], // 글자 굵게, 밑줄, 포맷 제거 옵션
                [ 'color', [ 'color' ] ], // 글자 색상 설정 옵션
                [ 'table', [ 'table' ] ], // 테이블 삽입 옵션
                [ 'para', [ 'ul', 'ol', 'paragraph' ] ], // 문단 스타일, 순서 없는 목록, 순서 있는 목록 옵션
                [ 'height', [ 'height' ] ], // 에디터 높이 조절 옵션
                [ 'insert', [ 'picture', 'link', 'video' ] ], // 이미지 삽입, 링크 삽입, 동영상 삽입 옵션
                [ 'view', [  'fullscreen', 'help' ] ], // 코드 보기, 전체 화면, 도움말 옵션
                ],

                fontSizes : [ '8', '9', '10', '11', '12', '14', '16', '18',
                      '20', '22', '24', '28', '30', '36', '50', '72', ], // 글꼴 크기 옵션

                styleTags : [ 'p', // 일반 문단 스타일 옵션
                {
                   title : 'Blockquote',
                   tag : 'blockquote',
                   className : 'blockquote',
                   value : 'blockquote',
                }, // 인용구 스타일 옵션
                'pre', // 코드 단락 스타일 옵션
                {
                   title : 'code_light',
                   tag : 'pre',
                   className : 'code_light',
                   value : 'pre',
                }, // 밝은 코드 스타일 옵션
                {
                   title : 'code_dark',
                   tag : 'pre',
                   className : 'code_dark',
                   value : 'pre',
                }, // 어두운 코드 스타일 옵션
                'h1', 'h2', 'h3', 'h4', 'h5', 'h6', // 제목 스타일 옵션
                ],
                
                callbacks : {                                                    
                   onImageUpload : function(files, editor, welEditable) {  
                          // 다중 이미지 처리를 위해 for문을 사용했습니다.
                      for (var i = 0; i < files.length; i++) {
                	  
                         uploadImage(files[i],  $(this));
                      }
                   }
                }
            });
//           });
         
         
            $('input[name="files"]').on('change', function() {
                const files = $(this)[0].files;
               
            });
        
        function uploadImage(file, editor){
            const form = new FormData(); //<form> 태그
            form.append("uploadFile", file); //<input type="file" name="uploadFile">
            
            $.ajax ({
               url : "/doc/documentImage.do",
               type : "post", //post 필수
               data : form,  //전송 데이터
               processData : false, //기본 문자열 전송 세팅 해제
               contentType : false, //기본 form enctype 해제
               cache:false,
               success : function(savePath){
                  //savePath : 파일 업로드 경로
                  console.log(editor);
                   $(editor).summernote("insertImage", savePath);
                 console.log(savePath);
                  //게시글 작성 시, 이미지 중복 등록 방지
                //  $("input[id*=note-dialog]").remove();
               },
               error : function(){
                  console.log("오류");
               }
            });
         }

        
    	
        $('#place').on('input',function(){
        let place=$('#place').val();

    	if(place.length>0){
    		checkDocument.place=true;
    	}else{
    		checkDocument.place=false;
    	}
        	
        });


    $('#title').on('input',function(){
    	let title=$('#title').val();
    	
    	if(title.length>0){
    		checkDocument.docTitle=true;
    	}else{
    		checkDocument.docTitle=false;
    	}
    });
        $('#purpose').on('input',function(){
        	let purpose=$('#purpose').val();
        	
        	if(purpose.length>0){
        		checkDocument.purpose=true;
        	}else{
        		checkDocument.purpose=false;
        	}
        });


    //결재자
    var sign=$('#sign');
    function chkSignList(){
    signList.length=0;
    sign.children().each(function() {
        const signValue = $(this).val();
       
            signList.push(signValue);
        
    });
    }

    //참조자 확인
    var ref=$('#ref');
    function chkRefList(){
    refList.length=0;
    ref.children().each(function() {
        const refValue = $(this).val();
      
            refList.push(refValue);
        
    });
    }


    function msg(title, text, icon, callback){
    	swal({
    		title : title,
    		text : text,
    		icon : icon
    	}).then(function(){
    		if(callback != "0"){
    			location.href = "/";
    		}
    	});
    	
    }



    //날짜계산
    function totalDays() {
        const startDate =$('#btStart').val();
        const endDate = $('#btEnd').val();
        const result = document.querySelector('.result span');
        var today = new Date();
        today.setHours(0, 0, 0, 0);
        
        if (!startDate || !endDate) {
            result.textContent = "날짜를 전부 입력하라.";
            checkDocument.date=false;
            return;
        }
    	
        const start = new Date(startDate);
        
        const end = new Date(endDate);

        if (start > end) {
            result.textContent = "적절한 방식으로 입력하시오.";
            checkDocument.date=false;
            return;
           
        }
        
        
    	
        const time = end - start; 
        const days = time / (1000 * 60 * 60 * 24);
    	
        result.textContent = "총"+ (days + 1)+"일";
        checkDocument.date=true;
    }
    
    function onDateChange() {
     
        const start = document.getElementById('#btStart').value;
        const endDate = document.querySelector('#endDate');
       
         totalDays();
        
    }

    
function searchMan(e) {
		
		let popupWidth = 800;
		let popupHeight = 800;

		let left = (window.innerWidth - popupWidth) / 2;
		let top = (window.innerHeight - popupHeight) / 2;

		let popup = window
				.open("", "searchMan", "width=" + popupWidth + ", height="
						+ popupHeight + ", top=" + top + ", left=" + left);

		let form = document.createElement('form');
		form.setAttribute("action", "/doc/searchMan.do");
		form.setAttribute("method", "post");
		//form.setAttribute("data":e);
		let inputType = document.createElement('input');
		    inputType.setAttribute("type", "hidden"); 
		    inputType.setAttribute("name", "type");
		    inputType.setAttribute("value", e);
		    form.appendChild(inputType);
		   
		  
		    
		    
		popup.document.body.appendChild(form);

		form.submit();

	}
	
	function deleteEmp(obj){
		$(obj).remove();
	}
	

	
	
	var selectedFiles = []; 

	$('input[name="files"]').on('change', function() {
		selectedFiles = []
	   
	    selectedFiles = $(this)[0].files;
	    
	});
	
	
	function writeDocument() {
		 const sign = $('#sign');
	     const ref=$('#ref');
		 const list = sign.children().length;
		    if (list > 0) {
		        checkDocument.sign = true;
		    } else {
		        checkDocument.sign = false;
		    }

	    // 제목, 결재자, 날짜 검증
	    for (let check in checkDocument) {
	        if (!checkDocument[check]) {
	            switch (check) {
	                case "docTitle": msg("알림","제목을 작성하시오.","error","0"); break;
	                case "sign":msg("알림","결재자는 최소 1명 이상이어야 합니다.","error","0"); break;
	                case "date":msg("알림","날짜형식이 잘못되었습니다.","error","0"); break;
	                case "place": msg("알림","출장지를 작성하시오.","error","0"); break;
	                case "purpose": msg("알림","출장목적을 작성하시오.","error","0"); break;
	            }
	            return;
	        }
	    }
	    
	    const formData = new FormData();
	    formData.append("documentTitle", $('#title').val());
	    formData.append("documentTypeCode","bt");
	    formData.append("businessTo",$('#place').val());
	    formData.append("businessPurpose",$('#purpose').val());
	    formData.append("businessStart", $('#btStart').val());
	    formData.append("businessEnd", $('#btEnd').val());
	    formData.append("documentContent",$('#summernote').val());
		formData.append("empCode",${loginEmp.empCode});
	    
	    const signsList = [];
	    $('#sign button').each(function() {
	        signsList.push($(this).val()); 
	    });
	    formData.append("signEmpList", signsList);
			
			
	    const refsList = [];
	    $('#ref button').each(function() {
	        refsList.push($(this).val());
	    });
	    formData.append("refEmpList", refsList);
	   
	   
	    // 파일 처리
// 	    const files = $('input[name="files"]')[0].files;
// 	    console.log(files);
// 		for (let i = 0; i < files.length; i++) {
// 		    formData.append("files", files[i]);
// 		    console.log(files[i]);
// 		}
		if (selectedFiles.length > 0) {
		        for (let i = 0; i < selectedFiles.length; i++) {
		            formData.append("files", selectedFiles[i]);
		            console.log('파일 전송:', selectedFiles[i]);
		        }
		    }
	
	    
	    $.ajax({
	        url: "/doc/writeBusiness.do",
	        type: "post",
	        enctype: 'multipart/form-data',
	        data: formData,
	        processData: false,  // 파일 업로드 시 필수
	        contentType: false,  // 파일 업로드 시 필수
	        success: function(res) {
	        	  if(res>3){
		            	msg("알림","문서작성이 왼료되었습니다.","success","1")
		            }else if(res==3){
		            	msg("알림","휴가 날짜 적용중 문제가 발생했습니다.","error","0")
		            }
		            else if(res==2){
		            	msg("알림","결재자,참조자 적용중 문제가 발생했습니다.","error","0")
		            }
		            else if(res==1){
		            	msg("알림","첨부파일 적용중에 문제가 발생했습니다.","error","0")
		            }
		            else{
		            	msg("알림","문서내용 적용중 문제가 발생했습니다.","error","0")	
		            }
	        },
	        error: function() {
	            console.log("오류");
	        }
	    });
	}
	
	function cancel(){
		location.href="/";
	}


    </script>
</body>
</html>