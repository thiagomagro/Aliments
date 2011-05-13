module UsuariosHelper
  def idade(usuario)
    now = Time.now.utc.to_date
    return now.year - usuario.nascimento.year - ((now.month > usuario.nascimento.month || (now.month == usuario.nascimento.month && now.day >= usuario.nascimento.day)) ? 0 : 1)
  end
  
  def meses(usuario)
    now = Time.now.utc.to_date
    mes = now.month - usuario.nascimento.month
    if mes < 0
      mes += 12
    end
    
    if now.day < usuario.nascimento.day
      mes -= 1
    end
    mes = mes + (idade(usuario) * 12)
    return mes
  end
  
  def calorias(usuario)
    idade = idade(usuario)
    cals = 0
    meses = meses(usuario)
    naf = 1
    return 0 if (idade(usuario).nil? || usuario.peso_peso.nil? || usuario.altura.nil? || usuario.atividade_fisica.nil?)
    usuario.peso_peso = usuario.peso_peso.to_f
    if meses < 4
      cals = 89 * usuario.peso_peso - 100 + 175
    elsif meses < 7
      cals = 89 * usuario.peso_peso - 100 + 56
    elsif meses < 13
      cals = 89 * usuario.peso_peso - 100 + 22
    elsif meses < 36
      cals = 89 * usuario.peso_peso - 100 + 20
    elsif idade < 19
      if usuario.atividade_fisica==0
        naf = 1
      elsif usuario.atividade_fisica==1
        if usuario.sexo
          naf = 1.13
        else
          naf = 1.16
        end
      elsif usuario.atividade_fisica==2
        if usuario.sexo
          naf = 1.26
        else
          naf = 1.31
        end
      elsif usuario.atividade_fisica==3
        if usuario.sexo
          naf = 1.42
        else
          naf = 1.56
        end
      end
      
      if idade < 9
        if usuario.sexo
          cals = 88.5 - 61.9 * idade + (naf * (26.7 * usuario.peso_peso)) + (903 * usuario.altura) + 20
        else
          cals = 135.3 - 30.8 * idade + (naf * (10 * usuario.peso_peso)) + (934 * usuario.altura) + 20
        end
      elsif idade < 19
        if usuario.sexo
          cals = 88.5 - 61.9 * idade + (naf * (26.7 * usuario.peso_peso)) + (903 * usuario.altura) + 25
        else
          cals = 135.3 - 30.8 * idade + (naf * (10 * usuario.peso_peso)) + (934 * usuario.altura) + 25
        end
      end
    else
      if usuario.atividade_fisica==0
        naf = 1
      elsif usuario.atividade_fisica==1
        if usuario.sexo
          naf = 1.11
        else
          naf = 1.12
        end
      elsif usuario.atividade_fisica==2
        if usuario.sexo
          naf = 1.25
        else
          naf = 1.27
        end
      elsif usuario.atividade_fisica==3
        if usuario.sexo
          naf = 1.48
        else
          naf = 1.45
        end
      end
      
      if usuario.sexo
        cals = 662 - (9.53 * idade) + (naf * (15.91 * usuario.peso_peso)) + (539.6 * usuario.altura)
      else
        cals = 354 - (6.91 * idade) + (naf * (9.36 * usuario.peso_peso)) + (727 * usuario.altura)
      end
      
    end
    return cals
  end
  
  def imc(usuario)
    return 0 if (usuario.peso_peso.nil? || usuario.altura.nil?)
    usuario.peso_peso = usuario.peso_peso.to_f
    return (usuario.peso_peso / (usuario.altura ** 2))
  end
  
  def imc_nome(usuario)
    imc = imc(usuario)
    if imc == 0
      return ""
    end
    if imc < 18.5
      return "Baixo Peso"
    end
    if imc < 24.9
      return "Saudável"
    end
    if imc < 29.9
      return "Sobrepeso"
    end
    if imc < 34.9
      return "Obesidade Grau 1"
    end
    if imc < 39.9
      return "Obesidade Grau 2"
    end
    
    return "Obesidade Grau 3"
  end  
  
  def cep_format(cep)
    if cep.nil? || cep==0
      return cep
    else
      return sprintf '%08d', cep
    end
  end
end
