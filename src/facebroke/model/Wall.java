package facebroke.model;

import java.time.ZonedDateTime;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Walls")
public class Wall {

	// Instance variables to be serialized
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	private ZonedDateTime created, updated;

	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "user_id")
	private User user;

	// Hibernate constructor
	public Wall() {
	}

	/**
	 * Build a wall, not the "Mexico will pay for it" kind, thankfully
	 * 
	 * @param user
	 *            - the owner of the wall
	 */
	public Wall(User user) {
		this.user = user;
		this.created = this.updated = ZonedDateTime.now();
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public long getId() {
		return id;
	}

	public ZonedDateTime getCreated() {
		return created;
	}

	public ZonedDateTime getUpdated() {
		return updated;
	}
}
