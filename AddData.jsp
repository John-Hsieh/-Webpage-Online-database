<%@ page import="java.util.*,java.io.*,java.sql.*,java.util.Date,java.text.SimpleDateFormat" contentType="text/html;charset=utf-8" %>
<%
	request.setCharacterEncoding("utf-8");
	String connectString = "jdbc:postgresql://172.18.158.146:5432/project"
		+ "?autoReconnect=true&useUnicode=true"
		+ "&characterEncoding=UTF-8"; 

	String title = "";
	String artical = "";
	String info = "";
	String date = "";
	String msg1="";
	String msg2="";
	String username = (String)session.getAttribute("username");
	String tid = (String)session.getAttribute("id");
	int id = Integer.parseInt(tid);
	

	
	if(request.getMethod().equalsIgnoreCase("post")){
		title = request.getParameter("title");
		artical = request.getParameter("artical");
		info = request.getParameter("info");
		Date d = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		date = df.format(d);
		
		Class.forName("org.postgresql.Driver");
		Connection con = DriverManager.getConnection(connectString,"project","12345");
		Statement stmt = con.createStatement();
		String fmt="insert into secrettext(userid,title,artical,info) values(%d,'%s','%s','%s')";
		String fmt1 = "\\! /cryper/encrypt dfsfdsd";
		//String sql = String.format(fmt,id,title,artical,info);
		//String sql = String.format(fmt1,title);
		int cnt = stmt.executeUpdate(fmt1);
		if(cnt>0){
			msg1="添加成功";
		}else{
			msg2="添加失败";
		}
	}
	
%>
<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <title>个人账户注册</title>  
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
    	<form name="frm1" method="post">
	    <p>数据内容：<input type="text" required="required" placeholder="任意内容" name="artical"></input></p>
	    <p>数据标签：<input type="text" required="required" placeholder="简单的分类" name="title"></input> </p>
	    <p>数据注释：<input type="text" required="required" placeholder="如电话 姓名" name="info"></input></p>
	    <span id="succeed" style="color:green;font-weight:bold"><%=msg1 %></span> 
	    <span id="fail" style="color:red;font-weight:bold"><%=msg2 %></span> 
            <button class="but" type="submit">添加</button>  
            
        </form>  
    </div>  
    <div id="footer">
      <div class="bottomlogo">
         <img src="images/logo2.jpg" alt="logo2" align=bottom width="100%" height="100%">
      </div> 
    </div>
</body>  
</html>  