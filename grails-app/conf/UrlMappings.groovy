class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

//		"/"(view:"/index")
		"/"(view:"/map4")
//		"/test"(view:"/map3")
		"500"(view:'/error')
		
	}
}
