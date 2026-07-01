package com.sea.vms.controller;



import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;


import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;



import com.sea.vms.bean.Visitor;
import com.sea.vms.bean.VisitorReg;

import com.sea.vms.bean.Pass;
import com.sea.vms.bean.Security;
import com.sea.vms.bean.SecurityReg;
import com.sea.vms.service.PassService;










/**
 * Servlet implementation class PassServlet
 */

@WebServlet("/uploadImage")

 @MultipartConfig(maxFileSize = 16177215)//16MB
public class PassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//private SecurityService securityservice = new SecurityService();
	

   // static {
     //   System.loadLibrary(Core.NATIVE_LIBRARY_NAME);
    //}

    public PassServlet() {
    	super();
    }
   /* @Override
    public void init() throws ServletException {
        super.init();
        System.setProperty("java.awt.headless", "true");
    }*/

   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		PassService service= new PassService();
		String target=" ";
		String action= request.getParameter("action");
		
		if (action.equals("Login")) {
            String loginType = request.getParameter("loginType"); // This will differentiate between visitor and security login

            if (loginType.equals("security")) {
                // Security Login
                String secid = request.getParameter("userid");
                String pswd = request.getParameter("pswd");
                boolean fl = service.validateUser(secid, pswd);
                if (fl) {
                    HttpSession sn = request.getSession();
                    sn.setAttribute("secid", secid);
                    target = "Security.jsp";  // Redirect to security page
                } else {
                    target = "Unsuccessfull.jsp";
                }
            } 
            else if (loginType.equals("visitor")) 
            {
                // Visitor Login
                long adarid = Long.parseLong(request.getParameter("adharid"));
                String Pswd = request.getParameter("pswd");
                boolean vvFlag = service.validateVisitor(adarid,Pswd);
                if (vvFlag) {
                    HttpSession sn = request.getSession();
                    sn.setAttribute("adharid", adarid);
                    target = "VisitorIndex.jsp";  // Redirect to visitor dashboard
                } else {
                    target = "Unsuccessfull.jsp";
                }
            }

            RequestDispatcher rd = request.getRequestDispatcher(target);
            rd.forward(request, response);
        } else if (action.equals("Signout")) {
            HttpSession sn = request.getSession(false); // false: don't create the structure
            sn.invalidate();
            response.sendRedirect("index.html");
        } else {
            // Handle other actions (Apply, Add Security, View Pass, etc.)
            handleOtherActions(request, response, action, service);
        }
    }

    private void handleOtherActions(HttpServletRequest request, HttpServletResponse response, String action, PassService service) throws ServletException, IOException {
        String target = "";
	
		
	try {
	
		switch(action)
		{
		case "VisitorReg":
			long arid= Long.parseLong(request.getParameter("adharid"));
			String name= request.getParameter("name");
			String addr= request.getParameter("address");
			long phone= Long.parseLong(request.getParameter("phone"));
			String email= request.getParameter("emailid");
			String vpwd= request.getParameter("pwd");
			String cpwd=request.getParameter("cpwd");
			
			VisitorReg vr=new VisitorReg(arid,name,addr,phone,email,vpwd,cpwd);
			//System.out.println("controller "+r);
			boolean flag=service.visitorRegDetails(vr);
			target="VisitorLog.jsp";
			break;
		case "VisitorLog":
		

			 long adarid = Long.parseLong(request.getParameter("adharid"));
            String Pswd = request.getParameter("pwd");
            VisitorReg vl=service.getRegDetailsByAdharid(adarid);
            boolean vvFlag = service.validateVisitor(adarid,Pswd);
            if (vvFlag) {
                HttpSession sn = request.getSession();
                sn.setAttribute("adharid", adarid);
                sn.setAttribute("vname", vl.getName());
                target = "VisitorIndex.jsp";  // Redirect to visitor dashboard
            } else {
                target = "LogInvalid.jsp";
            }
			
       case "AdminLog":
			
			if ("AdminLog".equals(action)) {
                // Admin Login
                String uname = request.getParameter("username");
                String pd = request.getParameter("pwd");
                int urc = service.getUserRegCount();
   			 int vc = service.getVisitCount();
                int sc = service.getSecurityCount();
   			 int ac = service.getPassApplicationCount();
   			HttpSession sn = request.getSession();
   			sn.setAttribute("UserRegCount", urc);
  			 sn.setAttribute("VisitCount", vc);
  			 sn.setAttribute("applicationCount", ac);
  			sn.setAttribute("securityCount", sc);
                boolean avFlag = service.validateAdmin(uname, pd);
                System.out.println(avFlag);
                if (avFlag) {
                    HttpSession sn1 = request.getSession();
                    
                    sn1.setAttribute("username", uname);
                    sn1.setAttribute("pwd", pd);
                    target = "Adminindex.jsp";  // Redirect to 
                } else {
                    target = "AdminLogin.jsp";
                }
			}
                break;
			
			
			
		case "Security Login":
			
			if ("Security Login".equals(action)) {
                // Security Login
                String secid = request.getParameter("userid");
                String pswd = request.getParameter("pswd");
                boolean fl = service.validateUser(secid, pswd);
                if (fl) {
                    HttpSession sn = request.getSession();
                    sn.setAttribute("secid", secid);
                    target = "Security.jsp";  // Redirect to security page
                } else {
                    target = "Unsuccessfull.jsp";
                }
			}
                break;
		case "Apply":
	        
			
			long adharid= Long.parseLong(request.getParameter("adharid"));
			String vname= request.getParameter("vname");
			String cname= request.getParameter("cname");
			String doc= request.getParameter("doc");
			String fromdate=request.getParameter("fromdate");
			String todate=request.getParameter("todate");
			
			
			String reason= request.getParameter("reason");
			SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat st=new SimpleDateFormat("yyyy-MM-dd");
	
			try {
			Date fdate=sf.parse(fromdate);
			Date tdate=st.parse(todate);
			 long passid = service.generatePassId();
			
			Visitor i=new Visitor(passid,adharid,vname,cname,doc,fdate,tdate,reason);
			boolean apflag=service.applyPssDetails(i);
			target="ApplySuccess.jsp";

			   }
			catch(Exception e)
			{
				e.printStackTrace();
			}
			break;
			
          case "Add Security":
	        
			
			String uid= request.getParameter("userid");
			String uname= request.getParameter("username");
			long phn= Long.parseLong(request.getParameter("phone"));
			String adr= request.getParameter("address");
			String pswd=request.getParameter("pswd");
			
			SecurityReg as=new SecurityReg(uid,uname,phn,adr,pswd);
			boolean asflag=service.addSecurityDetails(as);
			target="SecuritySuccessfully.jsp";

			break;
			
			//---------------------------------------------------------------------------------
			
		case "check detail":
			if ("check detail".equals(action)) {
  		    long aid= Long.parseLong(request.getParameter("adharid"));
  		    Visitor vd=service.getVisitorDetailsByAadhaarno(aid);
  		   if(vd != null) {
			request.setAttribute("View", vd);
			HttpSession sn = request.getSession();
            sn.setAttribute("adharid", aid);
			target="ViewVisitorDetails.jsp";
  		   }
  		 else {
  			request.setAttribute("errorMessage", "Aadhar ID not Found.");
  			target=("AadhaarNotFoundmsg.jsp");
		       
		    }
			}
			break;
		case "View Pass":
			if ("View Pass".equals(action)) {
  		    long pid= Long.parseLong(request.getParameter("passid"));
  		    Pass p=service.getFullDetailBypassid(pid);
  		    
  		  if (p != null) {
              
  		     request.setAttribute("vp", p);
  		  
             target = "ViewPass.jsp";
			}
             else 
             {
 		        request.setAttribute("errorMessage", "Aadhar ID not Found.");
 		        target = "SecUnsucccessfull.jsp"; // Update to your actual error handling page
 		    } 
			}  
			
			break;
		case "ViewMyappli":
			long adaid= Long.parseLong(request.getParameter("adharid"));
  		   
			  List<Visitor> maList=service.getApplicationsByAdharid(adaid);
			  
			  if (maList != null) {
			        request.setAttribute("maList", maList);
			    
			    }
			    target = "MyApplication.jsp";
			    //System.out.println(maList);
			    break;
		case"mypass":
			if ("mypass".equals(action)) {
	  		    long pid= Long.parseLong(request.getParameter("passid"));
	  		  Visitor pd=service.getMyPassByPassid(pid);
	  		    
	  		  if (pd != null) {
	              
	  		     request.setAttribute("pd", pd);
	  		  }
	             target = "VisitorPrintPass.jsp";
	             
				}
		break;
		case "Print Pass":
			if ("Print Pass".equals(action)) {
  		    long pdid= Long.parseLong(request.getParameter("passid"));
  		    Pass pa=service.getFullDetailBypassid(pdid);
  		    
  		  if (pa != null) {
              
  		     request.setAttribute("PP", pa);
  		  }
             target = "PrintPass.jsp";
             
			}
			break;	
			
		case "Print Details":
			if ("Print Details".equals(action)) {
  		    long add= Long.parseLong(request.getParameter("adharid"));
  		    Visitor pd=service.getVisitorDetailsByAadhaarno(add);
  		    
  		  if (pd != null) {
              
  		     request.setAttribute("pd", pd);
  		  }
             target = "VisitorPrintPass.jsp";
             
			}
			break;	
			
		
		case "Visitor Register":
			
			 String sortOpt = request.getParameter("sortOption");
			  ArrayList<VisitorReg> vrList=service.getAllUserReg();
			  
			  
			  int UserRegCount = service.getUserRegCount();
			  
	   		  
			  if (vrList != null) {
				  request.setAttribute("UserRegCount", UserRegCount);
				  request.setAttribute("vrList", vrList);
			
				  
		  		  }
			 
			  target="ManageAllUserReg.jsp";
			  break;
		case "Visited Details":
			  ArrayList<Pass> pList=service.getAllVisitDetails();
			  int visitCounts = service.getVisitCount();
			  if (pList != null) {
	              
				  request.setAttribute("pList", pList);
				  request.setAttribute("visitCount", visitCounts);
		  		  }
			  target="ManageVisitDetails.jsp";
			  //System.out.println(pList);
					
					break;
		case "Visitor Applications":
			 String sortOption = request.getParameter("sortOption");
			  ArrayList<Visitor> vList=service.getAllPassApplication();
			  int applicationCounts = service.getPassApplicationCount();
			  
			  if (vList != null) {
	              
				  request.setAttribute("vList", vList);
				  request.setAttribute("applicationCount", applicationCounts);
				  
		  		  }
			  target="ManageAllPassDetails.jsp";
			  //System.out.println(vList);
					
					break;
				
		case "Filter by Specific Date":
		    String specificDateStr = request.getParameter("specificDate");

		    if (specificDateStr != null) {
		        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		        Date specificDate = sdf.parse(specificDateStr);

		        // Fetch all visitor applications
		        ArrayList<Visitor> allVisitors = service.getAllPassApplication();

		        // Filter based on the specific date
		        List<Visitor> filteredVisitors = allVisitors.stream()
		            .filter(visitor -> visitor.getFdate().equals(specificDate)) // Match specific date
		            .collect(Collectors.toList());

		        int applicationCount = filteredVisitors.size();

		        request.setAttribute("vList", filteredVisitors);
		        request.setAttribute("applicationCount", applicationCount);
		        target = "ManageAllPassDetails.jsp";
		    } else {
		        request.setAttribute("errorMessage", "Please provide a date.");
		        target = "ErrorPage.jsp"; // Update to your actual error handling page
		    }
		    break;
		case "Filter by Specific Date Pass":
		    String specificDateStr1 = request.getParameter("specificDate");

		    if (specificDateStr1 != null) {
		        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		        Date specificDate = sdf.parse(specificDateStr1);

		        // Fetch all pass data that may contain both tables' data
		        ArrayList<Pass> allPasses = service.getAllVisitDetails(); // Assuming this method gets combined data

		        // Filter based on specific date
		        List<Pass> filteredPasses = allPasses.stream()
		            .filter(pass -> pass.getFdate().equals(specificDate)) // Assuming fdate is the field to filter on
		            .collect(Collectors.toList());
		        
		        int visitCount = filteredPasses.size();
		        
		        request.setAttribute("visitCount", visitCount);
		        request.setAttribute("pList", filteredPasses);
		    } else {
		        request.setAttribute("errorMessage", "Please provide a date.");
		    }
		    target = "ManageVisitDetails.jsp"; // Update to your actual JSP page
		    break;
		    
		    
		    
		case "Security Details":
			  ArrayList<SecurityReg> sList=service.getAllSecurityDetails();
			  if (sList != null) {
	              
				  request.setAttribute("sList", sList);
		  		  }
			  target="ManageAllSecurityDetails.jsp";
			  System.out.println(sList);
					
					break;
					
		case "Delete User":
			long dad= Long.parseLong(request.getParameter("adharid"));
   			boolean deflag=service.deleteUserByID(dad);
   			target="DeleteMessage.jsp";
   			break;
		case "Search User":
			long uaid= Long.parseLong(request.getParameter("adharid"));
			VisitorReg svr=service.getUserDetailsByaid(uaid);
			System.out.println(svr);
			request.setAttribute("Viewu", svr);
			
			target="SearchUserDetails.jsp";
			break;
			
		case "Search Visitor":
			long spid= Long.parseLong(request.getParameter("passid"));
			Visitor svd=service.getVisitorDetailsBypassno(spid);
			System.out.println(svd);
			request.setAttribute("View", svd);
			
			target="SearchVisitorDetails.jsp";
			break;
			
		case "Delete Security":
			String duid= request.getParameter("userid");
   			boolean duflag=service.deleteSecurityByID(duid);
   			target="SecurityDeleteMessage.jsp";
   			break;
			
		case "Search Security":
			String suid= request.getParameter("userid");
			SecurityReg su=service.getRegDetailsByName(suid);
			request.setAttribute("Viewsec", su);
			target="SearchSecurityDetails.jsp";
			break;	
		case "Update Security":
			String usid= request.getParameter("userid");
			String usname= request.getParameter("username");
			long uphn= Long.parseLong(request.getParameter("phone"));
			String uaddr= request.getParameter("address");
			String pwd= request.getParameter("pswd");
			
			SecurityReg usr=new SecurityReg(usid,usname,uphn,uaddr,pwd);
			boolean usflag=service.modifySecurityDetails(usr);
			target="Updatemsg.jsp";
			break;	
		
	}
	
	} catch (Exception e) {
		
        e.printStackTrace();
        
        request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
    }
	
	
		
		 RequestDispatcher p = request.getRequestDispatcher(target);
		   p.forward(request,response);
		}
		
		
	

	 

		



	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		 
		PrintWriter out = response.getWriter();
		 PassService service= new PassService();
			String action= request.getParameter("action");
		 
		
				
				switch(action)
				{
	case "Close Pass":
					
			handleUpdate(request,response);
			break;
	case "scanDocu":
        handleScan(request, response);
        
        break;
	case "uploadImage":
        handleCapture(request, response);
        
        break;
	case "authenticate":
        handleAuthentication(request,  response);
        break;
         
	case "Upload details":
		
		long passid= Long.parseLong(request.getParameter("passid"));
		Part img= request.getPart("image");
		Part docu= request.getPart("document");
		
		InputStream imgStream= null;
		InputStream docStream= null;
	
		if(img != null) {
			imgStream= img.getInputStream();
		}
		if(docu != null) {
			docStream= docu.getInputStream();
		}
		String status= request.getParameter("status");
		
		  
		Security s=new Security(passid,imgStream,docStream,status);
		boolean sflag=service.addVisitorDetails(s);
		//System.out.println(s);
		  
		 response.sendRedirect("UpdateSuccess.jsp"); 
		 break;
				}
	 }
	
	


		

	private void handleAuthentication(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 String adharid = request.getParameter("adharid");
	        String fingerprintData = request.getParameter("fingerprintData");

	        // Simulated authentication logic
	        boolean isAuthenticated = authenticateUser(adharid, fingerprintData);

	        if (isAuthenticated) {
	        	
	        	response.sendRedirect("Processing.jsp");
	            // Redirect or further processing
	        } else {
	            response.getWriter().println("Authentication failed. Please try again.");
	        }
		
	}
	private boolean authenticateUser(String adharid, String fingerprintData) {
		
		return false;
	}
	
	private void handleScan(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String docData = request.getParameter("docData");

        // Remove the metadata from the base64 string
        String base64Image = docData.split(",")[1];
        byte[] imageBytes = Base64.getDecoder().decode(base64Image);

        // Save the image to a file
        String filePath = "C:/Users/sreen/eclipse-workspace/VMS/WebContent/Doc/doc.png"; // Update with your desired path
        Files.write(Paths.get(filePath), imageBytes);

        response.getWriter().write("Document uploaded successfully");
		
	}
	private void handleCapture(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String imageData = request.getParameter("imageData");

        // Remove the metadata from the base64 string
        String base64Image = imageData.split(",")[1];
        byte[] imageBytes = Base64.getDecoder().decode(base64Image);

        // Save the image to a file
        String filePath = "C:/Users/sreen/eclipse-workspace/VMS/WebContent/images/image.png"; // Update with your desired path
        Files.write(Paths.get(filePath), imageBytes);

        response.getWriter().write("Photo Uploaded successfully");
    }
	
    	

	private void handleUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		PassService service = new PassService();
	    long passid = Long.parseLong(request.getParameter("passid"));
	    
	    String status = request.getParameter("status");
	    
	    // Retrieve image and document parts
	    Part imagePart = request.getPart("image");
	    Part documentPart = request.getPart("document");
	    
	    InputStream imageStream = (imagePart != null && imagePart.getSize() > 0) ? imagePart.getInputStream() : null;
	    InputStream documentStream = (documentPart != null && documentPart.getSize() > 0) ? documentPart.getInputStream() : null;

	    // Create a Security object with current status and optional streams
	    Security security = new Security(passid, imageStream, documentStream, status);

	    boolean isUpdated = service.modifyPassDetails(security);
	    
	    if (isUpdated) {
	        response.sendRedirect("ClosedSuccess.jsp");
	    } else {
	        response.sendRedirect("Unsuccessfully.jsp");
	    }
	}
		
	}

