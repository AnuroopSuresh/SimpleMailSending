function verifyImage(input,imageHolderid) {
    console.log("Called utils verify image");
    if (input.files && input.files[0]) {
        //check image validity
        var allowedTypes = ["image/jpg","image/jpeg","image/png"];
        var file = input.files[0];
        if ($.inArray(file["type"], allowedTypes) == -1)
        {
            $('#file').val("");
            autohidenotify('error', 'Invalid Image File', "Please select only an image file.");
        }
        else {

            var reader = new FileReader();
            reader.onload = function (e) {
                var imageHolderObject = $('#'+imageHolderid);
                console.log(imageHolderObject);
                var w = imageHolderObject.width() / imageHolderObject.parent().width() * 100;

                var h = imageHolderObject.height() / imageHolderObject.parent().height() * 100;
                imageHolderObject.attr('src', e.target.result);
                //imageHolderObject.attr('style', "height:" + h + "%;width:" + w + "%;");
            };

            reader.readAsDataURL(file);
        }
    }
}

function displayErrorParameters()
{
    var url_string = window.location.href;
    var url = new URL(url_string);
    var errorCode = url.searchParams.get("error");
    console.log(errorCode);
    if(errorCode==""){
        console.log("Page Load Success with no error");
    }else if(errorCode == "0")
    {
        snackBarCall("Permission not granted or Incorrect academic year selected");
    }else if(errorCode=="600"){
        autohidenotify('error','Invalid Phone Number','You Have entered an invalid phone number');
    }else if(errorCode=="601"){
        autohidenotify('error','Invalid Email','You Have entered an invalid Email');
    }else if(errorCode=="602"){
        autohidenotify('error','Invalid Date','You Have entered an invalid Date');
    }else if(errorCode=="603"){
        autohidenotify('error','Invalid etc','You Have entered an etc');
    }
}
function getFormattedDate(date) {
    var year = date.getFullYear();

    var month = (1 + date.getMonth()).toString();
    month = month.length > 1 ? month : '0' + month;

    var day = date.getDate().toString();
    day = day.length > 1 ? day : '0' + day;

    return month + '/' + day + '/' + year;
}

$('#updatePassword').submit(function(event) {
    var formData = $(this);
    $.ajax({
        type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
        url         : formData.attr('action'), // the url where we want to POST
        data        : formData.serialize(), // our data object
        success:function(data){
            $("#validation-status").text(data);
            autohidenotify('success','Password Changed Successfully',data);
        },
        error:function(data){
            console.log("Failed");
            $("#validation-status").text(data.responseText);
            autohidenotify('error','Password Change Failed',data.responseText);
        }
    });
    event.preventDefault();
});

$('#busStopUpdateFom').submit(function(event){
    var formData = $(this);
    $.ajax({
        type:'POST',
        url:formData.attr('action'),
        data:formData.serialize(),
        success:function(data){
            $("#busStopInfoMessage").text(data);
            window.location.reload();
            autohidenotify('success','Bus Stop Successfully assigned',data);
        },
        error:function(data){
            console.log('Failed');
            $("#busStopInfoMessage").text(data.responseText);
            autohidenotify('error','Bus Stop assign failed',data.responseText);
        }
    });
    event.preventDefault();
});
