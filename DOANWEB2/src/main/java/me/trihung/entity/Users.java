package me.trihung.entity;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "Users")
@NamedQuery(name = "Users.findAll", query = "SELECT user FROM Users user")
public class Users implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "UserId")
	private int userId;
	
	@Column(name = "UserFullName", columnDefinition = "NVARCHAR(200) NOT NULL")
	private String userfullName;
	
	@Column(name = "UserPhone", columnDefinition = "VARCHAR(13) NOT NULL")
	private String userPhone;
	
	@Column(name = "UserEmail", columnDefinition = "VARCHAR(200) NOT NULL")
	private String userEmail;
	
	@Column(name = "UserAddress", columnDefinition = "NVARCHAR(200) NOT NULL")
	private String useraddress;
	
	@Column(name = "UserName", columnDefinition = "VARCHAR(100) NOT NULL")
	private String userName;
	
	@Column(name = "UserPassword", columnDefinition = "VARCHAR(100) NOT NULL")
	private String userPassword;
	
	@Column(name = "UserIsAdmin", columnDefinition = "bit")
	private Boolean userIsAdmin;
	
	@Column(name = "UserImage", columnDefinition = "VARCHAR(100) NULL")
	private String userImage;
	
	//Ngày đăng ký tài khoản 
	@Column(name = "userRegisDay", columnDefinition = "DATE NOT NULL")
	private Date userRegisDay;
	
	@OneToMany(mappedBy = "user")
	private List<Orders> orders;
	
	public Users() {
		
	}

	
	
	
}
