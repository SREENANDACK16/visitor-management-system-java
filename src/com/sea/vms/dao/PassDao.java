package com.sea.vms.dao;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.sea.vms.bean.Visitor;
import com.sea.vms.bean.VisitorReg;
import com.sea.vms.bean.MyApplication;
import com.sea.vms.bean.Pass;
import com.sea.vms.bean.Security;
import com.sea.vms.bean.SecurityReg;
import com.sea.vms.util.Base64Util;
import com.sea.vms.util.DBUtil;










public class PassDao
{
	
	
	public boolean visitorRegDetails(VisitorReg vr)
	{
		try {
			  Connection con = DBUtil.getConnection();
			  String cmd="insert into visitorreg values(?,?,?,?,?,?,?)";
			  PreparedStatement ps= con.prepareStatement(cmd);
			 
			  ps.setLong(1, vr.getAdharid());
			  ps.setString(2, vr.getName());
			  ps.setString(3, vr.getAddress());
			  ps.setLong(4,vr.getPhone());
			  ps.setString(5, vr.getEmailid());
			  ps.setString(6, vr.getPwd());
			  ps.setString(7, vr.getCpwd());
			 System.out.println(vr);
			  ps.executeUpdate();
			 return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return false;
		
	}
	
	public VisitorReg getRegDetailsByAdharid(Long adharid) {
		try {
			  Connection con = DBUtil.getConnection();
			  String cmd="select * from visitorreg where adharid=?";
			  PreparedStatement ps= con.prepareStatement(cmd);
			  ps.setLong(1, adharid);
			  ResultSet rs= ps.executeQuery();
			  if(rs.next()) {
				Long aid= rs.getLong(1);
				String name= rs.getString(2);
				String adr= rs.getString(3);
				Long phn= rs.getLong(4);
				String eml= rs.getString(5);
				String pd= rs.getString(6);
				String cpd= rs.getString(7);
				VisitorReg vr= new VisitorReg(aid,name,adr,phn,eml,pd,cpd);
				return vr;
				
			  }
		}
             catch(Exception e) {
            	 e.printStackTrace();
             }
		
             return null;
		
	}
	public SecurityReg getRegDetailsByUserid(String userid) {
		try {
			  Connection con = DBUtil.getConnection();
			  String cmd="select * from securityreg where userid=?";
			  PreparedStatement ps= con.prepareStatement(cmd);
			  ps.setString(1, userid);
			  ResultSet rs= ps.executeQuery();
			  if(rs.next()) {
				String sid= rs.getString(1);
				String uname= rs.getString(2);
				Long pn= rs.getLong(3);
				String addr= rs.getString(4);
				
				String psd= rs.getString(5);
				
				SecurityReg sr= new SecurityReg(sid,uname,pn,addr,psd);
				return sr;
				
			  }
		}
             catch(Exception e) {
            	 e.printStackTrace();
             }
		
             return null;
		
	}
	public boolean applyPassDetails(Visitor i) {
		  boolean isInserted = false; 
	
		try {
			  Connection con = DBUtil.getConnection();
			  String cmd="insert into visitor(adharid,vname,cname,doc,fromdate,todate,reason) values(?,?,?,?,?,?,?)";
			  PreparedStatement ps= con.prepareStatement(cmd,Statement.RETURN_GENERATED_KEYS);
			  
		
			  
			  ps.setLong(1, i.getAdharid());
			  ps.setString(2, i.getVname());
			  ps.setString(3, i.getCompany());
			  ps.setString(4, i.getDoc());
			  SimpleDateFormat sf=new SimpleDateFormat("dd-MM-yyyy'T'HH:mm");
			  java.sql.Date fdate=new java.sql.Date(i.getFdate().getTime());
			  ps.setDate(5, fdate);
			  SimpleDateFormat st=new SimpleDateFormat("dd-MM-yyyy'T'HH:mm");
			  java.sql.Date tdate=new java.sql.Date(i.getTdate().getTime());
			  ps.setDate(6, tdate);
			  ps.setString(7, i.getReason());
			  int affectedRows = ps.executeUpdate();
			  System.out.println("Affected Rows: " + affectedRows);
			  if (affectedRows > 0) {
		            // Retrieve the generated passid
		            ResultSet rs = ps.getGeneratedKeys();
		            if (rs.next()) {
		                long generatedPassId = rs.getLong(1);  // Get the generated passid
		                i.setPassid(generatedPassId);   // Set the generated passid in the Visitor object
		                isInserted = true;  // Set success flag
		            }
			  }}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return isInserted;
	}
		public long generatePassId() throws SQLException {
			long passid = 0;
	        String query = "SELECT passid_seq.NEXTVAL FROM dual";
	        
	        try (Connection con = DBUtil.getConnection();
	             PreparedStatement ps = con.prepareStatement(query);
	             ResultSet rs = ps.executeQuery()) {
	             
	            if (rs.next()) {
	                passid = rs.getLong(1);
	            }
	        }
	        
	        return passid; // Using the current time as a simple unique ID
		}
	public boolean addSecurityDetails(SecurityReg sr) {
		try {
			  Connection con = DBUtil.getConnection();
			  String cmd="insert into securityreg values(?,?,?,?,?)";
			  PreparedStatement ps= con.prepareStatement(cmd);
			  
			  
			  ps.setString(1, sr.getUserid());
			  ps.setString(2, sr.getUsername());
			  ps.setLong(3, sr.getPhone());
			  ps.setString(4, sr.getAddress());
			  ps.setString(5, sr.getPswd());
			  ps.executeQuery();
			 return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
		//------------------------------------------------------------------------------
	
	//==========================================================================
		public Visitor getVisitorDetailsByAadhaarno(long adharid){
			try {
				  Connection con = DBUtil.getConnection();
				  String cmd="select * from visitor  where adharid=? order BY passid DESC";
				  PreparedStatement ps= con.prepareStatement(cmd);
				  ps.setLong(1, adharid);
				  ResultSet rs= ps.executeQuery();
				  if(rs.next()) {
					  long pid= rs.getLong(1);
					  long aid= rs.getLong(2);
					  String vname= rs.getString(3);
					  String cname= rs.getString(4);
					  String doc= rs.getString(5);
					  Date fdate= rs.getDate(6);
					  Date tdate= rs.getDate(7);
					  String reason= rs.getString(8);
						Visitor vd=new Visitor(pid,aid,vname,cname,doc,fdate,tdate,reason);
						//System.out.println(vd);
						return vd;	
				 }
				  
			}
	             catch(Exception e) {
	            	 e.printStackTrace();
	             }
			
	             return null;
			
		}
		public VisitorReg getUserDetailsByaid(long adharid){
			try {
				  Connection con = DBUtil.getConnection();
				  String cmd="select * from visitorReg where adharid=?";
				  PreparedStatement ps= con.prepareStatement(cmd);
				  ps.setLong(1, adharid);
				  ResultSet rs= ps.executeQuery();
				  if(rs.next()) {
					  long uaid= rs.getLong(1);
					  String uname= rs.getString(2);
					  String uadr= rs.getString(3);
					  long uphn= rs.getLong(4);
					  String ueml= rs.getString(5);
					  String upwd= rs.getString(6);
					  String ucpwd= rs.getString(7);
						VisitorReg svr=new VisitorReg(uaid,uname,uadr,uphn,ueml,upwd,ucpwd);
						System.out.println(svr);
						return svr;	
				 }
				  
			}
	             catch(Exception e) {
	            	 e.printStackTrace();
	             }
			return null;
			
	           
			
		}
		
		public Visitor getVisitorDetailsBypassno(long passid){
			try {
				  Connection con = DBUtil.getConnection();
				  String cmd="select * from visitor where passid=?";
				  PreparedStatement ps= con.prepareStatement(cmd);
				  ps.setLong(1, passid);
				  ResultSet rs= ps.executeQuery();
				  if(rs.next()) {
					  long pid= rs.getLong(1);
					  long aid= rs.getLong(2);
					  String vname= rs.getString(3);
					  String cname= rs.getString(4);
					  String doc= rs.getString(5);
					  Date fdate= rs.getDate(6);
					  Date tdate= rs.getDate(7);
					  String reason= rs.getString(8);
						Visitor svd=new Visitor(pid,aid,vname,cname,doc,fdate,tdate,reason);
						System.out.println(svd);
						return svd;	
				 }
				  
			}
	             catch(Exception e) {
	            	 e.printStackTrace();
	             }
			return null;
			
	           
			
		}
		
		public boolean addVisitorDetails(Security s) {
			try {
				  Connection con = DBUtil.getConnection();
				  String cmd="insert into security values(?,?,?,?)";
				  PreparedStatement ps= con.prepareStatement(cmd);
				  
				  
				  ps.setLong(1, s.getPassid());
				  ps.setBlob(2, s.getImage());
				  ps.setBlob(3, s.getDocument());
				  ps.setString(4, s.getStatus());
				  
				  ps.executeQuery();
				 return true;
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return false;
		}
		
		//----------------------------------------------------------------------------------------
		public Visitor getMyPassByPassid(long passid) 
		 {
			Visitor vispass = null;
				try 
				{
					  Connection con = DBUtil.getConnection();
					  String cmd="select * from visitor where passid=?";
					  PreparedStatement ps= con.prepareStatement(cmd);
					 
					  ps.setLong(1, passid);
					  ResultSet rs= ps.executeQuery();
					  if(rs.next()) 
					  {
						  long mp=rs.getLong(1);
						  long ma= rs.getLong(2);
						  String mvn= rs.getString(3);
						  String mcn= rs.getString(4);
						  String md= rs.getString(5);
						  Date mfdate= rs.getDate(6);
						  Date mtdate= rs.getDate(7);
						  String mreason= rs.getString(8);
					
						  
						  vispass =new Visitor(mp,ma,mvn,mcn,md,mfdate,mtdate,mreason);
						  //System.out.println(pass);
			               
							
							
							
					  }
				}
		             catch(Exception e) 
				{
		            	 e.printStackTrace();
		             }
				return vispass;
				
				
		             
		 }
	//=================================================================================================================================================
		
		public Pass getFullDetailBypassid(long passid) 
		 {
			 Pass pass = null;
				try 
				{
					  Connection con = DBUtil.getConnection();
					  String cmd="select v.passid,v.adharid,v.vname,v.cname,v.doc,v.fromdate,v.todate,v.reason,s.image,s.document,s.status FROM visitor v JOIN security s ON v.passid = s.passid WHERE v.passid=? and s.status='Approved'";
					  PreparedStatement ps= con.prepareStatement(cmd);
					 
					  ps.setLong(1, passid);
					  ResultSet rs= ps.executeQuery();
					  if(rs.next()) 
					  {
						  long pid1=rs.getLong(1);
						  long adhid= rs.getLong(2);
						  String vname= rs.getString(3);
						  String cname= rs.getString(4);
						  String doc= rs.getString(5);
						  Date fdate= rs.getDate(6);
						  Date tdate= rs.getDate(7);
						  String reason= rs.getString(8);
					
						  Blob img= rs.getBlob(9);
			                Blob docu = rs.getBlob(10);
						  String status= rs.getString(11);
						  
						  pass =new Pass(pid1,adhid,vname,cname,doc,fdate,tdate,reason,null,null,status);
						  //System.out.println(pass);
			               
							if (img != null) {
								
								 try (InputStream imgStream = img.getBinaryStream()){
			                    pass.setImage(imgStream);
			                    pass.setImageBase64(Base64Util.convertToBase64(imgStream));
			                }
							}

			                if (docu != null) {
			                	 try (InputStream docuStream = docu.getBinaryStream()){
			                    pass.setDocument(docuStream);
			                    pass.setDocumentBase64(Base64Util.convertToBase64(docuStream));
			                }
					  }
							
							
					  }
				}
		             catch(Exception e) 
				{
		            	 e.printStackTrace();
		             }
				return pass;
				
				
		             
		 }
		//----------------------------------------------------------
		public MyApplication getMyApplicationByadharid(long adharid) 
		 {
			 MyApplication myap = null;
				try 
				{
					  Connection con = DBUtil.getConnection();
					  String cmd="select passid,adharid,fromdate,todate,reason FROM visitor WHERE adharid=?";
					  PreparedStatement ps= con.prepareStatement(cmd);
					 
					  ps.setLong(1, adharid);
					  ResultSet rs= ps.executeQuery();
					  if(rs.next()) 
					  {
						  long pid1=rs.getLong(1);
						  long adhid= rs.getLong(2);
						  Date fdate= rs.getDate(3);
						  Date tdate= rs.getDate(4);
						  String reason= rs.getString(5);
					
						  
						  myap =new MyApplication(pid1,adhid,fdate,tdate,reason);
						  //System.out.println(pass);
			          
							
							
					  }
				}
		             catch(Exception e) 
				{
		            	 e.printStackTrace();
		             }
				return myap;
				
				
				
		             
		 }
		//COUNT-------------------------------------------:-
		//---------------------------------------------------------------------------------------
		
	//-----------------------------------------------------------------------------------------	
		public boolean validateUser(String userid,String pswd) {
			
			  
			  try {
				  Connection con = DBUtil.getConnection();
	        String cmd="select * from securityreg where userid=? and pswd=?";
				  PreparedStatement ps= con.prepareStatement(cmd);
		  ps.setString(1,userid);
		  ps.setString(2,pswd);
		  ResultSet rs= ps.executeQuery();
		  if(rs.next())
			  return true;
		  else
			  return false;
		  
			  }
			  catch(Exception e) {
				  
			  }
			  return false;
		  }
		
		
		public boolean validateAdmin(String username,String pwd) {
			
			  
			  try {
				  Connection con = DBUtil.getConnection();
	        String cmd="select * from adminlog where username=? and pwd=?";
				  PreparedStatement ps= con.prepareStatement(cmd);
		  ps.setString(1,username);
		  ps.setString(2,pwd);
		  ResultSet rs= ps.executeQuery();
		  if(rs.next())
			  return true;
		  else
			  return false;
		  
			  }
			  catch(Exception e) {
				  
			  }
			  return false;
		  }
		
		public boolean validateVisitor(Long adharid,String pwd) {
			
			  
			  try {
				  Connection con = DBUtil.getConnection();
	        String cmd="select * from visitorreg where adharid=? and pwd=?";
				  PreparedStatement ps= con.prepareStatement(cmd);
		  ps.setLong(1,adharid);
		  ps.setString(2,pwd);
		  ResultSet rs= ps.executeQuery();
		  if(rs.next())
			  return true;
		  else
			  return false;
		  
			  }
			  catch(Exception e) {
				  
			  }
			  return false;
		  }
		
		public SecurityReg getRegDetailsByName(String userid) {
			try {
				  Connection con = DBUtil.getConnection();
				  String cmd="select * from securityreg where userid=?";
				  PreparedStatement ps= con.prepareStatement(cmd);
				  ps.setString(1, userid);
				  ResultSet rs= ps.executeQuery();
				  if(rs.next()) {
					String uid= rs.getString(1);
					String uname= rs.getString(2);
					long phn= rs.getLong(3);
					String adr= rs.getString(4);
					String pwd= rs.getString(5);
					
					SecurityReg sr= new SecurityReg(uid,uname,phn,adr,pwd);
					
					return sr;
					
					
				  }
			}
	             catch(Exception e) {
	            	 e.printStackTrace();
	             }
			
	             return null;
			
		}
		
		/*public ArrayList<Pass> getAllPassDetails(){
			  ArrayList<Pass> pList= new ArrayList<Pass>();
				Pass pass;
				try 
				{
					  Connection con = DBUtil.getConnection();
					  String cmd="select i.adharid,i.vname,i.cname,i.doc,i.fromdate,i.todate,i.reason,s.image,s.document,s.status FROM initiator i JOIN security s ON i.adharid = s.adharid WHERE i.adharid=?";
					  PreparedStatement ps= con.prepareStatement(cmd);
					 
					 
					long adharid;
					ps.setLong(1, adharid);
					  ResultSet rs= ps.executeQuery();
					  if(rs.next()) 
					  {
						  long adhid= rs.getLong(1);
						  String vname= rs.getString(2);
						  String cname= rs.getString(3);
						  String doc= rs.getString(4);
						  Date fdate= rs.getDate(5);
						  Date tdate= rs.getDate(6);
						  String reason= rs.getString(7);
					
						  Blob img= rs.getBlob(8);
			                Blob docu = rs.getBlob(9);
						  String status= rs.getString(10);
						  
						  pass =new Pass(adhid,vname,cname,doc,fdate,tdate,reason,null,null,status);
						  //System.out.println(pass);
			               
							if (img != null) {
								 try (InputStream imgStream = img.getBinaryStream()){
			                    pass.setImage(imgStream);
			                    pass.setImageBase64(Base64Util.convertToBase64(imgStream));
			                }
							}

			                if (docu != null) {
			                	 try (InputStream docuStream = docu.getBinaryStream()){
			                    pass.setDocument(docuStream);
			                    pass.setDocumentBase64(Base64Util.convertToBase64(docuStream));
			                }
					  }
							
							
					  }
				}
		             catch(Exception e) 
				{
		            	 e.printStackTrace();
		             }
				return pList;
				
				
				
		             
		 }*/
		
		//--------------------------------------BIOMETRIC-------------------------------------------------------------------
		
		public VisitorReg getUserByAadhaar(String aadhaarId) {
	  
	        return null;
	    }
		
		
		//----------------------------------------------------------------------------------------------------------------------
		public boolean updatePassDetails(Security security) {
		    String cmd = "UPDATE security SET status = ? " +
		                 (security.getImage() != null ? ", image = ?" : "") +
		                 (security.getDocument() != null ? ", document = ?" : "") +
		                 " WHERE passid = ?";

		    try (Connection con = DBUtil.getConnection();
		    		PreparedStatement ps= con.prepareStatement(cmd);) {
		        
		        int index = 1;
		        ps.setString(index++, security.getStatus());
		        
		        if (security.getImage() != null) {
		            ps.setBlob(index++, security.getImage());
		        }
		        if (security.getDocument() != null) {
		            ps.setBlob(index++, security.getDocument());
		        }

		        ps.setLong(index, security.getPassid());

		        int rowsUpdated = ps.executeUpdate();
		        return rowsUpdated > 0;
		    } catch (SQLException e) {
		        e.printStackTrace();
		        return false;
		    }
		}
		public boolean modifySecurityDetails(SecurityReg sr) {
			try {
				  Connection con = DBUtil.getConnection();
				  String cmd="update securityreg set username=?,phone=?,address=?,pswd=? where userid=?";
				  PreparedStatement ps= con.prepareStatement(cmd);
				  
				  ps.setString(1, sr.getUsername());
				  ps.setLong(2, sr.getPhone());
				  ps.setString(3,sr.getAddress() );
				  ps.setString(4, sr.getPswd());
				  ps.setString(5, sr.getUserid());
				  ps.executeQuery();
				 return true;
			}
			catch(Exception e1)
			{
				e1.printStackTrace();
			}
			return false;
		}
		public ArrayList<VisitorReg> getAllUserReg(){
			  ArrayList<VisitorReg> vrList= new ArrayList<VisitorReg>();

			  try {
			  Connection con = DBUtil.getConnection();
			  String cmd="select * from VisitorReg";
			  PreparedStatement ps= con.prepareStatement(cmd);
			  ResultSet rs= ps.executeQuery();
			  while(rs.next()) {
				  
				  long aid= rs.getLong(1);
				  String name= rs.getString(2);
				  String adr= rs.getString(3);
				  long phn= rs.getLong(4);
				  String email= rs.getString(5);
				  String pd= rs.getString(6);
				  String cpd= rs.getString(7);
					VisitorReg vr=new VisitorReg(aid,name,adr,phn,email,pd,cpd);
				//System.out.println(av);
				vrList.add(vr);
			  }
			  
			  return vrList;
			    
			  }
			 
			  catch(Exception e) {
				  e.printStackTrace();
			  }
			  return vrList;
		  }

public ArrayList<Pass> getAllVisitDetails(){
	  ArrayList<Pass> pList= new ArrayList<Pass>();
	  Pass p = null;
	  try {
	  Connection con = DBUtil.getConnection();
	  String cmd="select v.passid,v.adharid,v.vname,v.cname,v.doc,v.fromdate,v.todate,v.reason,s.image,s.document,s.status FROM (visitor v JOIN security s ON v.passid = s.passid )order by passid desc";
	  PreparedStatement ps= con.prepareStatement(cmd);
	  ResultSet rs= ps.executeQuery();
	  while(rs.next()) {
		  
		  long pid=rs.getLong(1);
		  long aid= rs.getLong(2);
		  String viname= rs.getString(3);
		  String coname= rs.getString(4);
		  String docu= rs.getString(5);
		  Date frdate= rs.getDate(6);
		  Date todate= rs.getDate(7);
		  String rn= rs.getString(8);
	
		  Blob imag= rs.getBlob(9);
            Blob docum = rs.getBlob(10);
		  String sts= rs.getString(11);
		   p= new Pass(pid,aid,viname,coname,docu,frdate,todate,rn,null,null,sts);
		  if (imag != null) {
				 try (InputStream imgStream = imag.getBinaryStream()){
             p.setImage(imgStream);
             p.setImageBase64(Base64Util.convertToBase64(imgStream));
         }
			}

         if (docum != null) {
         	 try (InputStream docuStream = docum.getBinaryStream()){
             p.setDocument(docuStream);
             p.setDocumentBase64(Base64Util.convertToBase64(docuStream));
         }
	  }
		//System.out.println(p);
		pList.add(p);
	  }
	  
	  return pList;
	    
	  }
	 
	  catch(Exception e) {
		  e.printStackTrace();
	  }
	  return pList;
}
	  public ArrayList<Visitor> getAllPassApplication(){
		  ArrayList<Visitor> vList= new ArrayList<Visitor>();

		  try {
		  Connection con = DBUtil.getConnection();
		  String cmd="select * from Visitor";
		  PreparedStatement ps= con.prepareStatement(cmd);
		  ResultSet rs= ps.executeQuery();
		  while(rs.next()) {
			  
			  long pid=rs.getLong(1);
			  long aid= rs.getLong(2);
			  String vname= rs.getString(3);
			  String cname= rs.getString(4);
			  String doc= rs.getString(5);
			  Date fdate= rs.getDate(6);
			  Date tdate= rs.getDate(7);
			  String reason= rs.getString(8);
				Visitor av=new Visitor(pid,aid,vname,cname,doc,fdate,tdate,reason);
			//System.out.println(av);
			vList.add(av);
		  }
		  
		  return vList;
		    
		  }
		 
		  catch(Exception e) {
			  e.printStackTrace();
		  }
		  return vList;
	  }
	  public List<Visitor> getApplicationsByAdharid(long adharid) {
	        String query = "SELECT * FROM visitor WHERE adharid = ?";
	        List<Visitor> maList = new ArrayList<>();

	        try (Connection conn = DBUtil.getConnection();
	             PreparedStatement pstmt = conn.prepareStatement(query)) {
	             
	            pstmt.setLong(1,adharid);
	            ResultSet rs = pstmt.executeQuery();

	            while (rs.next()) {
	            	long pid=rs.getLong(1);
	  			  long aid= rs.getLong(2);
	  			  String vname= rs.getString(3);
	  			  String cname= rs.getString(4);
	  			  String doc= rs.getString(5);
	  			  Date fdate= rs.getDate(6);
	  			  Date tdate= rs.getDate(7);
	  			  String reason= rs.getString(8);
	  				Visitor mav=new Visitor(pid,aid,vname,cname,doc,fdate,tdate,reason);
	  				//System.out.println(mav);
	                maList.add(mav);
	                
	            }
	            return maList;
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return maList;
	    }
	  public ArrayList<SecurityReg> getAllSecurityDetails(){
		  ArrayList<SecurityReg> sList= new ArrayList<SecurityReg>();

		  try {
		  Connection con = DBUtil.getConnection();
		  String cmd="select * from SecurityReg";
		  PreparedStatement ps= con.prepareStatement(cmd);
		  ResultSet rs= ps.executeQuery();
		  while(rs.next()) {
			  
			  
			  String uid= rs.getString(1);
			  String uname= rs.getString(2);
			  long phn= rs.getLong(3);
			  String adr= rs.getString(4);
			  String pwd= rs.getString(5);
			  
			  SecurityReg sr=new SecurityReg(uid,uname,phn,adr,pwd);
			//System.out.println(sr);
			sList.add(sr);
		  }
		  
		  return sList;
		    
		  }
		 
		  catch(Exception e) {
			  e.printStackTrace();
		  }
		  return sList;
	  }
	  public boolean deleteUserByID(long adharid) {
			try {
				  Connection con = DBUtil.getConnection();
				  String cmd="delete from visitorReg where adharid=?";
				  PreparedStatement ps= con.prepareStatement(cmd);
				  ps.setLong(1, adharid);
				  ResultSet rs= ps.executeQuery();
				  ps.setLong(1, adharid);
					ps.executeQuery();
					return true;
					
				
			}
	             catch(Exception e) {
	            	 e.printStackTrace();
	             }
			return false;
			
	             
			
		}
	  public boolean deleteSecurityByID(String userid) {
			try {
				  Connection con = DBUtil.getConnection();
				  String cmd="delete from SecurityReg where userid=?";
				  PreparedStatement ps= con.prepareStatement(cmd);
				  ps.setString(1, userid);
				  ResultSet rs= ps.executeQuery();
				  ps.setString(1, userid);
					ps.executeQuery();
					return true;
					
				
			}
	             catch(Exception e) {
	            	 e.printStackTrace();
	             }
			return false;
			
	             
			
		}
	  
	  
	  }



