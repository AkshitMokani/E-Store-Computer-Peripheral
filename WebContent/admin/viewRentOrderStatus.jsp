<%@page import="DAO.OrderStatusdao" %>
<%@page import="DAO.ORPdao" %>
<%@page import="DAO.ORPStatusdao" %>
<%@page import="bean.OrderProductbean" %>
<%@page import="bean.OrderStatusBean" %>
<%@page import="bean.ORPbean" %>
<%@page import="bean.ORPStatusBean" %>
<%@page import="DAO.OrderProductdao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Adminbean" %>
<%@page import="DAO.Admindao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Rent Order Status</title>
<link rel="Icon" type="image/jpg" href="resources/img/logo1.jpg">
<%
	Adminbean ub = Admindao.getAdminById((Integer) session.getAttribute("aid"));
%>
<link href="../user/resources/css/myOrder.css" rel="stylesheet">
 <jsp:include page="head.jsp"></jsp:include>
 </head>
 <style type="text/css">
 	td.col_a
 	{
 		max-width:200px;
 		overflow: hidden;
 		text-overflow: ellipsis;
 		white-space: nowrap;
 	}
 </style>
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
            <h1 class="table_heading mt-4">Rent Order Status Information</h1>
          <div class="row">      
            <!-- <div class="tab">
	  			<button class="tablinks" onclick="openCity(event, 'orders')" id="defaultOpen">Orders</button>	  
	  			<button class="tablinks" onclick="openCity(event, 'cancel-orders')">Cancelled Orders</button>
			</div>   -->
	<!-- <div id="orders" class="tabcontent"> -->
         	  <!-- Form controls -->
	                  <div class="col-lg-12">
    	                 <div class="panel panel-bd lobidrag">
        	                <div class="panel-bodyclass" id="example_wrapper">
            	              <table  id="example1" border="1"class="table table-responsive-lg table-hover">
            	               <thead class="thead_cls">
                	          	<tr>
                	          		<th> Rent Status Id</th>
                	          		<th> Op Id</th>
                	          		<th> User Id</th>                	          		
                    	      		<th> Product Id </th>
									<th> Status </th>                        	  		                        	  		
                        	  		<th> Update Status</th> 
	                          	</tr> 
	                          	</thead>	
	                          	 <%
    	                   		   	ORPStatusdao orsd= new ORPStatusdao();
            	              		List<ORPStatusBean> list = ORPStatusdao.getAllRentOrderStatus();
                	          		for(ORPStatusBean ordersts: list)
                    	      		{
                        	  	%>
                          			<tr>
                          				<td><% out.println(ordersts.getStatus_id());%></td>
                          				<td><% out.println(ordersts.getOrp_id());%></td>                          			
                          				<td><% out.println(ordersts.getUser_id());%></td>                          				                    				
                          				<td><%out.println(ordersts.getRentprodid()); %></td>
                          				<td><% out.println(ordersts.getStatus());%></td>                          				
                          				<td>
                              			<form method="post" action="<%=application.getContextPath()%>/ORPController">
	                              			<input type="hidden" name="id" value = "<%=ordersts.getStatus_id() %>">
	                          				<select class="form-control" id="status" name="status" required="required"  data-parsley-error-message="Login type is required">       
						                   	  	<option value="Ordered">Ordered</option> 
						                       	<option value="Shipped">Shipped</option>
						                       	<option value="Delivered">Delivered</option>
						           	        </select>
	                                 		<input type="submit" class="btn btn-lg btn-primary" name="action" value="Update">
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