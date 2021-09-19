<%@page import="bean.CustomCatbean" %>
<%@page import="java.util.List" %>
<%@page import="DAO.CustCatdao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Adminbean" %>
<%@page import="DAO.Admindao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Manage Customize Category</title>
<link rel="Icon" type="image/jpg" href="resources/img/logo1.jpg">
<%
	Adminbean ub = Admindao.getAdminById((Integer) session.getAttribute("aid"));
%>
 <jsp:include page="head.jsp"></jsp:include>
</head>
<body onload="PreLoader()">
 <div id="loading"></div>  
  <section id="container" >     
      <!--header start-->
     <jsp:include page="header.jsp"></jsp:include>
      <!--header end-->     
      <!--sidebar start-->       
       <jsp:include page="sidebar.jsp"></jsp:include>       
       <!--sidebar end-->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
            <h1 class="table_heading mt-4">Custome Category Information</h1>
                <div class="row">        
         	  <!-- Form controls -->
	                  <div class="col-sm-12">
    	                 <div class="panel panel-bd lobidrag">
        	                <div class="panel-bodyclass" id="example_wrapper">
            	              <table  id="example1" border="1"class="table table-responsive-xs table-hover">
            	               <thead class="thead_cls">
                	          	<tr>
                    	      		<th> Customize Category Id </th>
                        	  		<th> Category Name </th>
                        	  		<th> Update</th>
                        	  		<th> Delete</th>
	                          	</tr> 
	                          	</thead>
    	                      	<%
        	                  		CustCatdao cd= new CustCatdao();
            	              		List<CustomCatbean> list = cd.getallCustomecategory();
                	          		for(CustomCatbean custcategory: list)
                    	      		{
                        	  	%>
                          			<tr>
                          				<td><% out.println(custcategory.getCustmaincatid());%></td>
                          				<td><% out.println(custcategory.getCustcatname());%></td>
                          				<td>
                              			<form method="post" action="<%=application.getContextPath()%>/CustCatController">
                              			<input class="text-center" type="hidden" name="id" value="<%=custcategory.getCustmaincatid()%>">
                                 		<input type="submit" class="btn btn-lg btn-primary" name="action" value="Edit">
                                 		</form>
                                 		</td>
                          				
                          				<td>
                              			<form method="post" action="<%=application.getContextPath()%>/CustCatController">
                          				<input type="hidden" name="id" value="<%=custcategory.getCustmaincatid()%>">
                                 		<input type="submit" class="btn btn-lg btn-primary" name="action" value="Delete">
                                 		</form>
                                 		</td>	  
	                          		</tr>
    	                      	<%
        	                  		}
            	          		%>
                	          </table>
                    	    </div>
	                     </div>
    	              </div>                          
             </div><!-- row -->
        </section>
      </section>
  </section>  
	 <jsp:include page="script.jsp"></jsp:include>  
     </body>
</html>