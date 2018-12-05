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
    <title>Background Configuration</title>
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
	
 
     <script src="js/cpsd.js" type="text/javascript"></script> 
	
	
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
			  if($('#file').val().length==0){
				 $.jBox.alert("Please select the Background icon to upload","Tips"); 
			 }else{
			
			    var ajaxbg = $("#background,#progressBar");
			    $('#searchForm').ajaxSubmit({
			                url:'<%=basePath%>background/uploadpage',
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
		 
		 
		 
		function findimg(id){
			//var id= encodeURI(encodeURI(id));
               $.jBox.open("iframe:<%=basePath%>/background/Imageview?id="+id+"", "Background" ,500, 420,{
                   buttons: {  'Return': "cancel"},
                   loaded: function (h) {
                    
                   },
                    
                   closed: function(){
               
                   } 
               });
		}
		 
		function deletemessage(id){
			 $.jBox.confirm("Are you sure you want to delete it?", "Delete prompt", function (v, h, f) {
		         if (v == 'ok'){
		        	   $.ajax({
		   		            type:"post",
		   		            url:"<%=basePath%>background/deleteImage?id="+id,
		   		            success:function(result){
			   		        	$.jBox.confirm("Delete success!","Tips",function(v){	   		        	 
			   		        		query(); 
			   		        	});    
		   		         } 
		   		      });
		         }
		         return true;                                  
		     });
		}
		 
		function query(){
			   $("#searchForm").attr(
						"action",
						"<%=basePath%>/background/configure");
				loading('Enquiries, please wait a moment...');
	           $("#searchForm").submit();
		}
	</script>
</head>

<body>
  <div id="background" class="background" style="display: none; "></div> 
<div id="progressBar" class="progressBar" style="display: none; ">Upload, please wait a moment...</div>
	<div class="place">
   <span>Location:</span>
    <ul class="placeul">
    <li>Background Management</li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle">
 
    
    <span>Background Configuration</span>
 
    </div>
    <form action="/background/uploadpage" method="post" id="searchForm" enctype="multipart/form-data" >
	    <ul class="forminfo">
		    
		        <li style="width:280px;">
		        <label><font color="#f00" >*</font>Upload Background</label>
	    		 <input type="file"  id="file" name="image" accept="image/*" /> <i id="accTip" style="color: #f00;"></i>
	    	   </li>
		     
  	     	 <li style="width:1px;"><label>&nbsp;</label>
 	     	 <input type="button" onclick="savemess();" id="add" class="btn" class="dfinput"  value="Save"/>
               </li>		     
	    </ul>
	      
    </form>
    
              <div class="rightinfo">
        
			    <table class="imgtable">
			       <p style="text-align:center"><b>Advertising Photo Browsing</b></p>
			       <br>
				    <thead>
				    <tr>	    
					    <th width="100px;">Serial#</th>
					    <th>Background URL</th>
					    <th>Preview</th>
				    </tr>
				    </thead>
				    
				    <tbody>
				    <c:forEach items="${Backgroundlist}" var="obj" varStatus="sta">
					    <tr>		    
						    <td class="imgtd">${sta.index+1}</td>
						   
						    <td>${obj.background}</td>	
						    <td> 
						      <a href="javascript:void(0)" onclick="findimg('${obj.id}');" class="tablelink">View</a>
						      <a href="javascript:void(0)" onclick="deletemessage('${obj.id}');" class="tablelink">Delete</a>
						      </td>	
							 
					    </tr>
				    </c:forEach>
				     </tbody>
			    
			       </table>
			         
    </div>
   
    </div>
       

</body>
</html>