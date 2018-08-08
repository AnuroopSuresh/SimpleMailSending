package simplemailsend

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "student",action: "index")
        "500"(view:'/error')
        "404"(view:'/notFound')

        "/student/add"(controller: "student",action: "addStudent")
        "/student/update"(controller: "student",action: "updateStudent")
        "/student/delete"(controller: "student",action: "deleteStudent")
        "/student/getstudents"(controller: "student",action: "getStudentTable")
        "/student/sendmail"(controller: "student",action: "sendMail")
        "/student/sendmailall"(controller: "student",action: "sendMailAll")
    }
}
