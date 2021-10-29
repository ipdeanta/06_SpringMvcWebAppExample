package main.java.mvc.customvalidations;

import java.lang.annotation.Target;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import javax.validation.Constraint;
import javax.validation.Payload;

//@Documented // no vamos a documentar la anotación
@Constraint(validatedBy = CustomValidator.class)  // clase que realiza la validación
@Target( { ElementType.METHOD, ElementType.FIELD }) // va a aplica a métodos y a campos
@Retention(RetentionPolicy.RUNTIME) // se va a aplicar en tiempo de ejecución
public @interface CustomAnnotation {
	// Valor por defecto
	String value() default "DefaultValue";
	
	// Mensaje de error por defecto
	String message() default "Invalid custom validation";
    
	// Grupos: para validar campos de formulario por grupos (en vez del formulario entero)
	Class<?>[] groups() default {};
    
	// Payloads: datos que pueden ser actualizados o almacenados (principalmente metadatos)
	Class<? extends Payload>[] payload() default {};
	
}
