<%@ page import="java.util.*,java.io.*,java.sql.*,javax.mail.*,javax.mail.internet.*,javax.mail.Message.RecipientType" contentType="text/html;charset=utf-8" %>
<%!
public class PopAuthenticator extends Authenticator {
    String userName = null;
       String password = null;
       public PopAuthenticator() {
       }
       public PopAuthenticator(String username, String password) {
           this.userName = username;
           this.password = password;
       }
       protected PasswordAuthentication getPasswordAuthentication() {
           return new PasswordAuthentication(userName, password);
       }
}
%>
<%
	String connectString = "jdbc:postgresql://172.18.159.190:5432/project"
		+ "?autoReconnect=true&useUnicode=true"
		+ "&characterEncoding=UTF-8"; 
	//String msg ="初始状态";
	final String username = "1795055953@qq.com";
	final String mailpass = "ifrzhnwubpszfcja";
	
	
	//测试邮箱功能
	
	 Properties props = new Properties();  
	 props.setProperty("mail.transport.protocol", "smtp");
     props.setProperty("mail.smtp.host", "smtp.qq.com");
     props.setProperty("mail.smtp.auth", "true");  
     props.put("mail.smtp.port","25");
     props.setProperty("mail.debug", "true");
     Authenticator authenticator = new PopAuthenticator(username,mailpass);
     /* Authenticator authenticator = new Authenticator() {  
         protected PasswordAuthentication getPasswordAuthentication() {  
             String userName = props.getProperty(username);  
             String password = props.getProperty(mailpass);  
             return new PasswordAuthentication(userName, password);  
         }  
     };  */ 
     Session se = Session.getInstance(props,authenticator);  
     se.setDebug(true);  
	
     Message msg = new MimeMessage(se);  
     msg.setText("邮件测试");  
     msg.setFrom(new InternetAddress("1795055953@qq.com"));  
     msg.setRecipient(RecipientType.TO,new InternetAddress("903963315@qq.com"));
     
     Transport transport = se.getTransport();
     transport.send(msg);
	//------------------------------------------------
/* 	if(request.getMethod().equalsIgnoreCase("post")){
		username = request.getParameter("u");
		mail = request.getParameter("p");
		
 		Class.forName("org.postgresql.Driver");
		Connection con = DriverManager.getConnection(connectString,"project","rjgc2018");
		Statement stmt = con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from users where username = '"+username+"';");
		if(rs.next()){
			
		}else{
			
		}
	} */
%>
<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <title>个人账户找回</title>  
    <link rel="stylesheet" type="text/css" href="css/Register.css"/>  
</head>  
<body>  


    <div id="titlePage">  
        <h1 font-color="white">欢迎注册在线私密数据管理系统！您可以在这里任意存储自己的私密数据。</h1>
    </div>
    <div id="register" z-index:0>  
        <h1>找回账户和密码</h1>  
        <form method="post">  
            <div class="section">
	    <p>请输入你的用户名: <input type="text" required="required" placeholder="用户名" name="u"></input></p>
	      <p>请输入你注册时的邮箱：<input type="password" required="required" placeholder="邮箱" name="p"></input></p>

            <button class="but" type="submit">发送邮件</button>  
        </form>  
    </div>  


</body>  
</html>  