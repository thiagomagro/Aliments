import psycopg2

conn = psycopg2.connect("host='74.55.126.83' port='5432' dbname='aliments_db' user='aliments' password='2wY1D9qn3t'")
conn2 = psycopg2.connect("host='localhost' dbname='aliments' user='postgres' password='aliments#diveo'")
cur = conn.cursor()
cur2 = conn2.cursor()


#COMPONENTES
cur.execute("select id,componente,unidade,ativo,relevancia from componente")
comps = cur.fetchall()
for c in comps:
  #b=0
  #print c[0]
  cur2.execute("insert into componentes(id,nome,unidade,ativo,ordem) values(%(1)s,%(2)s,%(3)s,%(4)s,%(5)s)",{'1':c[0],'2':c[1],'3':c[2],'4':c[3],'5':c[4]})
cur2.execute("SELECT setval('componentes_id_seq', (select max(id) from componentes), true)")


cur.execute("select id,nome,porcao,ativo,fonte_dados,idioma,marca_id from alimento")
comps = cur.fetchall()
for c in comps:
  #b=1
  #print c[0]
  cur2.execute("insert into alimentos(id,nome,porcao,ativo,banco,idioma,marca_id) values(%(1)s,%(2)s,%(3)s,%(4)s,%(5)s,%(6)s,%(7)s)",{'1':c[0],'2':c[1],'3':c[2],'4':c[3],'5':c[4],'6':c[5],'7':c[6]})
cur2.execute("SELECT setval('alimentos_id_seq', (select max(id) from alimentos), true)")

cur.execute("select alimento_id,componente_id,quantidade,observacao,porcao from componente_alimento")
comps = cur.fetchall()
for c in comps:
  #print c[0]
  print c[0]
  cur2.execute("insert into componente_alimentos(alimento_id,componente_id,quantidade,observacao,porcao) values(%(1)s,%(2)s,%(3)s,%(4)s,%(5)s)",{'1':c[0],'2':c[1],'3':c[2],'4':c[3],'5':c[4]})
cur2.execute("SELECT setval('componente_alimentos_id_seq', (select max(id) from componente_alimentos), true)");


#MEDIDAS

cur.execute("select id,correlacao,nome,unidade from medida")
comps = cur.fetchall()
for c in comps:
  #print c[0]
  print c[0]
  cur2.execute("insert into medidas(id,correlacao,nome,unidade) values(%(1)s,%(2)s,%(3)s,%(4)s)",{'1':c[0],'2':c[1],'3':c[2],'4':c[3]})
cur2.execute("SELECT setval('medidas_id_seq', (select max(id) from medidas), true)")

cur.execute("select id,nome from tipo_medida")
comps = cur.fetchall()
for c in comps:
  #print c[0]
  print c[0]
  cur2.execute("insert into tipo_medidas(id,nome) values(%(1)s,%(2)s)",{'1':c[0],'2':c[1]})
cur2.execute("SELECT setval('tipo_medidas_id_seq', (select max(id) from tipo_medidas), true)")

cur.execute("select tipo_medida_id,medida_id from tipo_medida_medidas")
comps = cur.fetchall()
for c in comps:
  #print c[0]
  print c[0]
  cur2.execute("insert into medida_tipo_medidas(tipo_medida_id,medida_id) values(%(1)s,%(2)s)",{'1':c[0],'2':c[1]})
cur2.execute("SELECT setval('medida_tipo_medidas_id_seq', (select max(id) from medida_tipo_medidas), true)");

cur.execute("select alimento_id,medida_id,quantidade from alimento_medida")
comps = cur.fetchall()
for c in comps:
  #print c[0]
  print c[0]
  cur2.execute("insert into alimento_medidas(alimento_id,medida_id,quantidade) values(%(1)s,%(2)s,%(3)s)",{'1':c[0],'2':c[1],'3':c[2]})
cur2.execute("SELECT setval('alimento_medidas_id_seq', (select max(id) from alimento_medidas), true)");

#GRUPOS
cur.execute("select id,nome,descricao from grupo")
comps = cur.fetchall()
for c in comps:
  #print c[0]
  print c[0]
  cur2.execute("insert into grupos(id,nome,descricao) values(%(1)s,%(2)s,%(3)s)",{'1':c[0],'2':c[1],'3':c[2]})
cur2.execute("SELECT setval('grupos_id_seq', (select max(id) from grupos), true)");

cur.execute("select alimento_id,grupo_id,porcentagem from grupo_alimento")
comps = cur.fetchall()
for c in comps:
  #print c[0]
  print c[0]
  cur2.execute("insert into grupo_alimentos(alimento_id,grupo_id,porcentagem) values(%(1)s,%(2)s,%(3)s)",{'1':c[0],'2':c[1],'3':c[2]})
cur2.execute("SELECT setval('grupo_alimentos_id_seq', (select max(id) from grupo_alimentos), true)");

#MARCA
cur.execute("select id,email,nome,site from marca")
comps = cur.fetchall()
for c in comps:
  print c[0]
  cur2.execute("insert into marcas(id,email,nome,site) values(%(1)s,%(2)s,%(3)s,%(4)s)",{'1':c[0],'2':c[1],'3':c[2],'4':c[3]})
cur2.execute("SELECT setval('marcas_id_seq', (select max(id) from marcas), true)");


#USDA
#COMPONENTE
cur.execute("select id,nome,unidade,ativo from componente_usda")
comps = cur.fetchall()
for c in comps:
  #b=0
  #print c[0]
  cur2.execute("insert into componente_usdas(id,nome,unidade,ativo) values(%(1)s,%(2)s,%(3)s,%(4)s)",{'1':c[0],'2':c[1],'3':c[2],'4':c[3]})
cur2.execute("SELECT setval('componente_usdas_id_seq', (select max(id) from componente_usdas), true)")

cur.execute("select id,nome,undb,ativo from alimento_usda")
comps = cur.fetchall()
for c in comps:
  #b=1
  #print c[0]
  cur2.execute("insert into alimento_usdas(id,nome,undb,ativo) values(%(1)s,%(2)s,%(3)s,%(4)s)",{'1':c[0],'2':c[1],'3':c[2],'4':c[3]})
cur2.execute("SELECT setval('alimento_usdas_id_seq', (select max(id) from alimento_usdas), true)")

cur.execute("select alimento_usda_id,componente_usda_id,quantidade from componente_usda_alimento_usda")
comps = cur.fetchall()
for c in comps:
  #print c[0]
  print c[0]
  cur2.execute("insert into componente_usda_alimentos(alimento_usda_id,componente_usda_id,quantidade) values(%(1)s,%(2)s,%(3)s)",{'1':c[0],'2':c[1],'3':c[2]})
cur2.execute("SELECT setval('componente_alimentos_id_seq', (select max(id) from componente_alimentos), true)");



conn.commit()
conn2.commit()

conn.close()
conn2.close()
#  print c

