<%@ page import="java.util.*,java.io.*,java.sql.*" contentType="text/html;charset=utf-8" %>
<%
	request.setCharacterEncoding("utf-8");
	String msg ="";
	String connectString = "jdbc:postgresql://172.18.158.146:5432/project"
			+ "?autoReconnect=true&useUnicode=true"
			+ "&characterEncoding=UTF-8"; 

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
            <input class="boxes" type="checkbox" required="required" placeholder="按日期" name="date">按日期</input> 
	    <p>开始日期：<input type="text" required="required" placeholder="yy-mm-dd" name="sDate"></input></p>
	    <p>结束日期：<input type="text" required="required" placeholder="yy-mm-dd" name="eDate"></input> </p>
	    <input class="boxes" type="checkbox" required="required" placeholder="按Tag" name="tag">按Tag</input> 
	    <p>请输入多个tag，用空格分割：<input type="text" required="required" placeholder="如电话 姓名" name="inputTag"></input></p>
	    <input class="boxes" type="checkbox" required="required" placeholder="按注释" name="u">按注释</input> 
	    <p>请输入多个注释，用空格分割：<input type="text" required="required" placeholder="如电话 姓名" name="u"></input></p>
	    <input class="boxes" type="checkbox" required="required" placeholder="全部输出" name="u">全部输出</input> 
            <button class="but" type="submit">查询</button>  
        </form>  
    </div>  
    <div id="footer">
      <div class="bottomlogo">
         <img src="images/logo2.jpg" alt="logo2" align=bottom width="100%" height="100%">
      </div> 
    </div>
</body>  
</html>  