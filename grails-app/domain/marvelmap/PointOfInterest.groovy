package marvelmap

import grails.converters.JSON

class PointOfInterest {
	//	String id
	String name
	String description
	Date dateAdded = new Date();	
	BigDecimal lat
	BigDecimal lng
	Integer rating = new Random().nextInt(100);


 //	static mapWith="mongo"
	
	//String toString(){"${name}"}
	
	public String toString() {
		 return "[id:"+ id + ", name:" + name + ", description:" + description+ ", lat:" + lat + ", lng:" + lng + ", rating:" + rating+"]";

		 	}
	
	static constraints = {
		lat( scale : 16)
		lng( scale : 16)
		name()
		description()
 
	}}