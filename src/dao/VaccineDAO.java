package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.JdbcUtil;
import vo.CountVO;
import vo.CustVO;
import vo.InjectionVO;
import vo.OrderVO;

public class VaccineDAO {

	public ArrayList<CustVO> getCustList() {
		ArrayList<CustVO> list = new ArrayList<CustVO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtil.getConnection();
			ps = conn.prepareStatement(
					"select cust_id,cust_name,cust_birth,cust_tel1,cust_tel2,cust_tel3,decode(cust_gender,'M','남자','F','여자') cust_gender,city from TBL_CUST_201004");
			rs = ps.executeQuery();
			while (rs.next()) {
				CustVO vo = new CustVO();
				vo.setCust_id(rs.getString("cust_id"));
				vo.setCust_name(rs.getString("cust_name"));
				vo.setCust_birth(rs.getString("cust_birth"));
				vo.setCust_tel1(rs.getString("cust_tel1"));
				vo.setCust_tel2(rs.getString("cust_tel2"));
				vo.setCust_tel3(rs.getString("cust_tel3"));
				vo.setCust_gender(rs.getString("cust_gender"));
				vo.setCity(rs.getString("city"));
				list.add(vo);

			}

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			JdbcUtil.close(conn, ps, rs);

		}

		return list;
	}

	public int InsertVaccine(OrderVO vo) {
		Connection conn = null;
		PreparedStatement ps = null;
		int n = 0;
		try {
			conn = JdbcUtil.getConnection();
			ps = conn.prepareStatement("insert into tbl_order_201004 values(?,?,?,?)");
			ps.setInt(1, vo.getI_code());
			ps.setString(2, vo.getV_code());
			ps.setString(3, vo.getCust_id());
			ps.setDate(4, vo.getI_date());
			n = ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			JdbcUtil.close(conn, ps);
		}
		return n;
	}

	public ArrayList<InjectionVO> getInjectionList() {
		ArrayList<InjectionVO> list = new ArrayList<InjectionVO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtil.getConnection();
			ps = conn.prepareStatement(
					"select B.i_code, A.cust_id,A.cust_name ,B.v_code,C.v_name,B.i_date from TBL_CUST_201004 A,TBL_ORDER_201004 B,TBL_INJECTION_201004 C where A.cust_id = B.cust_id and B.v_code = C.v_code");
			rs = ps.executeQuery();
			while (rs.next()) {
				InjectionVO vo = new InjectionVO();
				vo.setI_code(rs.getInt("i_code"));
				vo.setCust_id(rs.getString("cust_id"));
				vo.setCust_name(rs.getString("cust_name"));
				vo.setV_code(rs.getString("v_code"));
				vo.setV_name(rs.getString("v_name"));
				vo.setI_date(rs.getDate("i_date"));
				list.add(vo);
			}

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}

		return list;

	}

	public ArrayList<CountVO> getCountList() {
		ArrayList<CountVO> list = new ArrayList<CountVO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtil.getConnection();
			ps = conn.prepareStatement("select A.v_code,B.v_name,count(B.v_name) count from  TBL_ORDER_201004 A , TBL_INJECTION_201004 B where A.v_code = B.v_code group by A.v_code,B.v_name order by A.v_code asc");
			rs = ps.executeQuery();
			while (rs.next()) {
				CountVO vo = new CountVO();
				vo.setV_code(rs.getString("v_code"));
				vo.setV_name(rs.getString("v_name"));
				vo.setCount(rs.getInt("count"));
				list.add(vo);
			}

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			JdbcUtil.close(conn, ps, rs);
		}

		return list;
	}

}
