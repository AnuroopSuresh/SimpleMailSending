/**
 * Created by admin on 05-01-2018.
 */
$(function ()
{
    var path=window.location.pathname;
    var lengthofOccurance = path.match(/\//gi).length;
    var logoPath=$(".logoimage").attr('src');
    if((lengthofOccurance!=null)&&(lengthofOccurance>2)) {

        $("a").each(function () {
            var href = $(this).attr('href');
            if (!href.includes("#"))
                $(this).attr('href', "../" + href);
        });

        $("img").each(function () {
            var src = $(this).attr('src');
            if (!src.includes("#"))
                $(this).attr('src', "../" + src);
        });

        //logo bug fix
        $(".logoimage").attr('src', logoPath);
    }
});