# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110208144941) do

  create_table "alimento_medidas", :force => true do |t|
    t.integer  "alimento_id"
    t.integer  "medida_id"
    t.float    "quantidade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alimentos", :force => true do |t|
    t.string   "nome"
    t.string   "idioma"
    t.float    "porcao"
    t.integer  "usuario_cadastro_id"
    t.integer  "usuario_aprovacao_id"
    t.string   "banco"
    t.boolean  "ativo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "componente_alimentos", :force => true do |t|
    t.float    "quantidade"
    t.float    "porcao"
    t.string   "observacao"
    t.integer  "alimento_id"
    t.integer  "componente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "componentes", :force => true do |t|
    t.string   "nome"
    t.string   "unidade"
    t.boolean  "ativo"
    t.integer  "ordem"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medida_tipo_medidas", :force => true do |t|
    t.integer  "medida_id"
    t.integer  "tipo_medida_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medidas", :force => true do |t|
    t.float    "correlacao"
    t.string   "nome"
    t.string   "unidade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "perfils", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_medidas", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "login"
    t.string   "senha"
    t.date     "nascimento"
    t.boolean  "sexo"
    t.integer  "perfil_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
