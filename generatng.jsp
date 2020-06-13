<%@ page import="java.util.*,java.io.*,java.sql.*" contentType="text/html;charset=utf-8" %>
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
	    <input type="checkbox" >英文字母集</input><br>
	    <input type="checkbox" >数字字母集</input><br>
	    <input type="checkbox" >英文标点集</input><br>    
            <p>生成密码的个数:<input type="text" required="required" placeholder="单次最大生成25个" name="u"></input></p>   
            <button class="but" type="submit">生成</button>  
	    <table border="1">
		<tr width=300px; height=150px>
		    <th>用户名</th>
		    <th>密码</th>
		</tr>
        </form>  
    </div>  

</body>  
</html>  