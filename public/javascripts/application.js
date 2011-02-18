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
		  $(this).closest(".highlighter").addClass("cinzaClaro");
		});
		$("input, select, textarea").live("blur",function(e){
		  $(this).closest(".highlighter").removeClass("cinzaClaro");
		});

		$(".enter_disable").live("keyup", function(e) {
			e.preventDefault();
		  if (e.keyCode == 34) return false;
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

function deleteAlimentoMedida(btn){
	if(confirm('Deseja excluir a medida?')){
  		$(btn).parents("div.medida_item").hide('fast').find("input.medidaDestroy").val("1");
	}
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
		url:'/alimentos/search_form?action_form=importar',
		dataType:'script',
		type:'POST'
	});
}

function enter_action(e,action,btn){
	if(e.keyCode == 13){
		e.preventDefault();
		e.stopPropagation();
		eval(action + "(btn)");
	}
	return false;
}

function buscar_alimento(btn){
  var action = $(btn).closest(".helperContainer").find("input[name='action_search']").val();
	var v = $(btn).parents('.helperContainer').find("input[name='search']").val();
	$.ajax({
		url:'/alimentos/search?search='+v+"&action_form="+action,
		dataType:'script',
		type:'POST'
	});
}

function buscar_alimento_usda(btn,deleted){
	if(deleted == null || deleted == 'undefined'){
		deleted = 1;
	}
  var action = $(btn).closest(".helperContainer").find("input[name='action_search']").val();
	var v = $(btn).parents('.helperContainer').find("input[name='search']").val();
	$.ajax({
		url:'/alimentos_usda/search?search='+v+"&action_form="+action+"&deleted="+deleted,
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

