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
    <title>Theme Color and Logo</title>
	<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
 .background { 
    display: block; 
    width: 100%; 
    height: 100%; 
    opacity: 0.4; 
    filter: alpha(opacity=40); 
    background:while; 
    position: absolute; 
    top: 0; 
    left: 0; 
    z-index: 2000; 
} 
.progressBar { 
    border: solid 2px #86A5AD; 
    background: white url(<%=basePath%>/images/progressBar_m.gif) no-repeat 10px 10px; 
} 
.progressBar { 
    display: block; 
    width: 160px; 
    height: 28px; 
    position: fixed; 
    top: 30%; 
    left: 40%; 
    margin-left: -74px; 
    margin-top: -14px; 
    padding: 10px 10px 10px 50px; 
    text-align: left; 
    line-height: 27px; 
    font-weight: bold; 
    position: absolute; 
    z-index: 2001; 
} 
.rightinfo {
    padding: 8px;
    margin-left: 40%;
    margin-top: -9%;
} 
.pagin {
    position: relative;
    margin-top: 10px;
    margin-left: 30%;
    padding: 0 12px;
}
</style>
	<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox_style.css" />
	<script type="text/javascript" src="<%=basePath%>js/jquery-jbox/2.3/jquery.jBox-2.3.js"></script>
	
 
   <!--  <script src="js/cpsd.js" type="text/javascript"></script> -->
	
	
	<script type="text/javascript" src="<%=basePath%>js/jquery.form.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
			 
		  $(".click").click(function(){
		  $(".tip").fadeIn(200);
		  });
		  
		  $(".tiptop a").click(function(){
		  $(".tip").fadeOut(200);
		});

		  $(".sure").click(function(){
		  $(".tip").fadeOut(100);
		});
		   
		  $(".cancel").click(function(){
		  $(".tip").fadeOut(100);
		}); 
		  

		});
 
		 function savemess(){  
			 if($('#code').val().length==0){
				 $.jBox.alert("Please select the theme color.","Tips"); 
			 }else if($('#file').val().length==0){
				 $.jBox.alert("Please select the Logo icon to upload","Tips"); 
			 }else{
			
			    var ajaxbg = $("#background,#progressBar");
			    $('#searchForm').ajaxSubmit({
			                url:'<%=basePath%>Theme/uploadpage',
			                data:$('#searchForm').serialize(),
			                type:"POST",
			                beforeSend:function()
			                {  
			                    ajaxbg.show(); 
			                },
			                success:function(msg)
			                {   
			                    ajaxbg.hide(); 
			                    
			                    $.jBox.confirm("Save successfully!","Tips",function(v){
			                    	 window.location.reload(); 
			                    });
			                    
			        
			                },
			                error:function(){
			                    ajaxbg.hide(); 
			                    alert("Import failed!");
			                }
			            });
			      }

		     }
		 
		 
		 
		function findimg(logo){
			//var id= encodeURI(encodeURI(id));
               $.jBox.open("iframe:<%=basePath%>/Theme/Imageview?logo="+logo+"", "Logo" ,500, 420,{
                   buttons: {  'Return': "cancel"},
                   loaded: function (h) {
                    
                   },
                    
                   closed: function(){
               
                   } 
               });
		}
		 
		function query(){
			   $("#searchForm2").attr(
						"action",
						"<%=basePath%>/pic/uploadImageList");
			//	loading('正在查询，请稍等...');
	           $("#searchForm2").submit();
		}
		function goPage(page){  
		    document.getElementById("currentpage").value=page;   
		    var keywords= encodeURI(encodeURI($("#keywords").val()));
			$("#pagenation").attr("action","<%=basePath%>/pic/uploadImageList?keywords="+keywords+"");
	    	$("#pagenation").submit();
	 	} 
	</script>
</head>

<body>
  <div id="background" class="background" style="display: none; "></div> 
<div id="progressBar" class="progressBar" style="display: none; ">Upload, please wait a moment...</div>
	<div class="place">
   <span>Location:</span>
    <ul class="placeul">
    <li>Logo and Theme Color Management</li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle">
 
    
    <span>Theme Color and Logo Configuration</span>
 
    </div>
    <form action="/pic/uploadpage" method="post" id="searchForm" enctype="multipart/form-data" >
	    <ul class="forminfo">
		  <!--   <li><label></label>    
		     <i id="accTip" style="color: #f00;"> </i>  </li> -->
		      
		      <li >
	    		<label >Select Theme Color</label>
	    		 <select  id="code" name="code"    class="dfinput" style="width:10%;"  >
                   <option value=""  >--paleVioleRed--</option>
                   <c:forEach items="${list}" var="a">
                     <option value="${a.code}"   <c:if test="${obj.code eq a.code }"> selected="selected"</c:if>  >${a.name } </option>
                   </c:forEach>
                 </select>
	    	   </li>
	    	   
		        <li>
	    		<label><font color="#f00">*</font>Upload Logo Picture</label>
	    		 <input type="file"  id="file" name="image" accept="image/*" /> <i id="accTip" style="color: #f00;"></i>
	    	   </li>
		     
  	     	 <li><label>&nbsp;</label>
 	     	 <input type="button" onclick="savemess();" id="add" class="btn" class="dfinput"  value="Save"/>
               </li>		     
	    </ul>
	      
    </form>
    
              <div class="rightinfo">
        
			    <table class="imgtable">
			       	 <p style="text-align:center"><b>Theme Color and Logo Browsing</b></p>
			       <br>
				    <thead>
				    <tr>	    
					    <th width="100px;">Serial#</th>
					    <th>Theme Color</th>
					    <th>Logo URL</th>
					    <th>Preview</th>
				    </tr>
				    </thead>
				    
				    <tbody>
				    <c:forEach items="${Themelist}" var="obj" varStatus="sta">
					    <tr>		    
						    <td class="imgtd">${sta.index+1}</td>
						    <td>${obj.color}</td>
						    <td>${obj.logo}</td>	
						    <td> <a href="javascript:void(0)" onclick="findimg('${obj.logo}');" class="tablelink">View</a></td>			 
					    </tr>
				    </c:forEach>
				     </tbody>
			    
			       </table>
			         
    </div>
   
    </div>
       

</body>
</html>