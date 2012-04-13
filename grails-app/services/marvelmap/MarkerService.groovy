package marvelmap

import org.springframework.transaction.annotation.Transactional


class MarkerService {

	//	@Transactional(readOnly = true)
	//	def getPOIWithinBounds(String NElat,String NElng,String SWlat,String SWlng){
	def getPOIWithinBounds(params){
		println("getPOIWithinBounds")
		println(params.NElat + " " + params.NElng + " " + params.SWlat + " " + params.SWlng);
		//	def poi = PointOfInterest.list();
		//def threePOI = PointOfInterest.findWhere(name : "test1");
		//println(threePOI)
		
		//return params;
	}
}
