package lcd.ssh.pojo;

import org.hibernate.annotations.Entity;

/**
 * User entity. @author MyEclipse Persistence Tools
 */
@Entity
public class User implements java.io.Serializable {

	// Fields

	private String uid;
	private String uname;
	private String dpt;
	private String password;
	private Integer role;
	
	

	// Constructors

	public String getUid() {
		return uid;
	}



	public void setUid(String uid) {
		this.uid = uid;
	}



	public String getUname() {
		return uname;
	}



	public void setUname(String uname) {
		this.uname = uname;
	}



	public String getDpt() {
		return dpt;
	}



	public void setDpt(String dpt) {
		this.dpt = dpt;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public Integer getRole() {
		return role;
	}



	public void setRole(Integer role) {
		this.role = role;
	}



	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String uid, String uname, String dpt, String password) {
		this.uid = uid;
		this.uname = uname;
		this.dpt = dpt;
		this.password = password;
	}

	/** full constructor */
	public User(String uid, String uname, String dpt, String password,
			Integer role) {
		this.uid = uid;
		this.uname = uname;
		this.dpt = dpt;
		this.password = password;
		this.role = role;
	}

	


}