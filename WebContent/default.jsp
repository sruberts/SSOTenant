<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>GM Owner Center</title>
</head>
<body>

<% 

boolean cookieStatus = false;
//out.println(request.getParameter("AccessToken"));

//out.println(request.getAttribute("AccessToken"));


String uname = request.getParameter("state");

uname=(uname!=null)?uname:"";


if( request.getParameter("AccessToken") != null || request.getAttribute("AccessToken") != null)
		{

Cookie ckadd=new Cookie("ACUSTAToken",uname);
	response.addCookie(ckadd);
	cookieStatus = true;
		}

Cookie ck[]=request.getCookies();  
if( ck != null)
for(int i=0;i<ck.length;i++){   
 if(ck[i].getName().equalsIgnoreCase("ACUSTAToken"))
 {
	// out.println("<br>"+"<br><b> \t\t\t              "+ck[i].getValue()+" </b> <br>");  //printing name and value of cookie
	 uname = ck[i].getValue();
	 cookieStatus = true;
 }
}  

		

%>

<% 
if(cookieStatus)
{
	 out.println("<br>"+"<br><b> \t\t\t              "+uname+" </b> <br>"); 
	out.println();
out.println("<br> <br> <b> \t Welcome to GM Owner Center. .... </b> <br> ");

}else
{
	request.setAttribute("Msgg", "Credentials Error, Please use correct credentials...");
	//out.println("<br> <br> <b> \t JF Factory Application Login NOTTT Successful .... </b> <br> ");
	response.sendRedirect("https://gssomanager.eu-gb.mybluemix.net/default.jsp?compID=GMOC");
}


%>

<form action="${pageContext.request.contextPath}/LoginServlet" method="post">

<br><br><br>
 <table align="left">
  <tr>
    <td align="left"><input type="submit" name="logoff" value="logoff" /></td>
    <td></td>
  </tr>
</table> 
</form>

</body>
</html>