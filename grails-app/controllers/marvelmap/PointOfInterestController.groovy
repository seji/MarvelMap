package marvelmap

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class PointOfInterestController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def poiDescription(){
	}

	def rateIncrease(){
	}

	def rateDecrease(){
	}

	def menu(){
	}

	def poiCreate(){
	}

	def getPointOfInterest(){
	}

	def poiNew() {
		[pointOfInterestInstance: new PointOfInterest(params)]
		//println(params);
	}

	def poiSaveConfirm() {
	}

	def list() {
		params.max = Math.min(params.max ? params.int('max') : 5, 100)
		[pointOfInterestInstanceList: PointOfInterest.list(params), pointOfInterestInstanceTotal: PointOfInterest.count()]
	}

	def create() {
		[pointOfInterestInstance: new PointOfInterest(params)]
		//println(params);
	}

	def save() {

		def pointOfInterestInstance = new PointOfInterest(params)
		if (!pointOfInterestInstance.save(flush: true)) {
			render(view: "create", model: [pointOfInterestInstance: pointOfInterestInstance])
			return
		}

		//flash.message = message(code: 'default.created.message', args: [message(code: 'pointOfInterest.label', default: 'PointOfInterest'), pointOfInterestInstance.id])
		//redirect(action: "show", id: pointOfInterestInstance.id)
		//redirect(action: "poiSaveConfirm")
		render(view: "poiSaveConfirm", model:[poi : pointOfInterestInstance])
		println(params);

	}

	def show() {
		def pointOfInterestInstance = PointOfInterest.get(params.id)
		if (!pointOfInterestInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code:'pointOfInterest.label', default: 'PointOfInterest'),
				params.id
			])
			redirect(action: "list")
			return
		}

		[pointOfInterestInstance: pointOfInterestInstance]
	}

	def edit() {
		def pointOfInterestInstance = PointOfInterest.get(params.id)
		if (!pointOfInterestInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'pointOfInterest.label', default: 'PointOfInterest'),
				params.id
			])
			redirect(action: "list")
			return
		}

		[pointOfInterestInstance: pointOfInterestInstance]
	}

	def update() {

		def pointOfInterestInstance = PointOfInterest.get(params.id)
		if (!pointOfInterestInstance) {
			println("if1")
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'pointOfInterest.label', default: 'PointOfInterest'),
				params.id
			])
			redirect(action: "list")
			return
		}

		if (params.version) {
			def version = params.version.toLong()
			if (pointOfInterestInstance.version > version) {
				println("if2")
				pointOfInterestInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'pointOfInterest.label', default: 'PointOfInterest')]
						as Object[],
						"Another user has updated this PointOfInterest while you were editing")
				render(view: "edit", model: [pointOfInterestInstance: pointOfInterestInstance])
				return
			}
		}

		pointOfInterestInstance.properties = params

		if (!pointOfInterestInstance.save(flush: true)) {
			println("if3")
			render(view: "edit", model: [pointOfInterestInstance: pointOfInterestInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'pointOfInterest.label', default: 'PointOfInterest'),
			pointOfInterestInstance.id
		])
		redirect(action: "show", id: pointOfInterestInstance.id)
	}

	def delete() {
		def pointOfInterestInstance = PointOfInterest.get(params.id)
		if (!pointOfInterestInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'pointOfInterest.label', default: 'PointOfInterest'),
				params.id
			])
			redirect(action: "list")
			return
		}

		try {
			pointOfInterestInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'pointOfInterest.label', default: 'PointOfInterest'),
				params.id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'pointOfInterest.label', default: 'PointOfInterest'),
				params.id
			])
			redirect(action: "show", id: params.id)
		}
	}

	def showAllPOI(){
		//[pointOfInterestInstance: new PointOfInterest(params)]
		render(view: "showAllPOI", model:[pointOfInterestInstanceList: PointOfInterest.list(params)])
	}


	def updateRating(){
		def pointOfInterestInstance = PointOfInterest.get(params.id)
		pointOfInterestInstance.properties = params

		if (params.inc == 'true'){
			pointOfInterestInstance.IncrementRating();
		}
		else {
			pointOfInterestInstance.DecrementRating();
		}
		if (!pointOfInterestInstance.save(flush: true)) {
			render("error!")
			return
		}
		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'pointOfInterest.label', default: 'PointOfInterest'),
			pointOfInterestInstance.id
		])
		render(view: "updateRating", model:[pois : pointOfInterestInstance])
	}


	def showInfoWindow(){
		//println("showInfoWindow");
		//def poiInfo = PointOfInterest.findAllById(params.id);
		def poiInfo = PointOfInterest.findById(params.id);
		//println(poiInfo);
		render(view: "showInfoWindow", model:[poiInfoList: poiInfo])

	}

	//def markerService = new MarkerService();
	def showPOIinBounds(){
		def poiCount = 3; //how many POIs we want to show
		//println(params)
		//convert string representation of bounds latlng back to Double
		Double dSWlat = params.SWlat.toDouble();
		Double dNElat = params.NElat.toDouble();
		Double dSWlng = params.SWlng.toDouble();
		Double dNElng = params.NElng.toDouble();

		if (dSWlng > dNElng)
		{
			//println('edge is on the screen');
			def c = PointOfInterest.createCriteria()
			def threePOI = c.list {
				between('lat', dSWlat, dNElat)
				or {
					between('lng', dSWlng, 180) 
					between('lng', -180, dNElng)
					}
				maxResults(poiCount)
				order("rating", "desc")
			};
			//println(threePOI)
			render(view: "showPOIinBounds", model:[threePOIlist: threePOI])
		}
		else
		{
			def c = PointOfInterest.createCriteria()
			def threePOI = c.list {
			between('lat', dSWlat, dNElat)
			between('lng', dSWlng, dNElng)
			maxResults(poiCount)
			order("rating", "desc")
		};
		//println(threePOI)
		render(view: "showPOIinBounds", model:[threePOIlist: threePOI])
		}
	}
	def CSEtest(){}
}



