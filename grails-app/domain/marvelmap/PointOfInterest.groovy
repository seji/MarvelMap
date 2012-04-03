package marvelmap

class PointOfInterest {
	//	String id
	String name
	String description
	Date dateAdded = new Date();	
	String lat
	String lng
	Long rating=1;

 //	static mapWith="mongo"
	
	String toString(){"${name}"}
	
	
	
	static constraints = {
		name();
		description();
	}
}
