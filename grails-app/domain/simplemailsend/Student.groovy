package simplemailsend

class Student {

    String name
    String phoneNumber
    String email
    String place
    String qualification

    Date dateCreated
    Date lastUpdated

    static constraints = {
        phoneNumber nullable: true
        place nullable: true
        qualification nullable: true
    }
}
