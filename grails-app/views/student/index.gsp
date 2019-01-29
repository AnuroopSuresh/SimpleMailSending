<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Simple Email Send</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta content="This page contains login information" name="description"/>
    <meta content="Login" name="Capulus Tech"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>

    <!-- App favicon -->
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}">

    <!-- DataTables -->
    <asset:stylesheet src="themeplugins/datatables/dataTables.bootstrap4.min.css"/>
    <asset:stylesheet src="themeplugins/datatables/buttons.bootstrap4.min.css"/>
    <!-- Responsive datatable examples -->
    <asset:stylesheet src="themeplugins/datatables/responsive.bootstrap4.min.css"/>
    <!--- Select 2 -->
    <asset:stylesheet src="themeplugins/select2/css/select2.min.css"/>
    <!-- Sweet Alert css -->
    <asset:stylesheet src="themeplugins/sweet-alert/sweetalert2.min.css"/>

    <!-- App css -->
    <asset:stylesheet src="themeassets/css/bootstrap.min.css"/>
    <asset:stylesheet src="themeassets/css/icons.css"/>
    <asset:stylesheet src="themeassets/css/metismenu.min.css"/>
    <asset:stylesheet src="themeassets/css/style.css"/>

    <asset:javascript src="themeassets/js/modernizr.min.js"/>

</head>

<body>
<!-- Begin page -->
<div id="wrapper">

    <g:include view="leftSidebar.gsp"/>

    <!-- ============================================================== -->
    <!-- Start right Content here -->
    <!-- ============================================================== -->

    <div class="content-page">

        <!-- Top Bar start -->
        <g:include view="topBar.gsp"/>

        <ul class="list-inline menu-left mb-0">
            <li>
                <div class="page-title-box">
                    <h4 class="page-title">Student Detailst</h4>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active">Student Dashboard</li>
                    </ol>
                </div>
            </li>
        </ul>

    </nav>

    </div>
    <!--Top bar end .. this ending nav and </div> tag is required by the topBar.gsp as it is not closed there -->
    <!-- Start Page content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card-box table-responsive">
                        <p class="text-muted font-14 m-b-30 bold">
                            Gmail must be signed in the local browser for it work
                        </p>

                        <form class="form-horizontal" action="student/sendmailall" enctype="multipart/form-data"
                              method="post" role="form" id="sendmail">

                            <div class="form-group row">
                                <label for="fromEmailId" class="col-4 col-form-label">From email<span
                                        class="text-danger">*</span></label>

                                <div class="col-7">
                                    <input type="email" required parsley-trigger="change" class="form-control"
                                           id="fromEmailId" placeholder="From Email" name="fromEmailId"
                                           value="exceed.coaching.academy@gmail.com">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="frompassword" class="col-4 col-form-label">Password<span
                                        class="text-danger">*</span></label>

                                <div class="col-7">
                                    <input type="password" required parsley-trigger="change" class="form-control"
                                           id="frompassword" placeholder="Password" name="frompassword"
                                           value="exceed123$">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="subject" class="col-4 col-form-label">Subject<span
                                        class="text-danger">*</span></label>

                                <div class="col-7">
                                    <input type="text" required parsley-trigger="change" class="form-control"
                                           id="subject" placeholder="Subject" name="subject" value="test">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="content" class="col-4 col-form-label">Content<span
                                        class="text-danger">*</span></label>

                                <div class="col-7">
                                    <textarea class="form-control" rows="4" cols="50" id="content" name="content"
                                              placeholder="Content to be sent" required>Hello world</textarea>
                                </div>
                            </div>

                           <!--<div class="form-group row">
                                <label for="pdffile" class="col-4 col-form-label">PDF File<span
                                        class="text-danger">*</span></label>

                                <div class="col-7">
                                    <input type="file" class="filestyle" data-btnClass="btn-primary" id="pdffile"
                                           name="pdffile"
                                           accept="application/pdf" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="pdffile" class="col-4 col-form-label">PDF File<span
                                        class="text-danger">*</span></label>

                                <div class="col-7">
                                    <input type="file" class="filestyle" data-btnClass="btn-primary" id="pdffile1"
                                           name="pdffile1"
                                           accept="application/pdf" required>
                                </div>
                            </div>-->

                            %{--    <div class="form-group row">
                                    <label for="generalfile" class="col-4 col-form-label">General File<span
                                            class="text-danger">*</span></label>

                                    <div class="col-7">
                                        <input type="file" class="filestyle" data-btnClass="btn-primary" id="generalfile"
                                               name="generalfile"
                                               required>
                                    </div>
                                </div>--}%
                                <div class="form-group row">
                                    <label for="image2" class="col-4 col-form-label">General File<span
                                            class="text-danger">*</span></label>

                                    <div class="col-7">
                                        <input type="file" class="filestyle" data-btnClass="btn-primary" id="image2"
                                               name="image2"
                                               required>
                                    </div>
                                </div>

                            <button type="reset"
                                    class="btn w-lg btn-rounded btn-danger waves-effect waves-light">Reset</button>
                            <button class="btn w-lg btn-rounded btn-custom waves-effect waves-light"
                                    type="submit">Submit</button>

                        </form>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="card-box table-responsive">
                        <h4 class="m-t-0 header-title">Responsive example</h4>

                        <div class="row" style="padding-bottom: 2%">
                            <div class="col-7">

                                <button type="button" class="btn btn-custom waves-effect w-md mr-2 mb-2"
                                        data-toggle="modal" data-target="#addStudentModal" id="addStudentBtn">
                                    Add Student
                                </button>
                                %{--<button type="button" class="btn btn-custom waves-effect w-md mr-2 mb-2"
                                        data-toggle="modal" data-target="#addStudentModal" id="sendMailBtn"
                                        onclick="sendMail()">
                                    Send Mail
                                </button>--}%

                            </div>
                        </div>

                        <table id="student-datatable"
                               class="table table-bordered table-bordered dt-responsive nowrap" cellspacing="0"
                               width="100%">
                            <thead>
                            <tr>
                                <th>Id</th>
                                <th>Name</th>
                                <th>Phone Number</th>
                                <th>Email</th>
                                <th>Place</th>
                                <th>Qualification</th>
                                <th>Action</th>
                            </tr>
                            </thead>

                        </table>
                    </div>
                </div>
            </div> <!-- end row -->

        </div>
    </div>

    <g:include view="footer.gsp"/>

