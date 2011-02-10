// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var intervalSub = "";
$(document).ready(function(){
    $("#menu > ul > li").live('click',function(){
        setSubMenu($(this));
    });
    $("#menu > ul > li").mouseout(function(){
        clearInterval(intervalSub)
    });
    $("#menu > ul > li").mouseover(function(){
        var el = $(this);
        clearInterval(intervalSub)
        intervalSub = setTimeout(function(){
            setSubMenu(el);
        },600);

    });
});

function setSubMenu(li){
    $(li).parent().find("li").removeClass("active");
    $(li).addClass("active");
    var el = $("#subMenu");
    el.find("ul").hide();
    var ul = el.find("ul").get($(li).index());
    $(ul).show();
}

function loadTipoMedidas(el){
	var op = $("select#selectTipoMedidas").val();
  $("#alimento_medidas").find("").length;
  $.ajax({
    url:'/tipo_medidas/add_tipo/'+op,
    dataType:'script'
  });
}






/*LIB*/
jQuery.log = function(message) {
    try{
        console.debug(message);
    }catch(e){
    //alert(message);
    }
};

jQuery.fn.debug = function() {
    return this.each(function(){
        $.log(this);
    });
};

