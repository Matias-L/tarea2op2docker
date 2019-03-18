public class Tarea {
    public static void main (String[] args) {
	int cantidad=0;
	if (args.length > 0) {
	    try {
		cantidad = Integer.parseInt(args[0]);
			for (int i=0; i<=cantidad; i++) {
		    	System.out.println(i);
			}
	    } catch (NumberFormatException e) {
		System.err.println("Argument" + args[0] + " must be an integer.");
		System.exit(1);
	    }//Fin catch
	}
	else{
		System.out.println("NO INGRESASTE PARAMETRO");
	}	
    }//Fin main
}//Fin Main