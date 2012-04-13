package marvelmap

import grails.converters.JSON

class PointOfInterest {
	//	String id
	String name
	String description
	Date dateAdded = new Date();	
	String lat
	String lng
	Long rating=1;

 //	static mapWith="mongo"
	
	//String toString(){"${name}"}
	
	public String toString() {
		 return "[name:" + name + ", description:" + description+ ", lat:" + lat + ", lng:" + lng + ", rating:" + rating+"]";

		 	}
	
	static constraints = {
		name();
		description();
	}}