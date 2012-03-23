package marvelmap

import org.springframework.dao.DataIntegrityViolationException

class TestPOIController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [testPOIInstanceList: TestPOI.list(params), testPOIInstanceTotal: TestPOI.count()]
    }

    def create() {
        [testPOIInstance: new TestPOI(params)]
    }

    def save() {
        def testPOIInstance = new TestPOI(params)
        if (!testPOIInstance.save(flush: true)) {
            render(view: "create", model: [testPOIInstance: testPOIInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'testPOI.label', default: 'TestPOI'), testPOIInstance.id])
        redirect(action: "show", id: testPOIInstance.id)
    }

    def show() {
        def testPOIInstance = TestPOI.get(params.id)
        if (!testPOIInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'testPOI.label', default: 'TestPOI'), params.id])
            redirect(action: "list")
            return
        }

        [testPOIInstance: testPOIInstance]
    }

    def edit() {
        def testPOIInstance = TestPOI.get(params.id)
        if (!testPOIInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'testPOI.label', default: 'TestPOI'), params.id])
            redirect(action: "list")
            return
        }

        [testPOIInstance: testPOIInstance]
    }

    def update() {
        def testPOIInstance = TestPOI.get(params.id)
        if (!testPOIInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'testPOI.label', default: 'TestPOI'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (testPOIInstance.version > version) {
                testPOIInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'testPOI.label', default: 'TestPOI')] as Object[],
                          "Another user has updated this TestPOI while you were editing")
                render(view: "edit", model: [testPOIInstance: testPOIInstance])
                return
            }
        }

        testPOIInstance.properties = params

        if (!testPOIInstance.save(flush: true)) {
            render(view: "edit", model: [testPOIInstance: testPOIInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'testPOI.label', default: 'TestPOI'), testPOIInstance.id])
        redirect(action: "show", id: testPOIInstance.id)
    }

    def delete() {
        def testPOIInstance = TestPOI.get(params.id)
        if (!testPOIInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'testPOI.label', default: 'TestPOI'), params.id])
            redirect(action: "list")
            return
        }

        try {
            testPOIInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'testPOI.label', default: 'TestPOI'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'testPOI.label', default: 'TestPOI'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
