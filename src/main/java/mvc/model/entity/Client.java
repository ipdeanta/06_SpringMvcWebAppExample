package main.java.mvc.model.entity;

import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import main.java.mvc.customvalidations.CustomAnnotation;

public class Client {
	@Min(value=1)
	private int id;
	@NotNull
	@Size(min=2, message="Campo requerido")
	private String name;
	private String surname;
	@NotEmpty(message="Campo requerido")
	@Email(message="Formato incorrecto")
	private String email;
	private String option;
	private String personType;
	private boolean authorizedAdvertising;
	@CustomAnnotation
	private String customValidationField;
	
	public Client() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public String getPersonType() {
		return personType;
	}

	public void setPersonType(String personType) {
		this.personType = personType;
	}

	public boolean isAuthorizedAdvertising() {
		return authorizedAdvertising;
	}

	public void setAuthorizedAdvertising(boolean authorizedAdvertising) {
		this.authorizedAdvertising = authorizedAdvertising;
	}

	public String getCustomValidationField() {
		return customValidationField;
	}

	public void setCustomValidationField(String customValidationField) {
		this.customValidationField = customValidationField;
	}
	
	
}
