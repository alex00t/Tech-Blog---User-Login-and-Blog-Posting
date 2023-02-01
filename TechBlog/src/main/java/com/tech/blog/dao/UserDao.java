package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.cj.xdevapi.Result;
import com.tech.blog.Entities.User;

public class UserDao {
	private Connection con;
	public UserDao(Connection con) {
		super();
		this.con = con;
	}
	public boolean SaveUser(User user) {
		boolean f = false;
		try {
			String qurey = "insert into user(name, email, password,gender,about) values(?,?,?,?,?)";
			PreparedStatement ps = this.con.prepareStatement(qurey);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getGender());
			ps.setString(5, user.getAbout());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f = true;
	}
//	Get user by Email and password
	public User getUserByEmailandPassword(String email, String password) {
		User user = null;
		try {
			String query = "select * from user where email=? and password=?";
			PreparedStatement pm = con.prepareStatement(query);
			pm.setString(1, email);
			pm.setString(2, password);
			ResultSet set = pm.executeQuery();
			if (set.next()) {
				user = new User();
				String name = set.getNString("name");
				user.setName(name);
				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setTimedate(set.getTimestamp("rdate"));
				user.setProfile(set.getString("profile"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	public boolean UpdateUser(User user)
	{
		boolean f= false;
		try {
			
			String query="update user set name=?,email=?, password=?, gender=?, about=?, profile=? where id=?";
			PreparedStatement p=con.prepareStatement(query);
			p.setString(1, user.getName());
			p.setString(2,user.getEmail());
			p.setString(3, user.getPassword());
			p.setString(4, user.getGender());
			p.setString(5, user.getAbout());
			p.setString(6, user.getProfile());
			p.setInt(7, user.getId());
			p.executeUpdate();
			f=true;
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public User getUserByUserid(int UserId)
	{
		User user=null;
		String q="select * from user where id=?";
		try {
			PreparedStatement pmst= this.con.prepareStatement(q);
			pmst.setInt(1, UserId);
			
			ResultSet set=pmst.executeQuery();
			if (set.next()) {
				user = new User();
				String name = set.getNString("name");
				user.setName(name);
				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setTimedate(set.getTimestamp("rdate"));
				user.setProfile(set.getString("profile"));
				
				
				
			}
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
		
	}
	
	
}
