var console = window.console || { log:function(){} };

function fc_logInAjax(userid, pwd, callback, retObj){
	var param = {userid:userid, pwd:SHA256(pwd)};
	$.ajax({
		type : "POST",
		url : "/common/logInAjax.do",
		dataType : 'json',
		data : param,
		success : function(data) {
//			alert(JSON.stringify(data));
			console.log(JSON.stringify(data));
			if(typeof(callback)=="function"){
				callback.call(retObj, data);
			}
		},
		error : function(xmlHttpObj) {
			alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
		}
	});	
}

function fc_logOut(){
	if(confirm("로그아웃 하시겠습니까")){
	   	location.replace("/common/logOut.do");
	}
}

function fc_regUserInfo(sid, userid, pwd){
	var param = {sid:sid, userid:userid, pwd:SHA256(pwd)};
	var notify = function notify(data){
		alert("회원가입 완료되었습니다.");
	   	location.replace("/index.do");
	}
	$.ajax({
		type : "POST",
		url : "/common/regUserInfo.do",
		dataType : 'json',
		data : param,
		success : function(data) {
//			alert(JSON.stringify(data));
			console.log(JSON.stringify(data));
			if(data.qryRslt=="Y"){
				fc_logInAjax(userid, pwd, notify);
			}
		},
		error : function(xmlHttpObj) {
			alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
		}
	});
}

function fc_createSysUser(sid, userid, pwd){
	var param = {ss_id:sid, ss_userid:userid, pwd:SHA256(pwd)};
	$.ajax({
		type : "POST",
		url : "/common/createSysUser.do",
		dataType : 'json',
		data : param,
		success : function(data) {
//			alert(JSON.stringify(data));
			console.log(JSON.stringify(data));
			if(data.qryRslt=="Y"){
				alert("등록되었습니다.");
			   	location.replace("/index.do");
			}
		},
		error : function(xmlHttpObj) {
			alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
		}
	});
}

function fc_getUserInfo(userid, pwd, callback, retObj){
	var param = {userid:userid, pwd:SHA256(pwd)};
	$.ajax({
		type : "POST",
		url : "/common/getUserInfo.do",
		dataType : 'json',
		data : param,
		success : function(data) {
//			alert(JSON.stringify(data));
			console.log(JSON.stringify(data));
			if(typeof(callback)=="function"){
				callback.call(retObj, data);
			}
		},
		error : function(xmlHttpObj) {
			alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
		}
	});	
}

function fc_DisplayDiv(targetDiv, isDisplay) {
    if(isDisplay){
 	   targetDiv.style.display="";    
    }else{
  	   targetDiv.style.display="none";    
    }
}

function fc_addRow(tbody_id) {
	$("#" + tbody_id).append($("#" + tbody_id + " tr:first").clone());
}

function fc_clearRow(tbody_id) {
	$("#" + tbody_id + " tr").each(function(index){
//		console.log("index==>" + index);
		if(index!=($(this).length-1)){
			$(this).remove();
		}
	});
}


function fc_HighLightTR(target, backColor, textColor) {
	var orgBColor = '#ffffff';
	var orgTColor = '#000000';
	var tbody = target.parentNode;
	var trs = tbody.getElementsByTagName('tr');
	for (var i = 0; i < trs.length; i++) {
		if (trs[i] != target) {
			trs[i].style.backgroundColor = orgBColor;
			trs[i].style.color = orgTColor;
		} else {
			trs[i].style.backgroundColor = backColor;
			trs[i].style.color = textColor;
		}
	} // endfor i
}

function fc_OnlyNumber(target){
	$(target).val($(target).val().replace(/[^0-9]/gi,""));
}

function fc_chgImgFile(inpFile, targetImg) {
	var file = inpFile.files[0];    	
	var imageType = /^image\//;
	
	if (!imageType.test(file.type)) {
        alert('이미지 파일 형식이 아닙니다.');
//		$(targetImg).attr("src", "");
		return;
	}
	var reader = new FileReader();
	reader.onload = function(e){
		$(targetImg).attr("src", e.target.result);
	}
	reader.readAsDataURL(file);
}

function fc_uploadAjax(param, callback, retObj){
//	return; // 개발서버 test(운영계 폴더확인후)
    $('#uploadForm').ajaxSubmit({
		url: "/common/file/upload.do", //컨트롤러 URL
		type : "POST",
		dataType : 'json',
		data : param,
		success : function(data) {
//			alert(JSON.stringify(data));
			console.log(JSON.stringify(data));
			if(typeof(callback)=="function"){
				callback.call(retObj, data);
			}
		},
		error : function(xmlHttpObj) {
			alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
		}
	});	
}

