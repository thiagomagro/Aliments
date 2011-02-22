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
		$(".tooltip").tipTip({});
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

function adicionar_tipo_medida_medidas(el){
	var op = $("select#select_tipo_medida_medidas").val();
	$.ajax({
		url:'/tipo_medidas/add_tipo_medida_medidas/'+op,
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

function delete_tipo_medida(btn){
  $(btn).parents(".tipo_medida").hide('fast').find("input.tipo_medida_destroy").val("1");
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

function calculaCorrelacao(el){
    var parent = $(el).parents('.medida_item');
    var grupos = parent.find("input.medidaTipo");
    
    var cor = parent.find("input.correlacao").val();
    var val = parent.find("input.quantidade").val().replace(",",".");
    if(cor != "" && cor != 0 && val != "" && val != 0){
        $(el).parents('form').find('.medida_item').not(parent).each(function(){
            var innerGrupos = $(this).find("input.medidaTipo");
            var find = false;
            innerGrupos.each(function(){
                var g = $(this);
                grupos.each(function(){
                    if($(this).val() == g.val()){
                        find = true;
                    }
                });
            });
            if(find){
                var inp = $(this).find("input.quantidade");
                var ic = $(this).find("input.correlacao").val();
                if($.trim(ic) != "" && $.trim(ic) != 0){
                    if($.trim(inp.val()) == "" || $.trim(inp.val()) == 0){
                        var ctemp = ((val / cor) * ic).toString();
                        if(ctemp != 0){
                            inp.val(ctemp);    
                        }
                    //inp.val((val * ic).toString().replace(".",","));
                    }
                }
            }
        });
    }
}

function limparValores(btn,parent,el){
	if(confirm("Limpar os valores dos campos?")){
		$(btn).parents(parent).find(el).val('');
	}
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

