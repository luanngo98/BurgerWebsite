package com.burger.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

@Entity(name = "burger")
@Table(name = "burger")
public class BurgerEntity extends BaseEntity{

//	@Id
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	private Long id;

	@Column(name = "name")
	@NotBlank(message = "is required")
	private String name;

	@Column(name = "thumbnail_name")
	private String thumbnailName;

	@Column(name = "thumnail_data")
	private String thumbnailData;

	@Column(name = "ingredient", columnDefinition = "TEXT")
	@NotBlank(message = "is required")
	private String ingredient;

	@Column(name = "price")
	private double price;

	public BurgerEntity() {

	}

//	public Long getId() {
//		return id;
//	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getThumbnailName() {
		return thumbnailName;
	}

	public void setThumbnailName(String thumbnailName) {
		this.thumbnailName = thumbnailName;
	}

	public String getThumbnailData() {
		return thumbnailData;
	}

	public void setThumbnailData(String thumbnailData) {
		this.thumbnailData = thumbnailData;
	}

	public String getIngredient() {
		return ingredient;
	}

	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

//	@Override
//	public String toString() {
//		return "BurgerEntity [id=" + id + ", name=" + name + ", thumbnailName=" + thumbnailName + ", thumbnailData="
//				+ thumbnailData + ", ingredient=" + ingredient + ", price=" + price + "]";
//	}

}
