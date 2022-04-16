package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.ProductDTO;

public class ProductDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public ProductDAO() {
		conn = DBConnection.getConnection();
	}
	
	public boolean addProduct(ProductDTO product) {
		String sql = "insert into product (prodname, prodprice, prodamount, prodinfo, userid)"
				+ "values(?, ? ,? ,? ,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, product.prodname);
			ps.setInt(2, product.prodprice);
			ps.setInt(3, product.prodamount);
			ps.setString(4, product.prodinfo);
			ps.setString(5,product.userid);
			
			return ps.executeUpdate() == 1;
		} catch (SQLException sqle) {
			System.out.println("쿼리 수행 실패 : " + sqle);
		}
		return false;
	}

	public String getList() {
		String sql = "select * from product where userid = ?";
		String result = "";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, Session.get("login_id"));
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				result += String.format("%s. %s : %s원(재고 : %s)\n", rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4));
			}
		} catch (SQLException sqle) {
			System.out.println("쿼리 수행 실패 : " + sqle);
		}
		return result;
	}

	public boolean removeProduct(int prodnum) {
		String sql = "delete from product where prodnum = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, prodnum);
			
			return ps.executeUpdate() == 1;
		} catch (SQLException sqle) {
			System.out.println("쿼리 수행 실패 : " + sqle);
		}
		return false;
	}

	public boolean modifyProduct(int prodnum, int choice, String newData) {
		// 1. 가격수정\n2. 재고수정\n3. 설명수정
		String[] arr = {"prodprice", "prodamount", "prodinfo"};
		String sql = "update product set " + arr[choice - 1] + " = ? where prodnum = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, newData);
			ps.setInt(2, prodnum);
			
			return ps.executeUpdate() == 1;
		} catch (SQLException sqle) {
			System.out.println("쿼리 수행 실패 : " + sqle);
		}
		return false;
	}

	public void removeAll() {
		String sql = "delete from product where userid = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, Session.get("login_id"));
			
			ps.executeUpdate();
		} catch (SQLException sqle) {
			System.out.println("쿼리 수행 실패 : " + sqle);
		}
	}

	public String search(String keyword) {
		String sql = "select * from product where prodname like ?";
		String result = "";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + keyword + "%");
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				result += String.format("%s. %s : %s원(재고 : %s)\n", rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4));
			}
		} catch (SQLException sqle) {
			System.out.println("쿼리 수행 실패 : " + sqle);
		}
		return result;
	}
	
	public String productInfo(int prodnum) {
		String sql = "select * from product where prodnum = ?";
		String result = "";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, prodnum);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				result += "이름 : " + rs.getString(2) +"\n";
				result += "가격 : " + rs.getInt(3) +"\n";
				result += "재고 : " + rs.getInt(4) +"\n";
				result += "설명 : " + rs.getString(5) +"\n";
				result += "좋아요 갯수 : " + rs.getInt(6) +"\n";
			}
		} catch (SQLException sqle) {
			System.out.println("쿼리 수행 실패 : " + sqle);
		}
		return result;
	}

	public boolean clickLike(int prodnum) {
		String sql = "update product set likecnt = likecnt + 1 where prodnum = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, prodnum);
			
			return ps.executeUpdate() == 1;
		} catch (SQLException sqle) {
			System.out.println("쿼리 수행 실패 : " + sqle);
		}
		return false;
	}

	public String seller(String prodnum) {
		String sql = "select userid from product where prodnum = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(prodnum));
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (SQLException sqle) {
			System.out.println("쿼리 수행 실패 : " + sqle);
		}
		return "";
	}

}


















