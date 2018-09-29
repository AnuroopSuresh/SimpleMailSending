package simplemailsend

import grails.gorm.transactions.Transactional
import grails.web.servlet.mvc.GrailsParameterMap
import org.grails.web.json.JSONObject
import org.simplejavamail.email.Email
import org.simplejavamail.email.EmailBuilder
import org.simplejavamail.mailer.Mailer
import org.simplejavamail.mailer.MailerBuilder
import org.simplejavamail.mailer.config.TransportStrategy
import org.springframework.web.multipart.MultipartFile

import java.text.ParseException

@Transactional
class StudentController {

    def index() {}

    def sendMailAll() {
        String fromEmail = params.fromEmailId
        String password = params.frompassword
        String subject = params.subject
        String content = params.content
        MultipartFile pdfFile = params.pdffile
        MultipartFile generalFile = params.generalfile
        MultipartFile image2 = params.image2

        /*if(fromEmail!=null&&password!=null&&subject!=null&&content!=null){*/
        /*if(pdfFile!=null&&pdfFile.size>2&&generalFile!=null&&generalFile.size>2){*/

        //get all student from db
        ArrayList<Student> studentArrayList = Student.getAll()
        if (studentArrayList != null) {
            /*byte[] pdfFileByte = pdfFile.getBytes()
            byte[] generaFileByte = generalFile.getBytes()
            byte[] image2Byte = image2.getBytes()*/
            int errorCode =3;
            //Send mail for each student
            for (Student student : studentArrayList) {

                try {

                    Email email = EmailBuilder.startingBlank()
                            .from(fromEmail, fromEmail)
                            .to(student.name, student.email)
                            .withSubject(subject)
                            .withHTMLText(content.replace("@name@",student.name+",<br/>"))
                    /*.withAttachment(pdfFile.getOriginalFilename(), pdfFileByte, "application/pdf")
                    .withAttachment(generalFile.getOriginalFilename(), generaFileByte, "image/jpg")
                    .withAttachment(image2.getOriginalFilename(), image2Byte, "image/jpg")*/
                            .buildEmail();

                    /*Mailer mailer = MailerBuilder
                            .withSMTPServer("smtp.gmail.com", 25, fromEmail, password)
                            .withTransportStrategy(TransportStrategy.SMTP_TLS)
                            .buildMailer();*/
                    Mailer mailer = MailerBuilder
                            .withSMTPServer("smtpout.asia.secureserver.net", 25, fromEmail, password)
                            .withTransportStrategy(TransportStrategy.SMTP)
                            .buildMailer();

                    // perform connection test
                    //mailer.testConnection();

                    mailer.sendMail(email);
                    System.out.println("StudentController: SendMailAll: Sent to student id " + student.id + " : done")
                } catch (Exception e) {
                    errorCode=5
                    System.out.println("StudentController: SendMailAll: Error in sending:  " + e.printStackTrace())
                }
            }
            //successfully sent
            redirect(uri: "/?code="+errorCode)


        } else {
            //no sudent in db
            redirect(uri: "/?code=2")
        }
    }

    //Student CRUD Operation

    def addStudent() {
        String name = params.name
        String phoneNumber = params.phonenumber
        String email = params.email
        String address = params.address
        String qualification = params.qualification

        if (name != null && name != "" && phoneNumber != null && phoneNumber != "" && email != null && email != "") {
            Student addStudent = new Student()
            addStudent.setName(name)
            addStudent.setEmail(email)
            addStudent.setPhoneNumber(phoneNumber)
            addStudent.setPlace(address)
            addStudent.setQualification(qualification)
            addStudent.save()
            redirect(uri: "/?code=10")
        } else {
            redirect(uri: "/?code=11")
        }
    }

    def updateStudent() {
        String id = params.id
        String name = params.name
        String phoneNumber = params.phonenumber
        String email = params.email
        String address = params.address
        String qualification = params.qualification

        if (id != null && id != "" && name != null && name != "" && phoneNumber != null && phoneNumber != "" && email != null && email != "") {
            long stdId
            try {
                stdId = Long.parseLong(id)
            } catch (ParseException p) {
                System.err.println("StudentController: updateStudent: Incorrect std Id:" + p.message)
                redirect(uri: "/?code=20")
            }

            Student updateStudent = Student.findById(stdId)
            if (updateStudent != null) {
                updateStudent.setName(name)
                updateStudent.setPhoneNumber(phoneNumber)
                updateStudent.setEmail(email)
                updateStudent.setQualification(qualification)
                updateStudent.setPlace(address)
                updateStudent.save()
                //update successful
                redirect(uri: "/?code=22")
            } else {
                //no student with id found
                redirect(uri: "/?code=21")
            }
        } else {
            //fields missing
            redirect(uri: "/?code=11")
        }
    }

    def deleteStudent() {
        String id = params.id
        if (id != null && id != "") {
            long stdId
            try {
                stdId = Long.parseLong(id)
            } catch (ParseException p) {
                System.err.println("StudentController: updateStudent: Incorrect std Id:" + p.message)
                redirect(uri: "/?code=20")
            }

            Student deleteStudent = Student.findById(stdId)
            if (deleteStudent != null) {
                deleteStudent.delete()
                redirect(uri: "/?code=31")
            }
        } else {
            redirect(uri: "/?code=30")
        }
    }

    def getStudentTable() {
        GrailsParameterMap parameterMap = getParams()
        String searchTerm = parameterMap.get("search[value]")
        String orderColumnId = parameterMap.get("order[0][column]")
        String orderDir = parameterMap.get("order[0][dir]")


        String orderColumn = "id"
        switch (orderColumnId) {
            case '0':
                orderColumn = "id"
                break;
            case '1':
                orderColumn = "name"
                break;
            case '2':
                orderColumn = "phoneNumber"
                break;
            case '3':
                orderColumn = "email"
                break;
            case '4':
                orderColumn = "place"
                break;
            case '5':
                orderColumn = "qualification"
                break;

        }

        def studentList
        def studentCriteria = Student.createCriteria()
        //for searching
        if (searchTerm != "") {
            studentList = studentCriteria.list(max: params.length, offset: params.start) {
                or {
                    ilike('name', "%" + searchTerm + "%")
                    ilike('phoneNumber', "%" + searchTerm + "%")
                    ilike('email', "%" + searchTerm + "%")
                    ilike('place', "%" + searchTerm + "%")
                    ilike('qualification', "%" + searchTerm + "%")
                }
                order(orderColumn, orderDir)
            }
        } else {
            studentList = studentCriteria.list(max: params.length, offset: params.start) {
                order(orderColumn, orderDir)
            }
        }

        def recordsTotal = studentList.totalCount
        JSONObject jsonObject = new JSONObject()
        jsonObject.put("draw", params.draw)
        jsonObject.put("recordsTotal", recordsTotal)
        jsonObject.put("recordsFiltered", recordsTotal)
        jsonObject.put("data", studentList)
        respond jsonObject, formats: ['json']
    }
}
