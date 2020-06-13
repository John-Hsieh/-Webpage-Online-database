<%@ page import="java.util.*,java.io.*,java.sql.*,java.security.*,com.rsa.*" contentType="text/html;charset=utf-8" %>
<%
	request.setCharacterEncoding("utf-8");
	String msg ="初始状态";
	
	String connectString = "jdbc:postgresql://172.18.158.146:5432/project"
					+ "?autoReconnect=true&useUnicode=true"
					+ "&characterEncoding=UTF-8"; 

	String username = "";
	String password = "";
	String sex = "";
	String phone = "";
	String mail = "";
	//String time = "";
	
	
	String publicKeyStr=TestRSA.readRSA("G:/Java/Project_1/RSA_1.txt");
	
	boolean isEmpty = false;
/* 	out.println(username);
	out.println(password);
	out.println(sex);
	out.println(phone);
	out.println(mail);
	out.println(time); */


	if(request.getMethod().equalsIgnoreCase("post")){
		username = request.getParameter("user_name");
		password = request.getParameter("password");
		sex = request.getParameter("sex");
		phone = request.getParameter("phone_number");
		mail = request.getParameter("mail_box");
		
		//time = new java.sql.Timestamp(System.currentTimeMillis()).toString().substring(0,10);
		
		if(username==""||password==""||sex==""||phone==""||mail==""){
			isEmpty = true;
			msg="请完善输入信息！";
		}else{
		
//			Class.forName("com.mysql.jdbc.Driver");
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(connectString,"project","12345");
			Statement stmt = con.createStatement();
			ResultSet rs=stmt.executeQuery("select * from manager where username = '"+username+"';");
			if(rs.next()){
				msg="该用户名已存在！";
			}else{
				
				PublicKey publicKey = RSAUtil.string2PublicKey(publicKeyStr);
				byte[] publicEncrypt = RSAUtil.publicEncrypt(password.getBytes(), publicKey);
				String byte2Base64 = RSAUtil.byte2Base64(publicEncrypt);
				
 				try{
					String fmt="insert into manager(username,email,password) values('%s','%s','%s')";
					String sql = String.format(fmt,username,mail,byte2Base64);
					int cnt = stmt.executeUpdate(sql);
					if(cnt>0)msg = "注册成功！";
					stmt.close(); con.close();
				}catch (Exception e){
					msg = "注册失败:"+e.getMessage();
				} 
			}
		}
	}
%>
<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <title>个人账户注册</title>  
    <link rel="stylesheet" type="text/css" href="css/Register.css"/>  
	<script type="text/javascript">
		function submit1(){
			setTimeout(setPrint,500);
			document.frm1.submit();
		}
		
		function setPrint(){
			var print = document.getElementById("print");
			print.innerHTML="<%=msg%>";
		}
	</script>
</head>  
<body>  
    <div id="titlePage">  
        <h1 font-color="white">欢迎注册在线私密数据管理系统！您可以在这里任意存储自己的私密数据。</h1>
    </div>
    <div id="register">  
        <h1>Login</h1>  
        <form name="frm1" method="post" action="Register.jsp">  
            <div class="section">
	    <p position:absolute>用户名：<input type="text" id="user" placeholder="6~12位" name="user_name" position:relative value="<%=username%>"></input> </p>
	     
	    </div>

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
	    	<span id = "print" style="color:red;font-weight:bold"></span> 
	    	<input class="but" type="button"  name="sub" onclick="submit1()" value="提交">
            <button class="but" onclick="location.href='main.jsp'" type="button">返回</button>     
        </form>  	
        <%=msg%><br>
    </div>  

</body>  
</html>  