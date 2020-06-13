<%@ page import="java.util.*,java.io.*,java.sql.*,com.rsa.*,java.security.*" contentType="text/html;charset=utf-8" %>
<%
	request.setCharacterEncoding("utf-8");
	String msg ="";
	String connectString = "jdbc:postgresql://172.18.158.146:5432/project"
				+ "?autoReconnect=true&useUnicode=true"
				+ "&characterEncoding=UTF-8"; 

	String username = "";
	String password = "";
	String privateKeyStr=TestRSA.readRSA("G:/Java/Project_1/RSA_2.txt");
	PrivateKey privateKey = RSAUtil.string2PrivateKey(privateKeyStr);
	
	if(request.getMethod().equalsIgnoreCase("post")){
		username = request.getParameter("user");
		password = request.getParameter("pass");
		
		 
 		Class.forName("org.postgresql.Driver");
		Connection con = DriverManager.getConnection(connectString,"project","12345");
		Statement stmt = con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from manager where username = '"+username+"';");
		if(rs.next()){
			String realPass = rs.getString("password");
			String id = rs.getString("id");
			byte[] base642Byte = RSAUtil.base642Byte(realPass);
			byte[] privateDecrypt = RSAUtil.privateDecrypt(base642Byte, privateKey);
			String tpass=new String(privateDecrypt);
			//
			//msg = realPass;
			if(tpass.equals(password)){
 				session.setAttribute("username",username);
 				session.setAttribute("id",id);
				RequestDispatcher rd = request.getRequestDispatcher("function.jsp"); 
				rd.forward(request,response);  
				//跳转个人主页
			}else{
				msg = "密码错误！";
			}
		}else{
			msg = "无该用户!";
		}
		rs.close();
		stmt.close(); 
	}*/
%>
<!DOCTYPE html> 
<html  lang="zh-cn">
<head>  
  <meta charset="utf-8" >  
    <title>在线私密数据管理系统</title>  
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
	<script type="text/javascript">
		function submit1(){
  			var name = document.getElementById("u").value;
			var password = document.getElementById("p").value;
			var name1 = document.getElementById("inputname");
			var password1 = document.getElementById("inputpw");
			if(name==""){ 
				name1.innerHTML="请输入姓名!";
			}else{
				name1.innerHTML="";
			}
			if(password==""){
				password1.innerHTML="请输入密码!";
			}else{
				password1.innerHTML="";
			}  
			//alert("test word");
			setTimeout(setView,500);
			document.frm1.submit();
			
			//setTimeout(setView,1000);
		}
		
		function setView(){
/* 			var name = document.getElementById("u").value;
			var name1 = document.getElementById("inputname");
			if(name==""){ 
				name1.innerHTML="请输入姓名!";
			}else{
				name1.innerHTML="";
			}
			
			var password = document.getElementById("p").value;
			var password1 = document.getElementById("inputpw");
			if(password==""){
				password1.innerHTML="请输入密码!";
			}else{
				password1.innerHTML="";
			}  
			
			var view = document.getElementById("subview");
			view.innerHTML="<%=msg%>";
		}
	</script>	
</head>  
<body>  
    <div id="login">  
        <h1>私密数据管理系统</h1>  
         <form name="frm1" method="post" action="main.jsp"> 
			<span id="inputname" style="color:red;font-weight:bold"></span>	
			
            <input type="text"  placeholder="Username" required="required" id="u" name="user" value="<%=username%>"></input>  
             
			<span id = "inputpw" style="color:red;font-weight:bold"></span>
			
            <input type="password"  placeholder="Password" required="required" id="p" name="pass" value="<%=password%>"></input> 
             
            <span id = "subview" style="color:red;font-weight:bold"><%=msg %></span>
             
			<div id="subber"><input  class="but" type="submit"  value="Login"/></div>
	    <div id="cell">
	    <button class="but2" onclick="location.href='Register.jsp'" type="button">Register</button>
	    <button class="but3" onclick="location.href='findPwd.jsp'" type="button">Find Pwd</button> 
	    </div> 
        </form> 	
    </div>  
</body>  
</html>  