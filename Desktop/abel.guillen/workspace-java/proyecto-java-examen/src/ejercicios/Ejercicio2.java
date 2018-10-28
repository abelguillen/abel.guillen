package ejercicios;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import ejercicios.Persona;

/**
 * A. Crear una clase Persona con los siguientes campos
 * (con sus respectivos getters, setters y constructor)
 * 
 * TipoDocumento - enum (dni/libretacivica) 
 * NroDocumento - Integer
 * Nombre - String
 * Apellido - String
 * FechaNacimiento - Date
 * 
 * B. En el método main de la clase "Ejercicio2" crear una nueva instancia
 * de la clase persona y settearle valores reales con tus datos
 * 
 * 
 * C. En el método main de la clase "Ejercicio 2" imprimir los valores en 
 * consola 
 * (crear método main e imprimir valores) 
 *  
 * @author examen
 *
 */
public class Ejercicio2 {

	/**
	 * 
	 */
	public Ejercicio2() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param args
	 * @throws ParseException 
	 */
	public static void main(String[] args) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String dateInString = "1994-06-06";
		Date fechaNacimiento = sdf.parse(dateInString);
		Persona persona = new Persona("DNI", 38215992, "Abel Alejandro", "Guillen", fechaNacimiento);
		
		System.out.println("Tipo Documento: " + persona.getTipoDocumento());
		System.out.println("Nro. Documento: " + persona.getNroDocumento());
		System.out.println("Nombre: " + persona.getNombre());
		System.out.println("Apellido: " + persona.getApellido());
		System.out.println("Fecha de Nacimiento: " + persona.getFechaNacimiento());
	}

}
