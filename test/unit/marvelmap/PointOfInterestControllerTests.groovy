package marvelmap



import org.junit.*
import grails.test.mixin.*

@TestFor(PointOfInterestController)
@Mock(PointOfInterest)
class PointOfInterestControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/pointOfInterest/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.pointOfInterestInstanceList.size() == 0
        assert model.pointOfInterestInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.pointOfInterestInstance != null
    }

    void testSave() {
        controller.save()

        assert model.pointOfInterestInstance != null
        assert view == '/pointOfInterest/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/pointOfInterest/show/1'
        assert controller.flash.message != null
        assert PointOfInterest.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/pointOfInterest/list'


        populateValidParams(params)
        def pointOfInterest = new PointOfInterest(params)

        assert pointOfInterest.save() != null

        params.id = pointOfInterest.id

        def model = controller.show()

        assert model.pointOfInterestInstance == pointOfInterest
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/pointOfInterest/list'


        populateValidParams(params)
        def pointOfInterest = new PointOfInterest(params)

        assert pointOfInterest.save() != null

        params.id = pointOfInterest.id

        def model = controller.edit()

        assert model.pointOfInterestInstance == pointOfInterest
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/pointOfInterest/list'

        response.reset()


        populateValidParams(params)
        def pointOfInterest = new PointOfInterest(params)

        assert pointOfInterest.save() != null

        // test invalid parameters in update
        params.id = pointOfInterest.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/pointOfInterest/edit"
        assert model.pointOfInterestInstance != null

        pointOfInterest.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/pointOfInterest/show/$pointOfInterest.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        pointOfInterest.clearErrors()

        populateValidParams(params)
        params.id = pointOfInterest.id
        params.version = -1
        controller.update()

        assert view == "/pointOfInterest/edit"
        assert model.pointOfInterestInstance != null
        assert model.pointOfInterestInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/pointOfInterest/list'

        response.reset()

        populateValidParams(params)
        def pointOfInterest = new PointOfInterest(params)

        assert pointOfInterest.save() != null
        assert PointOfInterest.count() == 1

        params.id = pointOfInterest.id

        controller.delete()

        assert PointOfInterest.count() == 0
        assert PointOfInterest.get(pointOfInterest.id) == null
        assert response.redirectedUrl == '/pointOfInterest/list'
    }
}
