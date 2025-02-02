<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BHP SYSTEM</title>
<link rel="shortcut icon" href="<c:url value='/resources/images/favicon.ico'/>" type="image/x-icon"/>
<link rel="icon" href="<c:url value='/resources/images/favicon.ico'/>" type="image/x-icon"/>
 <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
 <style>
		 html{
			padding:0px;
		}
 		 body{
           
        }
        button:hover{
        	cursor: pointer;
        }
        .container{
        	height: 500px; 
            height:500px;
        	padding: 0%;
        }
        .title{
            
            margin-top: 10%;
            display: flex;
            justify-content: space-around;
        }
        .content-container{
            
            display: flex;
            justify-content: space-around;
            padding: 0%;
        }
        .select {
           display:flex;
           justify-content:center;
           
           padding:0;
           width:100%;
           margin-bottom:15px;
           
        }

       .filter-title{
        display: flex;
        width:33%;
        justify-content: center;
        font-size:24px;
        color:white;
        background-color: gray;
        border: 1px solid black;
       }

       .selectOne{
       display: flex;
        justify-content: center;
        width:100%;
       }

       .filter{
        display: flex;
        padding: 0;
        border:1px solid black;
        width:33%;
        align-items: center;
        flex-direction: column;
       	height:400px; 
       	overflow: scroll;
       	overflow-x:hidden;
       	
       
       }
       
       .selectedBtn:hover{
		cursor: pointer;
		
	}
       
       .filter::-webkit-scrollbar{
      		display: none;
	   }
	   .filterCon{
	   	width:70%;
	   	display: flex;
	   	justify-content: center;
	   }
       
       
       .filterCon>button{
        width:100%;
        margin-top:15px;
        justify-content: center;
        align-items: center;
        background: none;
        border:none;
        font-weight: bold;
        font-size:20px;
       }
       .results{
       	width:100%;
       	height:100px;
       }
      
       
       .selectedEmp{
        display: flex;
       }
       .selectedBtn{
       	border:none;
       	background:none;
       	font-size:16px;
       	padding:3px;
       	margin-left:2%;
       	color:gray;
       	font-weight:bold;
       }
       .submit{
       	width:100%;
       	display: flex;
       	height:50px;
       	justify-content: center;
       	
       }
       
       .done{
        width:40%;
        htight:90%;
        border-radius:10px;
       	display: flex;
       	justify-content: center;
       	align-content: center;
       	padding: 0 auto;
       	background-color: gray;
       	color:white;
       	font-size:30px;
       	font-weight: bold;
       	border: none;
       	
       	
       }
       .done:hover{
       	scale:1.1;
       }
       .done:active{
       scale:0.9;
        background-color: black;
       }
       
      
    </style>
</head>
<body>
	<div class="contailner">
		<div class="title">
	    	<div class="filter-title">
	        	<label>부서</label>
	    	</div>
	    	<div class="filter-title">
	        	<label>팀</label>
	    	</div>
	    	<div class="filter-title">
	        	<label>직급, 성함</label>
	    	</div>
	    </div>
	    <div class="content-container">
	
	        <div class="filter" id="dept">
	          
	            <c:forEach var="dept" items="${deptList}">
	            	<div class="filterCon">
	             	   <button name="dept" value="dept.deptCode" onclick="srchTeam('${dept.deptCode}')">${dept.deptName}</button>
             	   </div>
	            </c:forEach>
	           
	        </div>
	
	        <div class="filter" id="team">
	     
	        </div>
	
	        <div class="filter" id="emp">
	      
	        </div>
	    </div>
	    <div class="results">
		    <span>결제 순서대로 체크해 주세요.</span>
		    <form id="selectedEmp">
		      	
		    </form>
	    </div>
	    	<div class="submit">
	    		<button type="button" class="done" onclick="done('${type}')">확인</button>
			</div>	     
	</div>
