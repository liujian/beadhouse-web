<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>菜单维护</title>
<style type="text/css">
.ztree li span.button.chk.checkbox_false_full {
	background-position: 5px 5px;
}

.ztree li span.button.chk.checkbox_false_full_focus {
	background-position: 5px 26px;
}
</style>


<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>editor/kindeditor.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox_style.css" />
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery-jbox/2.3/jquery.jBox-2.3.js"></script>

<script src="<%=basePath%>js/cpsd.js" type="text/javascript"></script>

<link
	href="<%=basePath%>js/jquery-ztree/3.5.12/css/metroStyle/metroStyle.css"
	rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/bootstrap-custom.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<script
	src="<%=basePath%>js/jquery-ztree/3.5.12/js/jquery.ztree.all-3.5.min.js"
	type="text/javascript"></script>

<script type="text/javascript">
	///***********************树**********************
	  var datas = '[{"id":14573,"nameWithCode":"菜单列表","isParent":"true","nameCn":"菜单列表","parentOrgCode":"","code":"0","nameWithCodeBusinessUnit":"","businessUnit":""}]';
	  datas =$.parseJSON(datas); 
	  $(document).ready(function() {
      var inputsetting = {
          view: {
              dblClickExpand: false
          },
          check:{
              enable: true,
              chkboxType: { "Y": "", "N": "" }
          },
          data: {
              simpleData: {
                  enable: true,
                 /*  idKey : "id",     
                  pIdKey : "parentid" */
                  idKey : "code",     
                  pIdKey : "parentOrgCode"
              },
              key:{
                  name:"nameWithCode"
              }
          },
          async:{
              enable:true,
              url:"<%=basePath%>/commoncontrol/findChildOrgList",
              autoParam:["code"]
          },
          callback: {
              onCheck:onCheck,
              
              onAsyncSuccess: zTreeOnAsyncSuccessPublic
          }
      };
      $.fn.zTree.init($("#inputTreeDemo"), inputsetting, datas);

  });
	  //回显
	  function zTreeOnAsyncSuccessPublic(event, treeId, treeNode, msg) {
		   var zTree = $.fn.zTree.getZTreeObj("inputTreeDemo");
		  var idd=$('#menuid').val();
		   var nodes = zTree.getNodesByParam("id", idd, null);
	        zTree.checkNode(nodes[0],true,true);
 
		  }

function onCheck(event, treeId, treeNode){
	 
 
       $('#menuname').val("");
       $('#menuid').val("");
      var zTree = $.fn.zTree.getZTreeObj("inputTreeDemo");
      nodes = zTree.getCheckedNodes(true);

      if(nodes.length>1){           
        for(var i=0;i<nodes.length;i++){
         
        	
            if(treeNode['code']==nodes[i]['code']){
                 zTree.checkNode(nodes[i], true, false);
            }else{
                 zTree.checkNode(nodes[i], false, false);
            }

        }
      
           $('#menuname').val(treeNode['nameCn']);

           $('#menuid').val(treeNode['code']);
            

        //多选
       //$.jBox.tip("最多只能选择10个机构！","error");

       //zTree.cancelSelectedNode(treeNode);

       //zTree.checkNode(treeNode, false, false);

       //return false;
      }else{
    	  
      v = "";
      id = "";
      code="";
     
      nodes.sort(function compare(a,b){return a.id-b.id;});
      for (var i=0, l=nodes.length; i<l; i++) {
    	  
          v += nodes[i].nameCn + ",";
          id += nodes[i].id + ",";
          code+=nodes[i].code+",";
      }
      
      if (v.length > 0 ) v = v.substring(0, v.length-1);
      $('#menuname').val(v);
      if (id.length > 0 ) id = id.substring(0, id.length-1);
      if(code.length>0)code=code.substring(0,code.length-1);
      $('#menuid').val(code);
      }

  }

  function showMenu() {
      if($("#menuContent").css("display")=="block"){
          $("#menuContent").css("display","none");
        }else{
          var treeInput = $("#menuname");
          var treeInputWidth=$("#menuname").width()+10;
          var treeInputOffset = $("#menuname").offset();
          $("#menuContent").css({width:treeInputWidth,left:treeInputOffset.left + "px", top:treeInputOffset.top + treeInput.outerHeight() + "px"}).slideDown("fast");
      
          $("body").bind("mousedown", onBodyDown);
        }
  }
  function hideMenu() {
      $("#menuContent").fadeOut("fast");
      $("body").unbind("mousedown", onBodyDown);
  }
  function onBodyDown(event) {
      if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
          hideMenu();
      }

  }  
	$(function(){
		
	 
		});
	 
	function dataverify(){
	    var p1 = document.getElementById("actionname").value;
        if(isEmpty(p1)){    
           $.jBox.alert("权限名称 栏不能为空","提示"); 
            return ;
        } 
         var p2 = $("#action").val();
        if(isEmpty(p2)){
        	$.jBox.alert(" 权限标识 栏不能为空","提示");
              return ;
        }
        var p3=$("#remark").val();
        if(isEmpty(p3)){
        	$.jBox.alert(" 描述 栏不能为空","提示");
              return ;
        } 
        var p4=$("#menuid").val();
        if(isEmpty(p4)){
        	$.jBox.alert(" 菜单id 栏不能为空","提示");
              return ;
        } 
        
        if(isEmpty("${obj.id}")){
        //数据重复校验
            $.ajax({
                   url:"<%=basePath%>/Author/authorityaddverify",
                   dataType:"json",
                    data:{
                    	action:p2 
                    },
                   type:"post",
                   success:function(data){
                     if(data.msg=="1"){
                  	   savemess();
                     }else{
                  	   $.jBox.alert(data.msg,"提示");
                  	   return;
                     }
                    }
             }); 
        }else{ 
        	savemess();
        } 
		 //  savemess();
     }
	 function savemess(){
		 	//var str=$("#selecttpye").val();
	     	//document.getElementById("type1").value=str;
	     	 
     	    if("${obj.id}"==null||"${obj.id}"==""){
     		   $("#searchForm").attr("action","<%=basePath%>/Author/authorityAdd");
     		   loading('保存中，请稍等...');
         	   $("#searchForm").submit(); 
	     	}else{
	     		// var title= encodeURI(encodeURI($("#title").val()));
	     		// var keywords= encodeURI(encodeURI("${keywords}"));
	     		// $("#answerandContent").attr("action","/Author/muenadd?title="+title+"&keywords="+keywords+"");
	     	$("#searchForm").attr("action","<%=basePath%>/Author/authorityUpdate");
	     		 loading('保存中，请稍等...');
		        $("#searchForm").submit();
	     	} 
	   }
	 function goback(){ 
		 var keywords= encodeURI(encodeURI("${keywords}"));
		 window.location.href="<%=basePath%>
	/Author/authorityList?keywords="
				+ keywords + "";
	}
