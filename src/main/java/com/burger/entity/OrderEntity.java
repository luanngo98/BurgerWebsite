package com.burger.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity(name = "orders")
@Table(name = "orders")
@EntityListeners(AuditingEntityListener.class)
public class OrderEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "user_name")
	@NotBlank(message = "is required")
	private String userName;

	@Column(name = "address")
	@NotBlank(message = "is required")
	private String address;

	@Column(name = "phone")
	@NotBlank(message = "is required")
	private String phone;

	@Column(name = "order_date")
	private String orderDate;

	@Column(name = "total_price")
	private double totalPrice;

	@Column(name = "status")
	@NotBlank(message = "is required")
	private String status;

	@Column(name = "modifieddate")
	@LastModifiedDate
	private Date modifiedDate;

	@Column(name = "modifiedby")
	@LastModifiedBy
	private String modifiedby;

	@OneToMany(mappedBy = "order")
	private List<ItemEntity> items = new ArrayList<ItemEntity>();

	public OrderEntity() {

	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public String getModifiedby() {
		return modifiedby;
	}

	public void setModifiedby(String modifiedby) {
		this.modifiedby = modifiedby;
	}

	public List<ItemEntity> getItems() {
		return items;
	}

	public void setItems(List<ItemEntity> items) {
		this.items = items;
	}

	@Override
	public String toString() {
		return "OrderEntity [id=" + id + ", userName=" + userName + ", address=" + address + ", phone=" + phone
				+ ", orderDate=" + orderDate + ", totalPrice=" + totalPrice + ", status=" + status + ", modifiedDate="
				+ modifiedDate + ", modifiedby=" + modifiedby + ", items=" + items + "]";
	}

}
