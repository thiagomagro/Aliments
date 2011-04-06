// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var intervalSub = "";

$(document).ready(function(){
	$("#menu > ul > li").live('click',function(){
    if($(this).hasClass("url")){
      window.location = $(this).attr("href");
    }
		setSubMenu($(this));
	});
	$("#menu > ul > li").mouseout(function(){
		clearInterval(intervalSub)
	});
	$("#menu > ul > li").mouseover(function(){
    if($(this).find("a").hasClass("url")){
      return;
    }
		var el = $(this);
		clearTimeout(intervalSub)
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
      if (e.keyCode == 34){
        return false
      };
    });
    
    $(".toggleEl").live("click",function(e){
      e.preventDefault();
      var el = eval("("+$(this).attr("rel") + ")");
      if(el){
        $(this).parents(el.parent).toggleClass("selected");
        var a = $(this).find(".plus");
        if($(a).html().indexOf("+") > -1){
          $(a).html($(a).html().replace("+","-"));
        }else{
          $(a).html($(a).html().replace("-","+"));
        }
      }
    });
    setupMasks();
    $(".tooltip").tipTip({});
    displayMsg();
});

function setupMasks(){
  //$(".cepMask").mask("99999999",{placeholder:" "});
  $(".cepMask").each(function(){
    MaskInput(this,"99999999");
  });
  
}

function displayMsg(i){
  if(!i){
    i=0
  }  
  var msg = $("#msgBox .msg").eq(i);
  if(msg){
    msg.fadeIn();
  }else{
      return;
  }
  setTimeout(function(){
    displayMsg(i+1);
  },5000);
}

function trocarMarca(){
	$.ajax({
		url:"/marcas/marca_alimento",
		dataType:"script"
	});
}

function setSubMenu(li){
  if(!li || li.length <= 0){
    return;
  }
	var el = $("#subMenu");

    $(li).parent().find("li").removeClass("active");  
    $(li).addClass("active");
  	el.children().hide();
  	var ul = el.children().get($(li).index());
  	$(ul).show();
    var a = $(li).find("a");
    
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

function delete_item(btn,parent,input,msg){
	if(msg){
		if(!confirm(msg)){
			return;
		}
	}
  $(btn).parents(parent).hide('fast').find(input).val("1");
}

function delete_element(el,parent){
  $(el).parents(parent).remove();
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
    eval(action + "(btn)");    
    return false;
  }  
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

function addLugar(btn){
	var f = $(btn).parents("fieldset").remove();
}

function calcula_alimento_medida(el){
  var c = $(el).parents(".refeicao_alimento");
  var s = $(c).find("select.select_medida")
  var mq = $(c).find("input.medida_quantidade");
  var qg = $(c).find("input.quantidade_gramas");
  var opt = $(s).find("option:selected");  
  var rel = eval("(" + opt.attr("rel")+")");
  
  if($(el).hasClass("quantidade_gramas")){
    if(rel && mq.val() != "" && mq.val() != 0){
      if((rel.qtd * mq.val()) != $(qg).val()){
        $(s).val("");
        $(mq).val("");
      }
    }else{
      $(s).val("");
      $(mq).val("");
    }      
  }else{    
    if(rel && mq.val() != "" && mq.val() != 0){
      $(qg).val(rel.qtd * mq.val());
    }
  }  
}

function setCal(el){
  if($(el).val() != ""){
    $(el).parents("fieldset").find(".kj").val(eval($(el).val()) * 4.19);
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

//+ Carlos R. L. Rodrigues
//@ http://jsfromhell.com/geral/event-listener [rev. #5]

addEvent = function(o, e, f, s){
    var r = o[r = "_" + (e = "on" + e)] = o[r] || (o[e] ? [[o[e], o]] : []), a, c, d;
    r[r.length] = [f, s || o], o[e] = function(e){
        try{
            (e = e || event).preventDefault || (e.preventDefault = function(){e.returnValue = false;});
            e.stopPropagation || (e.stopPropagation = function(){e.cancelBubble = true;});
            e.target || (e.target = e.srcElement || null);
            e.key = (e.which + 1 || e.keyCode + 1) - 1 || 0;
        }catch(f){}
        for(d = 1, f = r.length; f; r[--f] && (a = r[f][0], o = r[f][1], a.call ? c = a.call(o, e) : (o._ = a, c = o._(e), o._ = null), d &= c !== false));
        return e = null, !!d;
    }
};

removeEvent = function(o, e, f, s){
    for(var i = (e = o["_on" + e] || []).length; i;)
        if(e[--i] && e[i][0] == f && (s || o) == e[i][1])
            return delete e[i];
    return false;
};

//+ Jonas Raoni Soares Silva
//@ http://jsfromhell.com/forms/masked-input [rev. #1]

MaskInput = function(f, m){
    function mask(e){
        var patterns = {"1": /[A-Z]/i, "2": /[0-9]/, "4": /[\xC0-\xFF]/i, "8": /./ },
            rules = { "a": 3, "A": 7, "9": 2, "C":5, "c": 1, "*": 8};
        function accept(c, rule){
            for(var i = 1, r = rules[rule] || 0; i <= r; i<<=1)
                if(r & i && patterns[i].test(c))
                    break;
                return i <= r || c == rule;
        }
        var k, mC, r, c = String.fromCharCode(k = e.key), l = f.value.length;
        (!k || k == 8 ? 1 : (r = /^(.)\^(.*)$/.exec(m)) && (r[0] = r[2].indexOf(c) + 1) + 1 ?
            r[1] == "O" ? r[0] : r[1] == "E" ? !r[0] : accept(c, r[1]) || r[0]
            : (l = (f.value += m.substr(l, (r = /[A|9|C|\*]/i.exec(m.substr(l))) ?
            r.index : l)).length) < m.length && accept(c, m.charAt(l))) || e.preventDefault();
    }
    for(var i in !/^(.)\^(.*)$/.test(m) && (f.maxLength = m.length), {keypress: 0, keyup: 1})
        addEvent(f, i, mask);
};

