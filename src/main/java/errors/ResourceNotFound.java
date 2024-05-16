package errors;

public class ResourceNotFound extends Exception {
	
	private static final long serialVersionUID = 1L;

	public ResourceNotFound(String message) {
		
		super("Resource not found error " + message);
		
	}

}
