/**
 * Created by admin on 19-01-2018.
 */
var dynamicColors = function() {
    var r = Math.floor(Math.random() * 255);
    var g = Math.floor(Math.random() * 255);
    var b = Math.floor(Math.random() * 255);
    var a = Math.random();
    return "rgba(" + r + "," + g + "," + b + ","+0.8+")";
}
