package simplemailsend

import grails.web.servlet.mvc.GrailsParameterMap
import org.grails.web.json.JSONObject
import org.simplejavamail.email.Email
import org.simplejavamail.email.EmailBuilder
import org.simplejavamail.mailer.Mailer
import org.simplejavamail.mailer.MailerBuilder
import org.simplejavamail.mailer.config.TransportStrategy
import org.springframework.web.multipart.MultipartFile

import java.text.ParseException

class StudentController {

    def index() { }

    def sendMailAll(){
        String fromEmail = params.fromEmailId
        String password = params.frompassword
        String subject = params.subject
        String content = params.content
        MultipartFile pdfFile = params.pdffile
        MultipartFile generalFile = params.generalfile

        if(fromEmail!=null&&password!=null&&subject!=null&&content!=null){
            if(pdfFile!=null&&pdfFile.size>2&&generalFile!=null&&generalFile.size>2){

                //get all student from db
                ArrayList<Student> studentArrayList = Student.getAll()
                if(studentArrayList!=null){
                    byte[] pdfFileByte = pdfFile.getBytes()
                    byte[] generaFileByte = generalFile.getBytes()

                    //Send mail for each student
                    for (Student student:studentArrayList) {


                        Email email = EmailBuilder.startingBlank()
                                .from(fromEmail, fromEmail)
                                .to(student.name, student.email)
                                .withSubject(subject)
                                .withHTMLText(content)
                                .withAttachment(pdfFile.getOriginalFilename(), pdfFileByte, "application/pdf")
                                .withAttachment(generalFile.getOriginalFilename(), generaFileByte, "image/jpg")
                                .buildEmail();

                        Mailer mailer = MailerBuilder
                                .withSMTPServer("smtp.gmail.com", 25, fromEmail, password)
                                .withTransportStrategy(TransportStrategy.SMTP_TLS)
                                .buildMailer();

                        // perform connection test
                        //mailer.testConnection();

                        mailer.sendMail(email);
                        System.out.println("StudentController: SendMailAll: Sent to student id "+student.id+" : done")
                    }
                    //successfully sent
                    redirect(uri:"/?code=3")


                }else{
                    //no sudent in db
                    redirect(uri:"/?code=2")
                }

            }else {
                //files not attached
                redirect(uri:"/?code=1")
            }
        }else{
            //not email or passwords
            redirect(uri: "/?code=0")
        }
    }

    def sendMail(){
        String id = params.id
        if(id!=null&&id!=""){
            long stdId;
            try{
                stdId = Long.parseLong(id)
            }catch (ParseException p ){
                System.err.println("StudentController: sendMail: Parse exception")
                render(status: 400,text: "Invalid text sent")
            }

            Student student = Student.findById(stdId)
            if(student!=null){
                //start


                Email email = EmailBuilder.startingBlank()
                        .from("Exceed Test", "exceeditacademy18@gmail.com")
                        .to("andrew", "andrewcyclotron@gmail.com")
                        .withSubject("hey")
                        .withHTMLText("<img src='cid:wink1'><b>We should meet up!</b><img src='cid:wink2'><p><button>Hello</button></p>")
                        .withPlainText("Please view this email in a modern email client!")
                        .buildEmail();

                Mailer mailer = MailerBuilder
                        .withSMTPServer("smtp.gmail.com", 25, "exceeditacademy18@gmail.com", "exceed123")
                        .withTransportStrategy(TransportStrategy.SMTP_TLS)
                        .buildMailer();

                // perform connection test
                //mailer.testConnection();

                mailer.sendMail(email);

                System.out.println("Mail sent")
                //end
                render(status: 400,text: "Mail sent")
            }else{
                render(status: 404,text: "Student not found")
            }
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
