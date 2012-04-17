package marvelmap

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class PointOfInterestController {



	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	///////////////////////

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
		println(params);
	}


	def poiSaveConfirm() {
	}

	//////////////////////



	def list() {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[pointOfInterestInstanceList: PointOfInterest.list(params), pointOfInterestInstanceTotal: PointOfInterest.count()]
	}

	def create() {
		[pointOfInterestInstance: new PointOfInterest(params)]
		println(params);
	}

	def save() {

		def pointOfInterestInstance = new PointOfInterest(params)
		if (!pointOfInterestInstance.save(flush: true)) {
			render(view: "create", model: [pointOfInterestInstance: pointOfInterestInstance])
			return
		}

		//flash.message = message(code: 'default.created.message', args: [message(code: 'pointOfInterest.label', default: 'PointOfInterest'), pointOfInterestInstance.id])
		//redirect(action: "show", id: pointOfInterestInstance.id)
		redirect(action: "poiSaveConfirm")
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



/*	def getPOI(){

		def poi = markerService.getPOI()
		render poi as JSON
	}
*/
	def showAllPOI(){
		//[pointOfInterestInstance: new PointOfInterest(params)]
		render(view: "showAllPOI", model:[pointOfInterestInstanceList: PointOfInterest.list(params)])
	}
	
	def removeAllPOI(){
		println("Remove ALL POI");
	}
	
	//def markerService = new MarkerService();
	def showPOIinBounds(){
		println(params.SWlat +"  "+params.NElat)
		println(params.SWlng +"  "+params.NElng)
		//def BigDecimal a = params.SWlat;
		[pointOfInterestInstance: new PointOfInterest(params)]
		//def threePOI = PointOfInterest.findAllByRatingIsNotNull([sort:"rating", order:"desc", max:3])
		def c = PointOfInterest.createCriteria()
		def threePOI = c.list {
			
			gt("lat",1.0)
			//between('lat', params.SWlat, params.NElat) and {between('lng', params.SWlng, params.NElng)}
			
			//between('lat', 5.00000, 10.6)
			maxResults(3)
			order("rating", "desc")
			};
		
		
		println(threePOI.lat)
		println(threePOI)
		render(view: "showPOIinBounds", model:[threePOIlist: threePOI])
		
		
	}

}