</script>

</head>

<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li>权限管理</li>
			<c:if test="${obj.id==null}">
				<li>新增权限</li>
			</c:if>
			<c:if test="${obj.id!=null}">
				<li>编辑权限</li>
			</c:if>
		</ul>
	</div>

	<div class="formbody">
		<div class="formtitle">
			<c:if test="${obj.id==null}">
				<span>新增权限</span>
			</c:if>
			<c:if test="${obj.id!=null}">
				<span>编辑权限</span>
			</c:if>
		</div>
		<form action="<%=basePath%>/Author/authorityAdd" method="post"
			id="searchForm">
			<ul class="forminfo">
				<li><label><font color="#f00">*</font>权限名称</label>
					<div class="span6">
						<input name="actionname" id="actionname" type="text"class="dfinput" value="${obj.actionname}" />
					</div>
				</li>
				<li><label><font color="#f00">*</font>权限标识</label>
					<div class="span6">
						<input name="action" id="action" type="text" class="dfinput" value="${obj.action}" />
					</div>
				</li>
				<li><label><font color="#f00">*</font>描述</label>
					<div class="span6">
						<%-- <input name="remark" id="remark" type="text" class="dfinput" value="${obj.remark}" /> --%>
						<textarea name="remark" id="remark" rows="" cols="" class="textinput">${obj.remark}</textarea>
					</div>
				</li>

				<li><label>菜单ID</label>

					<div class="span6">

						<div class="combo_tree" style="width: 60%">
							<div class="input-append combo_input_box">
								<input type="text" id="menuname" name="menuname"
									style="height: 30px;" value="${obj.menuname}"
									class="add-on-after-input combo_input" autocomplete="off"/>
								<span class="add-on add_for_tree" id="menuBtn" onclick="showMenu(); return false;">∨</span> 
								<input
									type="hidden" id="menuid" name="menuid" style="height: 30px;"
									value="${obj.menuid}" class="add-on-after-input combo_input"
									autocomplete="off"/>
							</div>
							<div id="menuContent" class="menuContent"
								style="height: 300px; overflow: auto; width: 881px; left: 49px; top: 160px; display: none;">
								<ul id="inputTreeDemo" class="ztree ztree_custom"></ul>
							</div>
						</div>
					</div></li>

				<li><label>&nbsp;</label>
					<div class="span6">
						<input name="id" id="id" type="hidden" value="${obj.id}" />
						<input
							type="button" onclick="dataverify()" class="btn btn-primary"
							value="保存" /> &nbsp;&nbsp; <input type="button"
							onclick="goback()" id="add" class="btn btn-primary" value="返回" />
					</div>
				</li>
			</ul>
		</form>
	</div>
</body>
</html>