</div>
<!-- ============================================================== -->
<!-- End Right content here -->
<!-- ============================================================== -->
</div>
<!-- END wrapper -->

<!-- The bootstrap 4 addStudent Modal -->
<div class="modal fade" id="addStudentModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header custom-modal-headerBg">
                <h4 class="modal-title" id="addStudentModalTitle">Add Student</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <form class="form-horizontal" action="student/add" enctype="multipart/form-data"
                  method="post" role="form" id="addStudentForm">
                <div class="modal-body">

                    <div class="form-group row">
                        <label for="name" class="col-4 col-form-label">Name<span class="text-danger">*</span></label>

                        <div class="col-7">
                            <input type="text" required parsley-trigger="change" class="form-control"
                                   id="name" placeholder="name" name="name">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="email" class="col-4 col-form-label">Email<span
                                class="text-danger">*</span>
                        </label>

                        <div class="col-7">
                            <input type="email" required parsley-trigger="change" class="form-control"
                                   id="email" placeholder="Email" name="email">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="phonenumber" class="col-4 col-form-label">Phone Number<span
                                class="text-danger">*</span></label>

                        <div class="col-7">
                            <input type="text" data-parsley-type="number" required class="form-control"
                                   id="phonenumber" placeholder="Phdumma
                                   one number" name="phonenumber">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="qualification" class="col-4 col-form-label">Qualification</label>

                        <div class="col-7">
                            <input type="text" class="form-control"
                                   id="qualification" placeholder="Qualification" name="qualification">
                        </div>
                    </div>


                    <div class="form-group row">
                        <label for="address" class="col-4 col-form-label">Address</label>

                        <div class="col-7">
                            <textarea class="form-control"
                                      id="address" placeholder="Address" name="address"></textarea>
                        </div>
                    </div>

                    <input type="hidden" id="addStudentModalId" name="id"/>
                    <input type="hidden" id="addStudentModalType" name="type"/>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn w-lg btn-rounded btn-danger waves-effect waves-light"
                            data-dismiss="modal">Close</button>
                    <button type="reset" class="btn w-lg btn-rounded btn-warning waves-effect waves-light">Reset</button>
                    <button class="btn w-lg btn-rounded btn-custom waves-effect waves-light"
                            type="submit">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!--End add Student Modal-->