<script>
	
	var checkMan={
			"sameSign":	true,
			"sameRef":	true,
			"ovarlap":	true
	};
	
	function srchTeam(e){
		$('#team').empty();
        $('#emp').empty();
        let filter= $('#team')[0];
        
       		console.log('filter:', filter);
       
        //해당부서의 하위 팀
        $.ajax({
        	url:"/doc/srchTeam.do",
        	type:"post",
        	data:{"deptCode":e},
        	success:function(res){
        		res.forEach(function (teamData) {
        		    const button = document.createElement('button');
        		    button.type = "button";
        		    button.className="selectEmp";
        		    button.name = "team";
        		    button.value = teamData.teamCode;
        		    button.textContent = teamData.teamName;
        		    button.addEventListener('click', function () {
        		        srchEmp(teamData.teamCode);
        		        console.log(srchEmp);
        		    });

        		    // 버튼을 filter 요소에 추가
        		    const filterDiv = document.createElement('div');
        		    filterDiv.className = "filterCon";
        		    filterDiv.appendChild(button);
        		    filter.appendChild(filterDiv);
        		});
        		console.log(res);
        	},
        	error:function(){
        		console.log("오류");
        	}
        });
        
	}
	
	//해당 팀의 사원들
	function srchEmp(e){
		 $('#emp').empty();
		 $.ajax({
		        url: "/doc/srchEmp.do",
		        type: "post",
		        data: {"teamCode": e,
		        		"empCode":${loginEmp.empCode}},
		        success: function(res) {
		            console.log(res);
		            res.forEach(function(empData) {
		                
		                const button = document.createElement('button');
		                button.type = "button"; 
		                
		                button.value = empData.empCode;
						button.textContent = empData.rankName + " " + empData.empName;
		                
		                button.addEventListener('click', function() {
		                	
		                        addEmp(empData);  
		                    
		                });

		                // div로 하나로 묶기
		                const selectDiv = document.createElement('div');
		                selectDiv.className = "filterCon";
		                selectDiv.appendChild(button);
		               

		                // 해당 div를 #emp 컨테이너에 추가
		                const empContainer = document.getElementById('emp');
		                empContainer.appendChild(selectDiv);
		            });
		        },
		        error: function() {
		            console.log("오류");
		        }
		    });
    	
	}
	

	
	
	
	function addEmp(e){
		const div=document.createElement('div');
		 const selectEmp = document.getElementById('selectedEmp');
		 const empContainer = document.getElementById('emp');
		 
				window.opener.chkSignList();
				
				  opener.parent.chkRefList();
				

			    console.log(window.opener.signList);
			if('${type}'=='sign'){
				if ( opener.parent.signList.includes(e.empCode)) {
			        alert('이미 중복된 결재자가 있습니다.');
			        return;

 				}if ( opener.parent.refList.includes(e.empCode)) {
			        alert('한 사원이 동시에 참조 및 결재를 할 수 없습니다.');
			        return;

 				}
			}else{
				
				if ( opener.parent.refList.includes(e.empCode)) {
			        alert('이미 중복된 참조자가 있습니다.');
					return;
			    }
				if ( opener.parent.signList.includes(e.empCode)) {
			        alert('한 사원이 동시에 참조 및 결재를 할 수 없습니다.');
			        return;

 				}


			}
		$('#selectedEmp').children().each(function(){
		var emp=$(this).attr('id');
			if(e.empCode == emp){
				 alert('이미 추가된 사람입니다.');
// 				 return;
				exit();
			}
			
				
			
			
		});	 
		
	
		const select= $("<button onclick='deleteEmp(this)'></button>")
		 $(select).type="button";
		 $(select).attr("class","selectedBtn")
		 $(select).html(e.rankName+" "+e.empName);
		 $(select).attr('id', e.empCode);
		 $('#selectedEmp').append(select);
		 $(select).attr('value',e.empCode);
		 
			
	}
	
	
	function deleteEmp(obj){
		$(obj).remove();
	    }
	
	//결재자, 참조자 선택 완료
	function done(e){
		
		
		
		$('#selectedEmp').children().each(function(){
			
			if(e=="sign"){
				
				window.opener.$("#sign").append($(this));	
 				
			}else{
			
 				window.opener.$("#ref").append($(this));
			}
		});
 				self.close();
		
	}
	
	
</script>
</body>
</html>