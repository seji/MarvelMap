package marvelmap

import grails.converters.JSON

class PointOfInterest {
	//	String id
	String name
	String description
	Date dateAdded = new Date();	
	Double lat
	Double lng
	Integer rating = new Random().nextInt(99000000);
	String imageURL


 //	static mapWith="mongo"
	
	//String toString(){"${name}"}
	
	public String toString() {
		 return "[id:"+ id + ", name:" + name + ", description:" + description+ ", lat:" + lat + ", lng:" + lng + ", rating:" + rating+"]";
		 	}
	
	public Integer IncrementRating() {
		return rating = rating + 1;
		
		}
	
	public Integer DecrementRating() {
		return rating = rating - 1;
	
	}
	
	
	static constraints = {
		//lat( scale : 16)
		//lng( scale : 16)
		
		name()
		description()
		imageURL()
 
	}}