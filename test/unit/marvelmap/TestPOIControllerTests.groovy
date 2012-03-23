package marvelmap



import org.junit.*
import grails.test.mixin.*

@TestFor(TestPOIController)
@Mock(TestPOI)
class TestPOIControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/testPOI/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.testPOIInstanceList.size() == 0
        assert model.testPOIInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.testPOIInstance != null
    }

    void testSave() {
        controller.save()

        assert model.testPOIInstance != null
        assert view == '/testPOI/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/testPOI/show/1'
        assert controller.flash.message != null
        assert TestPOI.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/testPOI/list'


        populateValidParams(params)
        def testPOI = new TestPOI(params)

        assert testPOI.save() != null

        params.id = testPOI.id

        def model = controller.show()

        assert model.testPOIInstance == testPOI
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/testPOI/list'


        populateValidParams(params)
        def testPOI = new TestPOI(params)

        assert testPOI.save() != null

        params.id = testPOI.id

        def model = controller.edit()

        assert model.testPOIInstance == testPOI
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/testPOI/list'

        response.reset()


        populateValidParams(params)
        def testPOI = new TestPOI(params)

        assert testPOI.save() != null

        // test invalid parameters in update
        params.id = testPOI.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/testPOI/edit"
        assert model.testPOIInstance != null

        testPOI.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/testPOI/show/$testPOI.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        testPOI.clearErrors()

        populateValidParams(params)
        params.id = testPOI.id
        params.version = -1
        controller.update()

        assert view == "/testPOI/edit"
        assert model.testPOIInstance != null
        assert model.testPOIInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/testPOI/list'

        response.reset()

        populateValidParams(params)
        def testPOI = new TestPOI(params)

        assert testPOI.save() != null
        assert TestPOI.count() == 1

        params.id = testPOI.id

        controller.delete()

        assert TestPOI.count() == 0
        assert TestPOI.get(testPOI.id) == null
        assert response.redirectedUrl == '/testPOI/list'
    }
}
