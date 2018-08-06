package simplemailsend

import grails.converters.JSON

class BootStrap {

    def init = { servletContext ->

        JSON.registerObjectMarshaller(Student){
            def returnArray=[:]
            returnArray['id'] = it.id
            returnArray['name'] = it.name
            returnArray['phoneNumber'] = it.phoneNumber
            returnArray['email'] = it.email
            returnArray['place'] = it.place
            returnArray['qualification'] = it.qualification
            returnArray['dateCreated'] = it.dateCreated
            returnArray['lastUpdated'] = it.lastUpdated
            return returnArray
        }
    }
    def destroy = {
    }
}
