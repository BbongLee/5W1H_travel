package travel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import travel.Travel;

public class TravelProc {
	private Connection conn;
	private ResultSet rs;
	
	public TravelProc() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/travel";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return ""; 
	}
	
	public int getNext(String userID) {
		String SQL = "SELECT ID FROM WH_travel ORDER BY ID DESC";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			
			return 1; 
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return 1;
	}
	
	public int write(
			String userID, int whoNum, String whoWith,
			String whereCountry,String whereRegion,String whereCity,
			String whereLoc, String wherePla, String whenStart,
			String whenEnd, String what, int howAirplane,
			int howTrain, int howBus, int howShip,
			int howWalk, int howBike, String why
			) {
		String SQL = "INSERT INTO WH_travel (userID, whoNum, whoWith, "
				+"whereCountry, whereRegion, whereCity,"
				+"whereLoc, wherePla, whenStart,"
				+"whenEnd, what, howAirplane,"
				+"howTrain, howBus, howShip,"
				+"howWalk, howBike, why"
			+") VALUES (?, ?, ?,?, ?, ?,?, ?, ?,?, ?, ?,?, ?, ?,?, ?, ?)";
		
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, userID);
			pstmt.setInt(2, whoNum);
			pstmt.setString(3, whoWith);
			pstmt.setString(4, whereCountry);
			pstmt.setString(5, whereRegion);
			pstmt.setString(6, whereCity);
			pstmt.setString(7, whereLoc);
			pstmt.setString(8, wherePla);
			pstmt.setString(9, whenStart);
			pstmt.setString(10, whenEnd);
			pstmt.setString(11, what);
			pstmt.setInt(12, howAirplane);
			pstmt.setInt(13, howTrain);
			pstmt.setInt(14, howBus);
			pstmt.setInt(15, howShip);
			pstmt.setInt(16, howWalk);
			pstmt.setInt(17, howBike);
			pstmt.setString(18, why);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	public ArrayList<Travel> getList(String userID, String Query){
		String SQL = "SELECT * FROM WH_travel "+Query; 
		// whoNum=? ORDER BY id, ...
		ArrayList<Travel> list = new ArrayList<Travel>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Travel travel = new Travel();
				travel.setID(rs.getInt(1));
				travel.setUserID(rs.getString(2));
				travel.setWhoNum(rs.getInt(3));
				travel.setWhoWith(rs.getString(4));
				travel.setWhereCountry(rs.getString(5));
				travel.setWhereRegion(rs.getString(6));
				travel.setWhereCity(rs.getString(7));
				travel.setWhereLoc(rs.getString(8));
				travel.setWherePla(rs.getString(9));
				travel.setWhenStart(rs.getString(10));
				travel.setWhenEnd(rs.getString(11));
				travel.setWhat(rs.getString(12));
				travel.setHowAirplane(rs.getInt(13));
				travel.setHowTrain(rs.getInt(14));
				travel.setHowBus(rs.getInt(15));
				travel.setHowShip(rs.getInt(16));
				travel.setHowWalk(rs.getInt(17));
				travel.setHowBike(rs.getInt(18));
				travel.setWhy(rs.getString(19));
				travel.setTimestamp(rs.getString(20));
				travel.setSecret(rs.getInt(21));
				
				list.add(travel); 
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/*
	public boolean nextPage(String userID, int pageNumber) {
		String SQL = "SELECT * FROM WH_travel WHERE ID < ? AND Available = 1";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext(userID) - (pageNumber -1) * 10);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

	*/
	public Travel getMyTravel(String userID) {
		String SQL = "SELECT * FROM WH_travel WHERE userId = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Travel travel = new Travel();

				travel.setID(rs.getInt(1));
				travel.setUserID(rs.getString(2));
				travel.setWhoNum(rs.getInt(3));
				travel.setWhoWith(rs.getString(4));
				travel.setWhereCountry(rs.getString(5));
				travel.setWhereRegion(rs.getString(6));
				travel.setWhereCity(rs.getString(7));
				travel.setWhereLoc(rs.getString(8));
				travel.setWherePla(rs.getString(9));
				travel.setWhenStart(rs.getString(10));
				travel.setWhenEnd(rs.getString(11));
				travel.setWhat(rs.getString(12));
				travel.setHowAirplane(rs.getInt(13));
				travel.setHowTrain(rs.getInt(14));
				travel.setHowBus(rs.getInt(15));
				travel.setHowShip(rs.getInt(16));
				travel.setHowWalk(rs.getInt(17));
				travel.setHowBike(rs.getInt(18));
				travel.setWhy(rs.getString(19));
				travel.setTimestamp(rs.getString(20));
				travel.setSecret(rs.getInt(21));
				return travel;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public int update(String userID, int whoNum, String whoWith,
						String whereCountry,String whereRegion,String whereCity,
						String whereLoc, String wherePla, String whenStart,
						String whenEnd, String what, int howAirplane,
						int howTrain, int howBus, int howShip,
						int howWalk, int howBike, String why) {
		
		String SQL = "UPDATE WH_travel SET userID = ?, whoNum = ?, "
				+ "whoWith = ?, whereCountry = ?, whereRegion = ?, "
				+ "whereCity = ?, whereLoc = ?, wherePla = ?,"
				+ "whenStart = ?, whenEnd = ?, what = ?,"
				+ "howAirplane = ?, howTrain = ?, howBus = ?,"
				+ "howShip = ?, howWalk = ?, howBike = ?,"
				+ "why = ? WHERE ID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setInt(2, whoNum);
			pstmt.setString(3, whoWith);
			pstmt.setString(4, whereCountry);
			pstmt.setString(5, whereRegion);
			pstmt.setString(6, whereCity);
			pstmt.setString(7, whereLoc);
			pstmt.setString(8, wherePla);
			pstmt.setString(9, whenStart);
			pstmt.setString(10, whenEnd);
			pstmt.setString(11, what);
			pstmt.setInt(12, howAirplane);
			pstmt.setInt(13, howTrain);
			pstmt.setInt(14, howBus);
			pstmt.setInt(15, howShip);
			pstmt.setInt(16, howWalk);
			pstmt.setInt(17, howBike);
			pstmt.setString(18, why);
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1; 
	}
	
	public int delete(String userID, int ID) {
		String SQL = "UPDATE WH_travel SET Available = 0 WHERE ID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, ID);
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	
	
}
