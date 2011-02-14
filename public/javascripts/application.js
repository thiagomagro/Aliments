{// Place your application-specific JavaScript functions and classes here
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

		$("button#trocarMarca").live("click",function(){
  		trocarMarca();
		});
		$("button#novaMarca").live("click",function(){
			$.ajax({
				dataType:"script",
				url:"/marcas/new"
			});
		});

		$("input, select, textarea").live("focus",function(e){
		  $(this).parent().parent().addClass("cinzaClaro");
		});
		$("input, select, textarea").live("blur",function(e){
		  $(this).parent().parent().removeClass("cinzaClaro");
		});
	});

function trocarMarca(){
			$.ajax({
				url:"/marcas/marca_alimento",
				dataType:"script"
			});
}

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
	$.ajax({
		url:'/tipo_medidas/add_tipo/'+op,
		dataType:'script'
	});
}

function	deleteAlimentoMedida(btn){
  $(btn).parents("div.medida_item").hide('fast').find("input.medidaDestroy").val("1");
}

function adicionarGrupo(){
  var op = $("select#select_grupos_alimentos").val();
	$.ajax({
		url:'/grupos/adicionar_grupo/'+op,
		dataType:'script'
	});
}

function deleteAlimentoGrupo(btn){
  $(btn).parents("div.grupo_item").hide('fast').find("input.grupoDestroy").val("1");
}

function importarMedidas(btn){
	$.ajax({
		url:'/alimentos/search_form/',
		dataType:'script',
		type:'POST'
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
}

