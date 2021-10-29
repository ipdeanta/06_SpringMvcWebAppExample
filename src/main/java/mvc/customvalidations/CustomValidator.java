package main.java.mvc.customvalidations;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class CustomValidator implements ConstraintValidator<CustomAnnotation, String> {
	
	private String defaultValue;
	
	@Override
    public void initialize(CustomAnnotation customaAnnotation) {
		defaultValue = customaAnnotation.value();
    }
	
	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		// value 	tiene el valor del campo de formulario
		// context 	contexto en el que se evalua
		boolean validationResult = false;
		if (value != null && value.equals(defaultValue)) {
			validationResult = true;
		}
		return validationResult;
	}

}
