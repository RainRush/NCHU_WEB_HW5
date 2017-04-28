<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
  //Name & Gender
	String name = request.getParameter("Name");
  String gender = request.getParameter("Gender");

  //Height/Weight/BMI
	int height = Integer.parseInt(request.getParameter("Height"));
	double calHeight = Math.pow( (double)height/100 , 2);
	int weight = Integer.parseInt(request.getParameter("Weight"));
	DecimalFormat df = new DecimalFormat("##.00");
	double bmi = Double.parseDouble(df.format( (double)weight/calHeight ));

  //Age Calculation Related
  int birthYear = Integer.parseInt(request.getParameter("BirthYear"));
  int currentYear = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
  int age = currentYear - birthYear;

  //Experience Field/Skills/CV
  String[] expField = request.getParameterValues("ExpField");
  String[] skillList = {"PHP", "ASP", "JSP", "NodeJS", "React", "SQL", "GoogleAnalysis"};
  String coverLetter = request.getParameter("CoverLetter");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="ResumeGen.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>JSP Resume Generator</title>
</head>
<body>
  <div class="blog-header">
		<div class="topic">
			<a href="index.html"><h1>Resume Generator</h1></a>
		</div>
	</div>

  <div class="container">
    <div class="row">
      <div class="col-md-3"></div>
      <div class="col-md-6">
        <table class="table table-bordered" id="resTable">
          <tr>
            <th>Name</th>
            <td><%= name %></td>
            <th>Gender</th>
            <td><%= gender %></td>
            <th>Age</th>
            <td><%= age %></td>
          </tr>
          <tr>
            <th>Height</th>
            <td><%= height %></td>
            <th>Weight</th>
            <td><%= weight %></td>
            <th>BMI</th>
            <td><%= bmi %></td>
          </tr>
          <tr>
            <th colspan="6">
              <%
                //判斷hobby是單數還是複數
                if (expField.length == 1 || expField.length == 0) out.print("Experience Field:");
                else out.print("Experience Fields");
              %>
            </th>
          </tr>
          <tr>
            <td colspan="6">
              <%
                for (int i=0; i<expField.length; i++) {
                  out.print(" -  " + expField[i] + "<br>");
                }
              %>
            </td>
          </tr>
          <tr>
            <th colspan="6">Skills</th>
          </tr>
          <tr>
            <td colspan="6">
              <ul>
                <%
                  for (int j=0; j<skillList.length; j++) {
                    if (request.getParameter(skillList[j]) != null)
                      out.print("<li>" + skillList[j] + "</li>");
                  }
                %>
              </ul>
            </td>
          </tr>
          <tr>
            <th colspan="6">Covering Letter</th>
          </tr>
          <tr>
            <td colspan="6"><%= coverLetter %></td>
          </tr>
        </table>
      </div>
      <div class="col-md-3"></div>
    </div>
  </div>

</body>
</html>
