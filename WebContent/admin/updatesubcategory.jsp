<%@page import ="DAO.Subcategorydao" %>
<%@page import ="bean.Subcategorybean" %>
<%@page import ="DAO.Maincategorydao" %>
<%@page import ="bean.Maincategorybean" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Update Sub Category</title>
<link rel="Icon" type="image/jpg" href="resources/img/logo1.jpg">
<%
	Subcategorybean sb = Subcategorydao.getSubcategoryById(Integer.parseInt(request.getParameter("id")));	
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
            <h1 class="mt-4">Update Sub Category</h1>
            <div class="row">
            	  <div class="col-sm-12">
                     <div class="panel panel-bd lobidrag">
                     <h1></h1>
                        <div class="panel-body">
                           <form class="col-lg-12" method="post" action="<%=application.getContextPath()%>/Subcategorycontroller" data-parsley-validate="true">
                              <div class="form-group">
                               <label>Sub Category Id : <a style="font-weight: bold;"><%=sb.getSubcatid()%></a></label>
                              	<hr>
                                 <input type="text" hidden="" class="form-control"placeholder="Id" name="id" value="<%=sb.getSubcatid()%>">
                                 <label>Main Category Name</label>
                                 <select class="form-control" required="required" id="updatemaincategory" name="updatemaincategory">    								    
										<%
										Maincategorydao md= new Maincategorydao();
										List<Maincategorybean> list3 = md.getallMaincategory();
										for(Maincategorybean maincat: list3)
										{
										%>
									     	 <option value="<%=maincat.getMaincatid()%>" <% if(sb.getMaincatid() == maincat.getMaincatid()) out.println("selected"); %>>
									     	 <%=maincat.getMaincatname() %></option>	
										<%
										}
										%>
								</select><br>                                                        
                                 <label>Sub Category Name</label>
                                 <input type="text" class="form-control"placeholder="Sub Category" name="updatesubcategory" data-parsley-minlength="2" data-parsley-maxlength="30" value="<%=sb.getSubcatname()%>"><br>                                 
                              </div>
                              <div class="reset-button">
                              <input type="submit" class="btn btn-lg btn-info" name="action" value="Update">
                               </div>
                           </form>
                        </div>
                     </div>
                  </div>      
             </div><!-- row -->              
        </section>
      </section>
      <!--main content end-->
  </section>  
	 <jsp:include page="script.jsp"></jsp:include>  
     </body>
</html>