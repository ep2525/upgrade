/**
 *  admin.js
 */

//다중 삭제
function selectDelete() {

	var chkArr = document.getElementsByName("rowcheck");

	flag = false;
	for (var i = 0; i < chkArr.length; i++) {
		if (chkArr[i].checked == true) {
			flag = true;
		}
	}
	if (flag == false) {
		alert("삭제할 체크박스를 하나라도 선택하세요.");
		return; //돌아가 밑에는 못 간다.return t/f 중요하지 않다.
	}
	var dep = confirm("정말 삭제하시겠습니까?");
	if(dep){
		document.myform.submit();//submit 누른것처럼 동작해라.
	}
}//selectDelete

function allRowCheck(allck){ 
	var chkArr = document.getElementsByName("rowcheck");
	var check = allck.checked;	
	if (check) {﻿
        for (var i=0; i<chkArr.length; i++){ //배열의 길이만큼
        	   chkArr[i].checked = true;
        }
    } 
	else {
        for (var i=0; i<chkArr.length; i++) {
          chkArr[i].checked = false;
         }
    }
}// allRowCheck

//카테고리 유효성
function catecheck(){
	if($('input[name=code]').val()==""){
		alert('코드 입력 누락');
		$('input[name=code]').focus();
		return false;
	}		
	if($('input[name=cname]').val()==""){
		alert('이름 입력 누락');
		$('input[name=cname]').focus();
		return false;
	}		
}




//카테고리 추가
function insertCate() {
	location.href="admin_cate_insert.ad"; 
}
//카테고리 수정
function updateCate(cnum, pageNumber) {
	location.href="admin_cate_update.ad?cnum="+cnum+"&pageNumber="+pageNumber;
}
//카테고리 삭제
function deleteCate(cnum,pageNumber){
	var dep = confirm("정말 삭제하시겠습니까?");
	//prompt : 값을 입력 받을 수 있는 창 (제목, 초기값) 확인/취소 버튼이 있음.
	//comfirm : YES/NO t/f
	//alert(dep);
	if(dep){
		location.href="admin_cate_delete.ad?cnum="+cnum+"&pageNumber="+ pageNumber;
	}
}//deleteCate


//펀딩 추가
function insertPrd() {
	location.href="admin_prd_insert.ad"; 
}
//펀딩 수정
function updatePrd(p_num,pageNumber){
	location.href = "admin_prd_update.ad?p_num=" + p_num + "&pageNumber="+ pageNumber;
}//updatePrd
//펀딩 삭제
function deletePrd(p_num,pageNumber){
	var dep = confirm("정말 삭제하시겠습니까?");
	//prompt : 값을 입력 받을 수 있는 창 (제목, 초기값) 확인/취소 버튼이 있음.
	//comfirm : YES/NO t/f
	//alert(dep);
	if(dep){
		location.href="admin_prd_delete.ad?p_num="+p_num+"&pageNumber="+ pageNumber;
	}
}//deletePrd


//게시글 추가
/*function insertPrd() {
	location.href="admin_prd_insert.ad"; 
}*/
//게시글 수정
/*function updatePrd(b_num,pageNumber){
	location.href = "admin_prd_update.ad?b_num=" + b_num + "&pageNumber="+ pageNumber;
}//updatePrd*/
//게시글 삭제
function deleteBd(b_num,pageNumber){
	var dep = confirm("정말 삭제하시겠습니까?");
	//prompt : 값을 입력 받을 수 있는 창 (제목, 초기값) 확인/취소 버튼이 있음.
	//comfirm : YES/NO t/f
	//alert(dep);
	if(dep){
		location.href="admin_bd_delete.ad?b_num="+b_num+"&pageNumber="+ pageNumber;
	}
}//deletePrd



//회원정보삭제
function deleteMem(gnum){
	//alert(gnum);	//회원번호
	//var contextPath= getContextPath();
	var dep = confirm("정말 삭제하시겠습니까?");
	//prompt : 값을 입력 받을 수 있는 창 (제목, 초기값) 확인/취소 버튼이 있음.
	//comfirm : YES/NO t/f
	//alert(dep);
	if(dep){
		location.href="mem_delete_proc.jsp?gnum="+gnum;
	}
}//deleteMem


