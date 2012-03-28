package marvelmap

class PointOfInterest {
	//	String id
	String name
	Date dateAdded = new Date();
	String description

	String toString(){"${name}"}

	static constraints = {
		name();
		description();
	}
}
