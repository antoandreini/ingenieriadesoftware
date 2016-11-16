# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161112003722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gauchadas", force: :cascade do |t|
    t.string   "titulo"
    t.string   "descripcion"
    t.string   "ubicacion"
    t.boolean  "cumplida",    default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "imagen"
    t.integer  "user_id"
  end

  create_table "logros", force: :cascade do |t|
    t.integer  "puntuacion"
    t.string   "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pagos", force: :cascade do |t|
    t.decimal  "monto"
    t.date     "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "postulacions", force: :cascade do |t|
    t.integer  "id_usuario"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "gauchada_id"
  end

  create_table "pregunta", force: :cascade do |t|
    t.string   "cuerpo"
    t.date     "fecha"
    t.string   "respuesta"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "gauchada_id"
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "administrador",          default: false
    t.string   "nombre"
    t.string   "apellido"
    t.integer  "puntuacion",             default: 0
    t.string   "telefono"
    t.string   "ubicacion"
    t.string   "imagen"
    t.integer  "edad"
    t.integer  "numero_tarjeta"
    t.integer  "puntos_para_gauchadas",  default: 1
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