function fc_base_unload_img(target, targetImg) {
	if (/(MSIE|Trident)/.test(navigator.userAgent)) { 
	    // ie 일때 input[type=file] init.
	    console.log("ie........");
	    target.replaceWith( target.clone(true) );
	} else {
	    // other browser 일때 input[type=file] init.
	    target.val("");
	}
    targetImg.attr("src", "/images/footer_logo.png");
	console.log(target.val());
}

function fc_setCodeRadio(name, sVal) {
	$('input:radio[name=' + name + ']:input[value='+ sVal+']').prop("checked", true);

}
	
function getComboAniCls1(target, sVal, param) {
	var selObj = $(target);
	var targetUrl = '/common/code/selectAniCls1List.do';
    $.getJSON(targetUrl, param, function(result){
    	$(target + " option:first").nextAll().remove();
		for(var i=0; i<result.length; i++){
			var data = result[i];
    		var text = data.MAC_NAME;
    		var value = data.MAC_ANICODE1;
			selObj.append("<option value='" + value + "'>" + text + "</option>");
    		if(value == sVal){
    			selObj.val(value);
    		}
		}
    });
}

function getComboMajorAniCls1(target, sVal, param) {
	var selObj = $(target);
	var targetUrl = '/common/code/selectAniCls1List.do';
    $.getJSON(targetUrl, param, function(result){
    	$(target + " option:first").nextAll().remove();
		for(var i=0; i<result.length; i++){
			var data = result[i];
			if(!(data.MAC_ANICODE1=="A" || data.MAC_ANICODE1=="B" || data.MAC_ANICODE1=="H" || data.MAC_ANICODE1=="I" || data.MAC_ANICODE1=="M" || data.MAC_ANICODE1=="R")){
				continue;
			}
    		var text = data.MAC_NAME;
    		var value = data.MAC_ANICODE1;
			selObj.append("<option value='" + value + "'>" + text + "</option>");
    		if(value == sVal){
    			selObj.val(value);
    		}
		}
    });
}

function getComboAniRank(target, sVal, param) {
	var selObj = $(target);
	var targetUrl = '/common/code/selectAniRankList.do';
	$.getJSON(targetUrl, param, function(result){
		$(target + " option:first").nextAll().remove();
		for(var i=0; i<result.length; i++){
			var data = result[i];
			var text = data.MCC_S_NAME;
			var value = data.MCC_S_CODE;
			selObj.append("<option value='" + value + "'>" + text + "</option>");
			if(value == sVal){
				selObj.val(value);
			}
		}
	});
}

function getComboAniCites(target, sVal, param) {
	var selObj = $(target);
	var targetUrl = '/common/code/selectAniCitesList.do';
	$.getJSON(targetUrl, param, function(result){
		$(target + " option:first").nextAll().remove();
		for(var i=0; i<result.length; i++){
			var data = result[i];
			var text = data.MCC_S_NAME;
			var value = data.MCC_S_CODE;
			selObj.append("<option value='" + value + "'>" + text + "</option>");
			if(value == sVal){
				selObj.val(value);
			}
		}
	});
}

function getComboVvrm(target, sVal, param) {
	var selObj = $(target);
	var targetUrl = '/common/code/selectVvrmList.do';
	$.getJSON(targetUrl, param, function(result){
		$(target + " option:first").nextAll().remove();
		for(var i=0; i<result.length; i++){
			var data = result[i];
			var text = data.MVI_VVRMNAME;
			var value = data.MVI_VVRMNO;
			selObj.append("<option value='" + value + "'>" + text + "</option>");
			if(value == sVal){
				selObj.val(value);
			}
		}
	});
}

function getMultiComboVvrm(target, sArr, param) {
	var selObj = $(target);
	var targetUrl = '/common/code/selectVvrmList.do';
	$.getJSON(targetUrl, param, function(result){
		$(target + " option:first").nextAll().remove();
		for(var i=0; i<result.length; i++){
			var data = result[i];
			var text = data.MVI_VVRMNAME;
			var value = data.MVI_VVRMNO;
			$(target).append("<option value='" + value + "'>" + text + "</option>");
		}
		$(target).multipleSelect({
	        multiple: true,
            styler: function(value) {
                if (sArr.indexOf(value) != '-1') {
                    return 'background-color: #ffee00; color: #ff0000;';
                }
            }
		});      
//		console.log(sArr);
		$(target).multipleSelect("setSelects", sArr);
	});
}

