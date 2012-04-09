package marvelmap

class MarkerService {

		def getPOI(){
		//def poi = PointOfInterest.get(1);
		def poi = PointOfInterest.list();
		//poi = PointOfInterest.find();

		return poi;
		}
}
