<%@ page import="java.util.*,java.io.*,java.sql.*" contentType="text/html;charset=utf-8" %>
<%

	request.setCharacterEncoding("utf-8");
	String connectString = "jdbc:postgresql://172.18.158.146:5432/project"
		+ "?autoReconnect=true&useUnicode=true"
		+ "&characterEncoding=UTF-8"; 

	String username = "test name";
	username = (String)session.getAttribute("username");
	String password = "";
	String sex = "";
	String phone = "";
	String mail = "";
	String msg1="";
	String msg2="";
	
	if(request.getMethod().equalsIgnoreCase("post")){
		
		password = request.getParameter("password");
		sex = request.getParameter("sex");
		phone = request.getParameter("phone_number");
		mail = request.getParameter("mail_box");
		
		Class.forName("org.postgresql.Driver");
		Connection con = DriverManager.getConnection(connectString,"project","12345");
		Statement stmt = con.createStatement();
		
		int cnt1=1,cnt2=1;
		if(password!=""){
			String fmt = "update manager set password='%s' where username='%s'";
			String sql = String.format(fmt,password,username);
			cnt1 = stmt.executeUpdate(sql);
		}
		
/* 		if(sex!=""){
			String fmt = "update users set sex='%s' where username='%s'";
			String sql = String.format(fmt,sex,username);
			int cnt = stmt.executeUpdate(sql);
		}
		
		if(phone!=""){
			String fmt = "update users set phone='%s' where username='%s'";
			String sql = String.format(fmt,phone,username);
			int cnt = stmt.executeUpdate(sql);
		} */
		
		if(mail!=""){
			String fmt = "update manager set email='%s' where username='%s'";
			String sql = String.format(fmt,mail,username);
			cnt2 = stmt.executeUpdate(sql);
		}
		
		if(cnt1>0&&cnt2>0){
			msg1="修改成功！";
		}else{
			msg2="修改失败！";
		}
	}
%>
<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <title>个人账户修改</title>  
    <link rel="stylesheet" type="text/css" href="css/Register.css"/>  
</head>  
<body>  
    <div id="header" z-index:10>
        <div id="logo">
            <img src="images/logo.jpg" width=100% height=100% z-index:1000 position=absolute alt="中山大学">
        </div>
     </div>
    <div id="titlePage">  
        <h1 font-color="white">欢迎注册在线私密数据管理系统！您可以在这里任意存储自己的私密数据。</h1>
    </div>
    <div id="register" z-index:0>  
        <h1>修改个人信息</h1>  
        <form method="post">  

	    <div class="section">
            <p>密码：<input type="password" id="password" placeholder="6~12位" name="password" value="<%=password%>"></input></p>
	      
	    </div>	    

	    <div class="section">
	    <p>性别：<input type="text" id="sex" placeholder="男/女/两者都不是" name="sex" value="<%=sex%>"></input></p>
	    	
	    </div>

	    <div class="section">
	    <p>电话号码：<input type="text" id="phone" placeholder="11位" name="phone_number" value="<%=phone%>"></input>  </p>
	    	
	    </div>

	    <div class="section">
	    <p>邮箱：<input type="text" id="mail" placeholder="找回密码用" name="mail_box" value="<%=mail%>"></input></p>
	    </div>
	    	<span id = "success" style="color:green;font-weight:bold"><%=msg1%></span>
	    	<span id = "fail" style="color:red;font-weight:bold"><%=msg2%></span>
            <button class="but" type="submit">提交</button>  
            <button class="but" onclick="location.href='main.jsp'" type="button">返回</button>   
        </form>  
    </div>  
    <div id="footer">
      <div class="bottomlogo">
         <img src="images/logo2.jpg" alt="logo2" align=bottom width="100%" height="100%">
      </div> 
    </div>
</body>  
</html>  