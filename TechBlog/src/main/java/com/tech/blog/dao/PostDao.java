package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.mysql.cj.xdevapi.Result;
import com.tech.blog.Entities.Category;
import com.tech.blog.Entities.Post;

public class PostDao {
	Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}

	public ArrayList<Category> getAllCategories() {
		ArrayList<Category> list = new ArrayList<>();
		try {
			String q = "select*from category";
			Statement s1 = this.con.createStatement();
			ResultSet set = s1.executeQuery(q);
			while (set.next()) {
				int cid = set.getInt("cid");
				String cname = set.getString("cname");
				String cDescription = set.getString("cdescription");
				Category category = new Category(cid, cname, cDescription);
				list.add(category);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean savePost(Post p)

	{
		boolean f = false;
		try {
			String q = "insert into Post(ptitle,pcontent,pcode,plink,ppic,fid,puser) values(?,?,?,?,?,?,?) ";

			PreparedStatement pmts = con.prepareStatement(q);
			pmts.setString(1, p.getpTitle());
			pmts.setString(2, p.getpContent());
			pmts.setString(3, p.getpCode());
			pmts.setString(4, p.getPlink());
			pmts.setString(5, p.getpPic());
			pmts.setInt(6, p.getFid());
			pmts.setInt(7, p.getPuser());
			pmts.executeUpdate();
			return f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public List<Post> getAllPosts() {
		List<Post> list = new ArrayList<>();
		// get all post
		try {

			PreparedStatement pmst = con.prepareStatement("Select*from post order by pid desc");
			ResultSet set = pmst.executeQuery();

			while (set.next()) {
				int pid = set.getInt("pid");
				String ptitle = set.getNString("ptitle");
				String pcontent = set.getNString("pcontent");
				String pcode = set.getNString("pcode");
				String plink = set.getNString("plink");
				String pimg = set.getString("ppic");
				Timestamp pdate = set.getTimestamp("pdate");
				int cid = set.getInt("fid");
				Post post = new Post(pid, ptitle, pcontent, pimg, pdate, pid, cid, plink, pcode);
				list.add(post);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public List<Post> getpostBycidList(int fid) {

		List<Post> list = new ArrayList<>();
		// Fetch all post by id
		try {

			PreparedStatement pmst = con.prepareStatement("Select*from post where fid=?");
			pmst.setInt(1, fid);
			ResultSet set = pmst.executeQuery();

			while (set.next()) {
				int pid = set.getInt("pid");
				String ptitle = set.getNString("ptitle");
				String pcontent = set.getNString("pcontent");
				String pcode = set.getNString("pcode");
				String plink = set.getNString("plink");
				String pimg = set.getString("ppic");
				Timestamp pdate = set.getTimestamp("pdate");
				int puser=set.getInt("puser");
				int pfid=set.getInt("fid");
				Post post = new Post(pid, ptitle, pcontent, pimg, pdate, pfid, puser, plink, pcode);
				list.add(post);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}
	
	public Post getPostByPostId(int postid)
	{
		Post post=null;
		String q="select * from post where pid=?";
		try {
			PreparedStatement pmst=this.con.prepareStatement(q);
			
			pmst.setInt(1, postid);
			ResultSet set=pmst.executeQuery();
			if (set.next()) {
				int pid = set.getInt("pid");
				String ptitle = set.getNString("ptitle");
				String pcontent = set.getNString("pcontent");
				String pcode = set.getNString("pcode");
				String plink = set.getNString("plink");
				String pimg = set.getString("ppic");
				Timestamp pdate = set.getTimestamp("pdate");
				int puser=set.getInt("puser");
				int pfid=set.getInt("fid");
				 post = new Post(pid, ptitle, pcontent, pimg, pdate, pfid, puser, plink, pcode);
				
				
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return post;
		
	}

}