<!--- Delete Modal -->
<div class="modal fade" id="deleteModalGeneral">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header custom-modal-headerBg">
                <h4 class="modal-title" id="deleteModalTitle">Delete</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <p class="body-text text-dark" id="deleteModalBodyText"></p>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <form class="positivebtnform" id="deleteModalForm">
                    <input type="hidden" class="positiveinput" id="deleteModalpositiveinput" name="id"/>
                    <input type="hidden" class="deletetype" id="deleteModaltype" name="deletetype"/>
                    <button type="submit" class="btn btn-info waves-light waves-effect w-md mr-2 mb-2">OK</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- End Delete Modal -->

<!-- jQuery  -->
<asset:javascript src="themeassets/js/jquery.min.js"/>
<asset:javascript src="themeassets/js/popper.min.js"/>
<asset:javascript src="themeassets/js/bootstrap.min.js"/>
<asset:javascript src="themeassets/js/metisMenu.min.js"/>
<asset:javascript src="themeassets/js/waves.js"/>
<asset:javascript src="themeassets/js/jquery.slimscroll.js"/>

<!-- Required datatable js -->
<asset:javascript src="themeplugins/datatables/jquery.dataTables.min.js"/>
<asset:javascript src="themeplugins/datatables/dataTables.bootstrap4.min.js"/>

<!-- Making data tables responsive -->
<asset:javascript src="themeplugins/datatables/dataTables.responsive.min.js"/>
<asset:javascript src="themeplugins/datatables/responsive.bootstrap4.min.js"/>

<!-- Select 2 min js -->
<asset:javascript src="themeplugins/select2/js/select2.min.js"/>

<!-- Sweet Alert Js  -->
<asset:javascript src="themeplugins/sweet-alert/sweetalert2.min.js"/>
<asset:javascript src="themeassets/pages/jquery.sweet-alert.init.js"/>

<!-- App js -->
<asset:javascript src="themeassets/js/jquery.core.js"/>
<asset:javascript src="themeassets/js/jquery.app.js"/>
<!-- bootstrap file style -->
<asset:javascript src="themeplugins/bootstrap-filestyle/js/bootstrap-filestyle.min.js"/>
<!-- Parsley js -->
<asset:javascript src="themeplugins/parsleyjs/parsley.min.js"/>
<!-- Sweet Alert Js  -->
<asset:javascript src="themeplugins/sweet-alert/sweetalert2.min.js"/>
<asset:javascript src="themeassets/pages/jquery.sweet-alert.init.js"/>

