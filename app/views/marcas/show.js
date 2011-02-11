$("p.marcaSelected").hide('fast');
$("#marcas").html("<%=escape_javascript(render(:partial => "marcas_form", :marcas => @marcas))%>").show('fast');