function getMultiComboSyPtn(target, sArr, param) {
	var selObj = $(target);
	var targetUrl = '/common/code/selectSyPtnList.do';
	$.getJSON(targetUrl, param, function(result){
		$(target + " option:first").nextAll().remove();
		for(var i=0; i<result.length; i++){
			var data = result[i];
			var text = data.MCC_S_NAME;
			var value = data.MCC_S_CODE;
			$(target).append("<option value='" + value + "'>" + text + "</option>");
		}
		$(target).multipleSelect({
			width:param.width,
			multipleWidth : 220,
	        multiple: true,
            styler: function(value) {
                if (sArr.indexOf(value) != '-1') {
                    return 'background-color: #ffee00; color: #ff0000;';
                }
            }
		});      
//		console.log(sArr);
		$(target).multipleSelect("setSelects", sArr);
	});
}

function getComboAuthGrp(target, sVal, param) {
	var selObj = $(target);
	var targetUrl = '/common/code/selectAuthGrpList.do';
	$.getJSON(targetUrl, param, function(result){
		$(target + " option:first").nextAll().remove();
		for(var i=0; i<result.length; i++){
			var data = result[i];
			var text = data.MCC_S_NAME;
			var value = data.MCC_S_CODE;
			if(data.MCC_S_CODE=="SA" || data.MCC_S_CODE=="MU"){
				continue;
			}
			selObj.append("<option value='" + value + "'>" + text + "</option>");
			if(value == sVal){
				selObj.val(value);
			}
		}
	});
}

function getComboTeamAuthGrp(target, sVal, param) {
	var selObj = $(target);
	var targetUrl = '/common/code/selectTeamAuthGrpList.do';
	$.getJSON(targetUrl, param, function(result){
		$(target + " option:first").nextAll().remove();
		for(var i=0; i<result.length; i++){
			var data = result[i];
			var text = data.MCC_S_NAME;
			var value = data.MCC_S_CODE;
			if(data.MCC_S_CODE=="SA"){
				continue;
			}
			selObj.append("<option value='" + value + "'>" + text + "</option>");
			if(value == sVal){
				selObj.val(value);
			}
		}
	});
}

function getComboDpt(target, sVal, callback, retObj) {
	var selObj = $(target);
	var targetUrl = '/common/code/selectDptList.do';
	$.getJSON(targetUrl, sVal, function(result){
		$(target + " option:first").nextAll().remove();
		for(var i=0; i<result.length; i++){
			var data = result[i];
			var text = data.MDI_DPTNAME;
			var value = data.MDI_LINKNO;
			selObj.append("<option value='" + value + "'>" + text + "</option>");
			if(value == sVal){
				selObj.val(value);
			}
		}
		if (typeof (callback) == "function") {
			callback.call(retObj, selObj.val());
		}
	});
}

function getComboDptTeam(target, mti_dptno, sVal) {
	var selObj = $(target);
	var param = {
			mti_dptno : mti_dptno
	};
	console.log("mti_dptno::" + mti_dptno);
	var targetUrl = '/common/code/selectDptTeamList.do';
	$.getJSON(targetUrl, param, function(result){
		$(target + " option:first").nextAll().remove();
		for(var i=0; i<result.length; i++){
			var data = result[i];
			var text = data.MTI_TEAMNAME;
			var value = data.MTI_TEAMNO;
			selObj.append("<option value='" + value + "'>" + text + "</option>");
			if(value == sVal){
				selObj.val(value);
			}
		}
	});
}

function getComboJccode(target, sVal, param) {
	var selObj = $(target);
	var targetUrl = '/common/code/selectJccodeList.do';
	$.getJSON(targetUrl, param, function(result){
		$(target + " option:first").nextAll().remove();
		for(var i=0; i<result.length; i++){
			var data = result[i];
			var text = data.MCC_S_NAME;
			var value = data.MCC_S_CODE;
			selObj.append("<option value='" + value + "'>" + text + "</option>");
			if(value == sVal){
				selObj.val(value);
			}
		}
	});
}

function fc_paging(totalPages, visiblePages, callback, retObj){
    $('#pagination').twbsPagination('destroy');
    $('#pagination').twbsPagination({
        totalPages: totalPages,
        visiblePages: visiblePages,
        first : '<a href="#" class="page first"></a>',
        prev : '<a href="#" class="page prev"></a>',
        next : '<a href="#" class="page next"></a>',
        last : '<a href="#" class="page last"></a>',
        onPageClick: function (event, page) {
            console.log(page + ' (from options)');
        }
    }).on('page', function (event, page) {
        console.log(page + ' (from event listening)');
		if(typeof(callback)=="function"){
			callback.call(retObj, page);
		}
    });
}