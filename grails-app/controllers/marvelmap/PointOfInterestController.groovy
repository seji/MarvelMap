package marvelmap

class PointOfInterestController {

     def index = {
        //redirect(action: "showCreateMenu", params: params)
		render('Hello !!!!');
			
    }
	
	

	def poiDescription(){
	
	
	}
	def rateIncrease(){
	
	
	}
	def rateDecrease(){
	
	
	}
	def menu(){
	
		render(view: "menu")
	}
	def poiNew(){
	

		render(view: "poiNew")
	}
	def poiCreate(){

////////////////		

	def poiInstance = new PointOfInterest(params)
	poiInstance.properties = params
	return [poiInstance: poiInstance]
		
///////////////			
/*
def offerInstance = new Offer()
        offerInstance.properties = params
        return [offerInstance: offerInstance]
 */
			
				

	}
	def getPointOfInterest(){
	
	
	}

  
}
