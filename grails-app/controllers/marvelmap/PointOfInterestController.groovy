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
		def poiInstance = new PointOfInterest(params)poiInstance.properties = params
		return [poiInstance: poiInstance]
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
		println(params);
		def pointOfInterestInstance = new PointOfInterest(params)
		if (!pointOfInterestInstance.save(flush: true)) {
			render(view: "create", model: [pointOfInterestInstance: pointOfInterestInstance])
			return
		}
		flash.message = message(code: 'default.created.message', args: [
			message(code: 'testModel.label', default: 'TestModel'),
			pointOfInterestInstance.id
		])
		//redirect(action: "show", id: pointOfInterestInstance.id)
		redirect(action: "list", params: params)
	}

	def list() {
		println(params);
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[pointOfInterestInstanceList: PointOfInterest.list(params), pointOfInterestlInstanceTotal: PointOfInterest.count()]
	}

	def getPointOfInterest(){
		println(params);
	}
}
