$(function ()
{
    $('.innerContentDivSlimScroll').slimScroll({
        height: '400px',
        opacity: 0,
        color:'#fff'
    }).mouseover(function() {
        $(this).next('.slimScrollBar').css('opacity', 0.4);
    });

});