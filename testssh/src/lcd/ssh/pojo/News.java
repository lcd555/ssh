package lcd.ssh.pojo;

import java.sql.Timestamp;
import java.util.Date;

import org.hibernate.annotations.Entity;

/**
 * News entity. @author MyEclipse Persistence Tools
 */
@Entity
public class News implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer classid;
	private String bjs;
	private String title;
	private String pic;
	private String istop;
	private Date tjdate;
	private String cruser;
	private Integer hitnum;
	private String content;

	// Constructors

	/** default constructor */
	public News() {
	}

	/** minimal constructor */
	public News(String istop) {
		this.istop = istop;
	}

	/** full constructor */
	public News(Integer classid, String bjs, String title, String pic,
			String istop, Timestamp tjdate, String cruser, Integer hitnum,
			String content) {
		this.classid = classid;
		this.bjs = bjs;
		this.title = title;
		this.pic = pic;
		this.istop = istop;
		this.tjdate = tjdate;
		this.cruser = cruser;
		this.hitnum = hitnum;
		this.content = content;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getClassid() {
		return this.classid;
	}

	public void setClassid(Integer classid) {
		this.classid = classid;
	}

	public String getBjs() {
		return this.bjs;
	}

	public void setBjs(String bjs) {
		this.bjs = bjs;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPic() {
		return this.pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getIstop() {
		return this.istop;
	}

	public void setIstop(String istop) {
		this.istop = istop;
	}

	public Date getTjdate() {
		return this.tjdate;
	}

	public void setTjdate(Date tjdate) {
		this.tjdate = tjdate;
	}

	public String getCruser() {
		return this.cruser;
	}

	public void setCruser(String cruser) {
		this.cruser = cruser;
	}

	public Integer getHitnum() {
		return this.hitnum;
	}

	public void setHitnum(Integer hitnum) {
		this.hitnum = hitnum;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}