<script>
    $(function () {
        // Responsive Datatable
        $('#student-datatable').DataTable({
            "order": [[0, "desc"]],
            sPaginationType: "simple_numbers",
            responsive: true,
            destroy: true,
            info: true,
            processing: true,
            serverSide: true,
            language: {
                searchPlaceholder: "Search Student"
            },
            "ajax": {
                type: "GET",
                url: "student/getstudents",
                dataType: 'json',
                dataSrc: function (json) {
                    var return_data = [];
                    if (json == "") {
                        return return_data;
                    }
                    var editbtn = "", deletebtn = "";
                    for (var i = 0; i < json.data.length; i++) {
                        editbtn = '<button ' +
                            'class="editbtn btn btn-warning waves-effect w-xs mr-2 mb-2"' +
                            'data-id="' + json.data[i].id + '"' +
                            'data-name="' + json.data[i].name + '"' +
                            'data-phonenumber="' + json.data[i].phoneNumber + '"' +
                            'data-email="' + json.data[i].email + '"' +
                            'data-place="' + json.data[i].place + '"' +
                            'data-qualification="' + json.data[i].qualification + '"' +
                            'data-toggle="modal" data-target="#addStudentModal"' +
                            'title="Edit"><i class="fa fa-edit"></i> Edit</button>';


                        deletebtn = '<button ' +
                            'data-id="' + json.data[i].id + '"' +
                            'class="deletebtn btn btn-danger waves-effect w-xs mr-2 mb-2 "' +
                            'data-toggle="modal" data-target="#deleteModalGeneral"' +
                            'title="delete"><i class="fa fa-trash"></i> Delete</button>';

                        var action = editbtn + "  " + deletebtn;
                        return_data.push({
                            'id': json.data[i].id,
                            'name': json.data[i].name,
                            'phoneNumber': json.data[i].phoneNumber,
                            'email': json.data[i].email,
                            'place': json.data[i].place,
                            'qualification': json.data[i].qualification,
                            'action': action
                        });
                    }
                    return return_data;
                }
            },
            "columns": [
                {'data': 'id'},
                {'data': 'name'},
                {'data': 'phoneNumber'},
                {'data': 'email'},
                {'data': 'place'},
                {'data': 'qualification'},
                {'data': 'action'}
            ]
        });
        displayMessageInParams();
    });

    $('body').on("click", "#addStudentBtn", function () {

        $("#addStudentModalId").val("");
        $("#name").val("");
        $("#phonenumber").val("");
        $("#email").val("");
        $("#address").val("");
        $("#qualification").val("");
        $("#addStudentModalTitle").text("Add Student: ");
        $("#addStudentModalType").val("add");
        $("#addStudentForm").prop("action", "student/add");

    });

    $('body').on("click", ".editbtn", function () {
        var id = $(this).data('id');
        var name = $(this).data('name');
        var phoneNumber = $(this).data('phonenumber');
        var email = $(this).data('email');
        var address = $(this).data('place');
        var qualification = $(this).data('qualification');

        $("#addStudentModalId").val(id);
        $("#name").val(name);
        $("#phonenumber").val(phoneNumber);
        $("#email").val(email);
        $("#address").val(address);
        $("#qualification").val(qualification);
        $("#addStudentModalTitle").text("Edit Student: " + id);
        $("#addStudentModalType").val("edit");
        $("#addStudentForm").prop("action", "student/update");

    });

    $('body').on("click", ".deletebtn", function () {
        var id = $(this).data('id');
        $("#deleteModalTitle").text("Are you sure?");
        $("#deleteModalBodyText").text("Press OK to delete Student " + id + " permanently.");
        $("#deleteModalForm").prop("method", "post");
        $("#deleteModalForm").prop("action", "student/delete");
        $("#deleteModalpositiveinput").prop("value", id);
        $("#deleteModaltype").val("delete Circle");
    });

    function sendMail() {
        $.ajax({
            type: 'get',
            url: "student/sendmail",
            data: {
                id: "1"
            },
            success: function (data) {
                console.log("Button hit request received");
            },
            error: function (data) {
                console.log("Button click no response please check");
            }
        });
    }

    function displayMessageInParams() {
        var id = "${params.code}";
        //failed transations
        if (id == "0") {
            swal("Email Sending failed!", "No from email or password sent please check", "error");
        }
        if (id == "1") {
            swal("Email Sending failed!", "No file attached", "error");
        }
        if (id == "2") {
            swal("Email Sending failed!", "No students in DB", "error");
        }
        if (id == "5") {
            swal("Email Sending failed!", "Exception thrown please check error log in IDE", "error");
        }
        if (id == "11") {
            swal("Failed!", "Addtion or Modification of some student failed, due to field are empty or incorrect", "error");
        }
        if (id == "20") {
            swal("Invalid Student ID!", "Improper Student Id Sent", "error");
        }
        if (id == "21") {
            swal("No Student!", "No students with the sent id exists", "error");
        }
        if (id == "30") {
            swal("Delete Student failed!", "No students with the sent id exists", "error");
        }

        //for successful transactions
        if (id == "3") {
            swal("Email Sent Successfully!", "Email sent to all students in DB", "success");
        }
        if (id == "10") {
            swal("Student Added Successfully!", "New Student added successfully to DB", "success");
        }
        if (id == "22") {
            swal("Student Updated Successfully!", "Student updated successfully in DB", "success");
        }
        if (id == "31") {
            swal("Student Deleted Successfully!", "Student Deleted successfully in DB", "success");
        }
    }

</script>

</body>
</html>