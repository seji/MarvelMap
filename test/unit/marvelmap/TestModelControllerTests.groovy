package marvelmap



import org.junit.*
import grails.test.mixin.*

@TestFor(TestModelController)
@Mock(TestModel)
class TestModelControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/testModel/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.testModelInstanceList.size() == 0
        assert model.testModelInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.testModelInstance != null
    }

    void testSave() {
        controller.save()

        assert model.testModelInstance != null
        assert view == '/testModel/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/testModel/show/1'
        assert controller.flash.message != null
        assert TestModel.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/testModel/list'


        populateValidParams(params)
        def testModel = new TestModel(params)

        assert testModel.save() != null

        params.id = testModel.id

        def model = controller.show()

        assert model.testModelInstance == testModel
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/testModel/list'


        populateValidParams(params)
        def testModel = new TestModel(params)

        assert testModel.save() != null

        params.id = testModel.id

        def model = controller.edit()

        assert model.testModelInstance == testModel
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/testModel/list'

        response.reset()


        populateValidParams(params)
        def testModel = new TestModel(params)

        assert testModel.save() != null

        // test invalid parameters in update
        params.id = testModel.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/testModel/edit"
        assert model.testModelInstance != null

        testModel.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/testModel/show/$testModel.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        testModel.clearErrors()

        populateValidParams(params)
        params.id = testModel.id
        params.version = -1
        controller.update()

        assert view == "/testModel/edit"
        assert model.testModelInstance != null
        assert model.testModelInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/testModel/list'

        response.reset()

        populateValidParams(params)
        def testModel = new TestModel(params)

        assert testModel.save() != null
        assert TestModel.count() == 1

        params.id = testModel.id

        controller.delete()

        assert TestModel.count() == 0
        assert TestModel.get(testModel.id) == null
        assert response.redirectedUrl == '/testModel/list'
    }
}
