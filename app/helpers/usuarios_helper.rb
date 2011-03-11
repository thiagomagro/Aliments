module UsuariosHelper
  def idade(usuario)
    now = Time.now.utc.to_date
    return now.year - usuario.nascimento.year - ((now.month > usuario.nascimento.month || (now.month == usuario.nascimento.month && now.day >= usuario.nascimento.day)) ? 0 : 1)
  end
  
  def calorias(usuario)
    idade = idade(usuario)
    cals = 0
    return 0 if (idade(usuario).nil? || usuario.peso.nil? || usuario.altura.nil? || usuario.atividade_fisica.nil?)
    if usuario.sexo == 0
      cals = 66 + (13.7 * usuario.peso.peso) + (5 * (usuario.altura * 100)) - (6.8 * idade)
    else
      cals = 655 + (9.6 * usuario.peso.peso) + (1.7 * (usuario.altura * 100)) - (4.7 * idade)
    end
    
    if idade <= 18
      if usuario.sexo==0
        if usuario.atividade_fisica==1
          cals *= 1.55
        elsif usuario.atividade_fisica == 2
          cals *= 1.80
        elsif usuario.atividade_fisica==3
          cals *= 2.10
        end
      else
        if usuario.atividade_fisica==1
          cals *= 1.55
        elsif usuario.atividade_fisica==2
          cals *= 1.65
        elsif usuario.atividade_fisica==3
          cals *= 1.8
        end
      end
    elsif idade > 18 && idade <= 65
      if usuario.sexo==0
        if usuario.atividade_fisica==1
          cals *= 1.55
        elsif usuario.atividade_fisica==2
          cals *= 1.80
        elsif usuario.atividade_fisica==3
          cals *= 2.10
        end
      else
        if usuario.atividade_fisica==1
          cals *= 1.55
        elsif usuario.atividade_fisica==2
          cals *= 1.65
        elsif usuario.atividade_fisica==3
          cals *= 1.8
        end
      end
    elsif idade > 65
      if usuario.sexo==0
        if usuario.atividade_fisica==1
          cals *= 1.4
        elsif usuario.atividade_fisica==2
          cals *= 1.6
        elsif usuario.atividade_fisica==3
          cals *= 1.9
        end
      else
        if usuario.atividade_fisica==1
          cals *= 1.4
        elsif usuario.atividade_fisica==2
          cals *= 1.6
        elsif usuario.atividade_fisica==3
          cals *= 1.8
        end
      end
    end
    return cals
  end
end
