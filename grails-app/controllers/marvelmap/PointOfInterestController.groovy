package marvelmap
class PointOfInterestController {

	def index = {
		//redirect(action: "showCreateMenu", params: params)
		render('index: Hello !!!!');
	}

	def poiDescription(){
	}

	def rateIncrease(){
	}

	def rateDecrease(){
	}

	def menu(){
		println(params);
	}

	def poiCreate(){
		println(params);
	}
	/////////////////////////////////////////////////////////////////////////
	def poiNew() {
		println(params);
		[pointOfInterestInstance: new PointOfInterest(params)]
	}

	def create() {
		println(params);
		[pointOfInterestInstance: new PointOfInterest(params)]
	}

	def save() {
		def pointOfInterestInstance = new PointOfInterest(params)
		if (!pointOfInterestInstance.save(flush: true)) {
			render(view: "create", model: [pointOfInterestInstance: pointOfInterestInstance])
			println("1");
			println(params);
			return
		}
//		flash.message = message(code: 'default.created.message', args: [message(code: 'testModel.label', default: 'TestModel'),pointOfInterestInstance.id])
		println("2");
		println(params);
		//redirect(action: "show", id: pointOfInterestInstance.id)
		redirect(action: "list", params: params)
	}

	def list() {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[pointOfInterestInstanceList: PointOfInterest.list(params), pointOfInterestInstanceTotal: PointOfInterest.count()]
		println(params);
	}

	def getPointOfInterest(){
		println(params);
	}
}