function prdcheck(){
	//alert(1);

	if($('input[name=p_subject]').val()==""){
		alert('제목 입력 누락');
		$('input[name=p_subject]').focus();
		return false;
	}	
	if($('input[name=upload]').val()==""){
		alert('이미지 입력 누락');
		$('input[name=upload]').focus();
		return false;
	}	
	if($('input[name=p_origin_price]').val()==""){
		alert('단가 입력 누락');
		$('input[name=p_origin_price]').focus();
		return false;
	}	
	if($('input[name=p_end_price]').val()==""){
		alert('목표가 입력 누락');
		$('input[name=p_end_price]').focus();
		return false;
	}		
	var p_origin_price=Number($('input[name=p_origin_price]').val());
	//alert(2);
	if(p_origin_price<1000){
		alert('단가는 최소 1,000원  이상입니다.');
		$('input[name=p_origin_price]').focus();
		return false;
	}	
	var p_end_price=Number($('input[name=p_end_price]').val());
	if(p_end_price<100000){
		alert('목표 금액은 최소 100,000원 이상입니다.');
		$('input[name=p_end_price]').focus();
		return false;
	}	
	if($('input[name=p_start_date]').val()==""){
		alert('모집기간값이 누락됐습니다.');
		$('input[name=p_start_date]').focus();
		return false;
	}	
	if($('input[name=p_end_date]').val()==""){
		alert('모집기간값이 누락됐습니다.');
		$('input[name=p_end_date]').focus();
		return false;
	}
	
	var sysday=new Date();	
	var startday=new Date($('input[name="p_start_date"]').val());	
	var endday=new Date($('input[name="p_end_date"]').val());	
	if(sysday>startday){
		alert('모집시작일이 현재보다 과거일 수 없습니다.');
		$('input[name="p_start_date"]').focus();
		return false;
	}		
	
	if(sysday>=endday){
		alert('모집마감일이 현재보다 과거일 수 없습니다.');
		$('input[name="p_end_date"]').focus();
		return false;
	}	
		
	if(startday>=endday){
		alert('모집마감일이 모집시작일보다 과거일 수 없습니다.');
		$('input[name="p_end_date"]').focus();
		return false;
	}		
	
	if($('textarea[name=p_content]').val().length<20){
		//alert($('textarea[name=pcontents]').val());
		alert('지원사업소개는 최소 20자 이상 입력해야 합니다.');
		$('textarea[name=p_content]').focus();
		return false;
	}

	if($('input[name=item_option]').val()==""){
		alert('옵셥이 누락됐습니다.');
		$('input[name=item_option]').focus();
		return false;
	}
	var opcheck=false;
	$("input[name='item_option']").each(function (i) {
		if( $("input[name='item_option']").eq(i).attr("value")==""){
			opcheck=true;
		}  
    });	
	if(opcheck){
		return false;
	}			
	return true;
}

function check(){
		//alert(1);
		if($('input[name="b_writer"]').val()==""){
			alert("이름이 누락되었습니다.");
			$('input[name="b_writer"]').focus();
			return false;
		}
		if($('input[name="b_subject"]').val()==""){
			alert("제목이 누락되었습니다.");
			$('input[name="b_subject"]').focus();
			return false;
		}
		if($('input[name="email"]').val()==""){
			alert("이메일이 누락되었습니다.");
			$('input[name="email"]').focus();
			return false;
		}
		if($('textarea[name="b_content"]').val()==""){
			alert("내용을 입력하세요.");
			$('textarea[name="b_content"]').focus();
			return false;
		}
		if($('input[name="b_passwd"]').val()==""){
			alert("비밀번호를 입력하세요.");
			$('input[name="b_passwd"]').focus();
			return false;
		}
		
	}//check
	
function noticecheck(){
		//alert(1);
		if($('input[name="no_writer"]').val()==""){
			alert("이름이 누락되었습니다.");
			$('input[name="no_writer"]').focus();
			return false;
		}
		if($('input[name="no_subject"]').val()==""){
			alert("제목이 누락되었습니다.");
			$('input[name="no_subject"]').focus();
			return false;
		}

		if($('textarea[name="no_content"]').val()==""){
			alert("내용을 입력하세요.");
			$('textarea[name="no_content"]').focus();
			return false;
		}
	
	}//check
	
function faqcheck(){
		//alert(1);
		if($('input[name="faq_writer"]').val()==""){
			alert("이름이 누락되었습니다.");
			$('input[name="faq_writer"]').focus();
			return false;
		}
		if($('input[name="faq_subject"]').val()==""){
			alert("제목이 누락되었습니다.");
			$('input[name="faq_subject"]').focus();
			return false;
		}

		if($('textarea[name="faq_content"]').val()==""){
			alert("내용을 입력하세요.");
			$('textarea[name="faq_content"]').focus();
			return false;
		}
	
	}//check

