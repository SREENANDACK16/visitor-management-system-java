package com.sea.vms.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import com.sea.vms.bean.Visitor;
import com.sea.vms.bean.VisitorReg;
import com.sea.vms.bean.MyApplication;
import com.sea.vms.bean.Pass;
import com.sea.vms.bean.Security;
import com.sea.vms.bean.SecurityReg;
import com.sea.vms.dao.PassDao;








public class PassService {
	PassDao dao= new PassDao();
	
	
	public boolean visitorRegDetails(VisitorReg vr) {
		boolean vrlag=dao.visitorRegDetails(vr);
		return vrlag;
	}
	public boolean validateVisitor(Long adharid,String pwd) {
		 boolean vvflag= dao.validateVisitor(adharid, pwd);
		 return vvflag;
}
	public VisitorReg getRegDetailsByAdharid(Long adharid) {
		VisitorReg vr= dao.getRegDetailsByAdharid(adharid);
		
		return vr;
	}
	public SecurityReg getRegDetailsByUserid(String userid) {
		SecurityReg sr= dao.getRegDetailsByUserid(userid);
		
		return sr;
	}
	public boolean applyPssDetails(Visitor i) {
		boolean apflag=dao.applyPassDetails(i);
		return apflag;
	}
	public boolean addSecurityDetails(SecurityReg sr) {
		boolean asflag=dao.addSecurityDetails(sr);
		return asflag;
	}
	//---------------------------------------------------
	  
	public Visitor getVisitorDetailsByAadhaarno(long adharid) {
		Visitor vd= dao.getVisitorDetailsByAadhaarno(adharid);
		
		return vd;
	}
	public VisitorReg getUserDetailsByaid(long adharid) {
		VisitorReg svr= dao.getUserDetailsByaid(adharid);
		
		return svr;
	}
	public Visitor getVisitorDetailsBypassno(long passid) {
		Visitor svd= dao.getVisitorDetailsBypassno(passid);
		
		return svd;
	}
	public Pass getFullDetailBypassid(long passid) {
		Pass p= dao.getFullDetailBypassid(passid);
		
		return p;
	}
	
	public Visitor getMyPassByPassid(long passid) {
		Visitor mp= dao.getMyPassByPassid(passid);
		
		return mp;
	}
	//++++++++++++++++++++++++++++++++++++++++++++++++++++++
	public MyApplication getMyApplicationByadharid(long adharid) {
		MyApplication ma= dao.getMyApplicationByadharid(adharid);
		
		return ma;
	}
	public boolean validateUser(String userid,String pswd) {
		 boolean vflag= dao.validateUser(userid, pswd);
		 return vflag;
}
	public boolean validateAdmin(String username,String pwd) {
		 boolean avflag= dao.validateAdmin(username, pwd);
		 return avflag;
}
	public boolean validateVisitor(String adharid,String pswd) {
		 boolean vvflag= dao.validateUser(adharid, pswd);
		 return vvflag;
}
	public SecurityReg getRegDetailsByName(String userid) {
		SecurityReg sr= dao.getRegDetailsByName(userid);
		
		return sr;
	}
	public long generatePassId() throws SQLException {
        return dao.generatePassId(); // Call DAO method to generate passid
    }
	/*public ArrayList<Pass> getAllPass(){
		ArrayList<Pass> pList = dao.getAllEvents();
		return PList;
	}*/
	
	public boolean addVisitorDetails(Security s) {
		boolean sflag=dao.addVisitorDetails(s);
		return sflag;
	}
	public boolean modifyPassDetails(Security security) {
	    
	    return dao.updatePassDetails(security);
	}
	public boolean modifySecurityDetails(SecurityReg sr) {
		boolean muflag=dao.modifySecurityDetails(sr);
		return muflag;
	}
	 public ArrayList<VisitorReg> getAllUserReg(){
			ArrayList<VisitorReg> vrList = dao.getAllUserReg();
			return vrList;
		}
	public ArrayList<Pass> getAllVisitDetails(){
		ArrayList<Pass> pList = dao.getAllVisitDetails();
		return pList;
	}
	 public ArrayList<Visitor> getAllPassApplication(){
			ArrayList<Visitor> vList = dao.getAllPassApplication();
			return vList;
		}
	 //+++++++++++++++++++++++++++++++++++++++++++++++++MY APPLICATION+++++++++++++++++++++
	 public List<Visitor> getApplicationsByAdharid(long adharid) {
	        // Add any business logic or validations here if needed
		 List<Visitor> maList = dao.getApplicationsByAdharid(adharid);
		return maList;
	    }
	 public List<Visitor> getSortedPassApplications() {
	        List<Visitor> vList = getAllPassApplication();
	        Collections.sort(vList, new Comparator<Visitor>() {
	            @Override
	            public int compare(Visitor v1, Visitor v2) {
	                return v1.getFdate().compareTo(v2.getFdate()); // Assuming getFdate() returns a Date object
	            }
	        });
	        return vList;
	    }
	 public int getUserRegCount() {
	        return getAllUserReg().size();
	    }
	 public int getPassApplicationCount() {
	        return getAllPassApplication().size();
	    }
	 public int getVisitCount() {
	        return getAllVisitDetails().size();
	    }
	 public int getSecurityCount() {
	        return getAllSecurityDetails().size();
	    }
	 public ArrayList<Visitor> getAllPassApplicationsByDateRange(Date fromDate) {
		    // Fetch all visitor applications
		    List<Visitor> allVisitors = getAllPassApplication();
		    
		    // Filter based on the date range
		    return allVisitors.stream()
		        .filter(visitor -> !visitor.getFdate().before(fromDate) )
		        .collect(Collectors.toCollection(ArrayList::new));
		}
	 public ArrayList<SecurityReg> getAllSecurityDetails(){
			ArrayList<SecurityReg> sList = dao.getAllSecurityDetails();
			return sList;
		}
	public boolean  deleteUserByID(long adharid)  {
		boolean deflag=dao.deleteUserByID(adharid);
		return deflag;
	}
	public boolean  deleteSecurityByID(String userid)  {
		boolean duflag=dao.deleteSecurityByID(userid);
		return duflag;
	}
	 

	
	//public ArrayList<Security> getAllVisitorDetails(){
		//ArrayList<Initiator> iList = dao.getAllVisitorDetail();
		//return iList;
	//}

}
