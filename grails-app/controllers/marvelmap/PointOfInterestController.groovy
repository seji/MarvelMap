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
	
		render("poiNew")
//		render(view: "menu")
	}
	def poiCreate(){
	
	
	}
	def getPointOfInterest(){
	
	
	}

  
}
