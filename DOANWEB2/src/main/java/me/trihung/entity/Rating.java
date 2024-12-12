package me.trihung.entity;

import java.io.Serializable;
import java.sql.Date;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;


@Entity
@Getter
@Setter
@Table(name="Rating")
@NamedQuery(name="Rating.findAll", query="SELECT r FROM Rating r")
public class Rating implements Serializable{

	private static final long serialVersionUID = 5302027001308063983L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="RatingId")
	private int ratingId;
	
	@Column(name="RatingDate", columnDefinition = "date NULL")
	private Date ratingDate;
	
	@Column(name="RatingValue", columnDefinition = "int")
	private int ratingValue;
	
	@Column(name="RatingComment", columnDefinition = "NVARCHAR(500) NULL")
	private String ratingComment;
	
	@ManyToOne()
	@JoinColumn(name = "UserId")
	private Users user;
	
	@Column(name="ProductId", columnDefinition = "int")
	private int productId;
	
	public Rating() {
		super();
	}
		
}
