package marvelmap

import org.springframework.dao.DataIntegrityViolationException

class TestModelController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [testModelInstanceList: TestModel.list(params), testModelInstanceTotal: TestModel.count()]
    }

    def create() {
        [testModelInstance: new TestModel(params)]
    }

    def save() {
        def testModelInstance = new TestModel(params)
        if (!testModelInstance.save(flush: true)) {
            render(view: "create", model: [testModelInstance: testModelInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'testModel.label', default: 'TestModel'), testModelInstance.id])
        //redirect(action: "show", id: testModelInstance.id)
		redirect(action: "list", params: params)
    }

    def show() {
        def testModelInstance = TestModel.get(params.id)
        if (!testModelInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'testModel.label', default: 'TestModel'), params.id])
            redirect(action: "list")
            return
        }

        [testModelInstance: testModelInstance]
    }

    def edit() {
        def testModelInstance = TestModel.get(params.id)
        if (!testModelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'testModel.label', default: 'TestModel'), params.id])
            redirect(action: "list")
            return
        }

        [testModelInstance: testModelInstance]
    }

    def update() {
        def testModelInstance = TestModel.get(params.id)
        if (!testModelInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'testModel.label', default: 'TestModel'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (testModelInstance.version > version) {
                testModelInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'testModel.label', default: 'TestModel')] as Object[],
                          "Another user has updated this TestModel while you were editing")
                render(view: "edit", model: [testModelInstance: testModelInstance])
                return
            }
        }

        testModelInstance.properties = params

        if (!testModelInstance.save(flush: true)) {
            render(view: "edit", model: [testModelInstance: testModelInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'testModel.label', default: 'TestModel'), testModelInstance.id])
        redirect(action: "show", id: testModelInstance.id)
    }

    def delete() {
        def testModelInstance = TestModel.get(params.id)
        if (!testModelInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'testModel.label', default: 'TestModel'), params.id])
            redirect(action: "list")
            return
        }

        try {
            testModelInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'testModel.label', default: 'TestModel'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'testModel.label', default: 'TestModel'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
