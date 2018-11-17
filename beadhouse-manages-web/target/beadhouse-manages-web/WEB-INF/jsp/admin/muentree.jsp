<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>菜单维护</title>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox_style.css" />
	<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-jbox/2.3/jquery.jBox-2.3.js"></script>  
	
     <link href="<%=basePath%>js/jquery-ztree/3.5.12/css/metroStyle/metroStyle.css" rel="stylesheet" type="text/css" />
	 <link href="<%=basePath%>css/bootstrap-custom.css" rel="stylesheet" type="text/css" />
	 <link href="<%=basePath%>css/bootstrap.css" rel="stylesheet" type="text/css" />
      <script src="<%=basePath%>js/jquery-ztree/3.5.12/js/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>
      
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
                onCheck:onCheck
            }
        };
        $.fn.zTree.init($("#inputTreeDemo"), inputsetting, datas);

    });

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
           // $('#menuname').val(treeNode['nameCn']);

           // $('#menuid').val(treeNode['code']);

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
   
	</script>
	  
</head>

<body>
                   <div class="span6">
                    <label class="label_note">菜单列表</label>
	                    <div class="combo_tree" style="width:80%">
	                        <div class="input-append combo_input_box">
	                            <input placeholder="请输入机构代码、名称至少4位" type="text" id="menuname" name="useOrgName" style="height: 30px;" value="${query.useOrgName}"  class="add-on-after-input combo_input" autocomplete="off">
	                            <span class="add-on add_for_tree" id="menuBtn" onclick="showMenu(); return false;">∨</span>
	                        </div>
	                        <div id="menuContent" class="menuContent" style="height: 300px; overflow: auto; width: 881px; left: 49px; top: 160px; display: none;">
	                            <ul id="inputTreeDemo" class="ztree ztree_custom"></ul>
	                        </div>
	                    </div>
                    </div>

</body>
</html>
