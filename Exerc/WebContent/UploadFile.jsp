<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import ="java.sql.PreparedStatement"%>


<%
   File file ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   ServletContext context = pageContext.getServletContext();
   String filePath = context.getInitParameter("file-upload");

   // Verify the content type
   String contentType = request.getContentType();
   
   if ((contentType.indexOf("multipart/form-data") >= 0)) {
      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("WEB-INF/"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      
      try { 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();

         out.println("<html>");
         out.println("<head>");
         out.println("<title>JSP File upload</title>");  
         out.println("</head>");
         out.println("<body>");
         
         while ( i.hasNext () ) {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () ) {
               // Get the uploaded file parameters
               String fieldName = fi.getFieldName();
               String fileName = fi.getName();
               boolean isInMemory = fi.isInMemory();
               long sizeInBytes = fi.getSize();
            
               // Write the file
               if( fileName.lastIndexOf("/") >= 0 ) {
                  file = new File( filePath + 
                  fileName.substring( fileName.lastIndexOf("/"))) ;
               } else {
                  file = new File( filePath + 
                  fileName.substring(fileName.lastIndexOf("/")+1)) ;
               }
               fi.write( file ) ;
               out.println("Uploaded Filename: " + filePath + 
               fileName + "<br>");
            }
         }
         out.println("</body>");
         out.println("</html>");
      } catch(Exception ex) {
         System.out.println(ex);
      }
   } else {
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet upload</title>");  
      out.println("</head>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>");
   }
   
   
   String id = request.getParameter("userId");
   String driverName = "com.mysql.jdbc.Driver";
   String connectionUrl = "jdbc:mysql://localhost:8889/";
   String dbName = "mysql_database";
   String userId = "root";
   String password = "root";
   PreparedStatement ps = null;

   try {
   	Class.forName(driverName);
   } catch (ClassNotFoundException e) {
   	e.printStackTrace();
   }

   Connection connection = null;
   Statement statement = null;
   ResultSet resultSet = null;
   try{	
   	connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
   	statement=connection.createStatement();
   	String sql ="INSERT INTO CommDB (text,taskid) VALUES ((concat(COALESCE(text, ''), 'Employee uploaded the task file to:("+filePath+")')),'"+session.getAttribute("uploadtaskid")+"') ;";
   	ps = connection.prepareStatement(sql);
   	ps.executeUpdate();
   } catch (Exception e) {
   	e.printStackTrace();
   }

   
   String redirectURL = "homepage.jsp";
   response.sendRedirect(redirectURL); 
  
   
%>