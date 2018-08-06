function rankChanged() {
    var value = $(".rankselect").val();
    var circleContainterValue = $(".circlecontainer").css("display");
    var policeContainterValue = $(".policestationcontainer").css("display");
    var subDivisionContainterValue = $(".subdivisioncontainer").css("display");

    if (value <= 5) //police station for Inspector and below
    {
        $(".policestationcontainer").css('display','block');
        $(".policestationselect").attr("required", true);
        $(".circleselect").attr("required", false);
        $(".subdivisionselect").attr("required", false);

        if (!circleContainterValue.match("none")) {
            $(".circlecontainer").css("display","none");
        }
        if (!subDivisionContainterValue.match("none")) {
            $(".subdivisioncontainer").css("display","none");
        }
        $.ajax({
            type: 'GET',
            url: 'policestations/getbydistrict?id=' + districtValueSession,
            success: function (data) {
                var $select = $('.policestationselect');
                $select.find('option').remove();
                $select.append('<option></option>');
                $.each(data, function (i) {

                    key = data[i].id;
                    value = data[i].name;
                    $select.append('<option value=' + key + '>' + value + '</option>');

                });
            }
        });
    }
    else if (value == 6) //circle for Circle Inspector
    {
        $(".circlecontainer").css('display','inline');
        $(".policestationselect").attr("required", false);
        $(".circleselect").attr("required", true);
        $(".subdivisionselect").attr("required", false);
        if (!policeContainterValue.match("none")) {
            $(".policestationcontainer").css("display","none");
        }
        if (!subDivisionContainterValue.match("none")) {
            $(".subdivisioncontainer").css("display","none");
        }
        $.ajax({
            type: 'GET',
            url: 'circle/getbydistrict?id=' + districtValueSession,
            success: function (data) {
                var $select = $('.circleselect');
                $select.find('option').remove();
                $.each(data, function (i) {

                    key = data[i].id;
                    value = data[i].circle.name;
                    $select.append('<option value=' + key + '>' + value + '</option>');

                });
            }
        });
    }
    else if (value == 7) //sub division for DSP
    {
        $(".subdivisioncontainer").css('display','inline');
        $(".policestationselect").attr("required", false);
        $(".circleselect").attr("required", false);
        $(".subdivisionselect").attr("required", true);
        if (!policeContainterValue.match("none")) {
            $(".policestationcontainer").css("display","none");
        }
        if (!circleContainterValue.match("none")) {
            $(".circlecontainer").css("display","none");
        }
        $.ajax({
            type: 'GET',
            url: 'subDivisions/getdistrict?id=' + districtValueSession,
            success: function (data) {
                var $select = $('.subdivisionselect');
                $select.find('option').remove();
                $.each(data, function (i) {

                    key = data[i].id;
                    value = data[i].subDivision.name;
                    $select.append('<option value=' + key + '>' + value + '</option>');

                });
            }
        });
    }
    else if (value > 7) //sub division for DSP
    {
        $(".policestationselect").attr("required", false);
        $(".circleselect").attr("required", false);
        $(".subdivisionselect").attr("required", false);
        if (!!policeContainterValue.match("none")) {
            $(".policestationcontainer").css("display","none");
        }
        if (!circleContainterValue.match("none")) {
            $(".circlecontainer").css("display","none");
        }
        if (!subDivisionContainterValue.match("none")) {
            $(".subdivisioncontainer").css("display","none");
        }
    }
}


/*
 On blur events for checking duplicates
 */
function onblurUsername(input) {
    $.ajax({
        type: 'GET',
        url: 'users/usernameexists?username=' + input.value,
        success: function (data) {
            var $select = $('.username');
            if (data.username != null) {
                swal("Username Taken!", "Please enter a different username", "error");

                $select.val("");
                $select.focus();
                $select.effect("pulsate");
            }
        }

    });
}


function onblurPhone(input) {
    $.ajax({
        type: 'GET',
        url: 'users/phoneexists?phone' + input.value,
        success: function (data) {
            var $select = $('.mobile');
            if (data['mobile'] != null) {
                swal("Mobile already entered!", "Please enter a different mobile number", "error");

                $select.val("");
                $select.focus();
                $select.effect("pulsate");
            }
        }
    });
}


function onblurImei(input) {
    $.ajax({
        type: 'GET',
        url: 'users/imeiexists?imei' + input.value,
        success: function (data) {
            var $select = $('.imei');
            if (data.imei != null) {
                swal("IMEI already entered!", "Please enter a different mobile IMEI", "error");

                $select.val("");
                $select.focus();
                $select.effect("pulsate");
            }
        }
    });
}

function onblurJurisdiction(input) {
    $.ajax({
        type: 'GET',
        url: 'users/jurisdictionexists?jurisdiction' + input.value,
        success: function (data) {
            var $select = $('.jurisdiction');
            if (data.jurisdiction != null) {
                swal("Jurisdiction already entered!", "Please enter a different mobile Jurisdiction", "error");

                $select.val("");
                $select.focus();
                $select.effect("pulsate");
            }
        }
    });
}

function onblurEmail(input) {
    $.ajax({
        type: 'GET',
        url: 'users/emailexists?email' + input.value,
        success: function (data) {
            var $select = $('.email');
            if (data.imei != null) {
                swal("EMAIL already entered!", "Please enter a different email", "error");

                $select.val("");
                $select.focus();
                $select.effect("pulsate");
            }
        }
    });
}

function onblurMetal(input){
    $.ajax({
        type: 'GET',
        url: 'users/metalexists?metalnumber' + input.value,
        success: function (data) {
            var $select = $('.email');
            if (data.imei != null) {
                swal("Metal Number already entered!", "Please enter a different Metal number", "error");

                $select.val("");
                $select.focus();
                $select.effect("pulsate");
            }
        }
    });
}