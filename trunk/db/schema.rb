# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101111031539) do

  create_table "activos", :force => true do |t|
    t.string   "descripcion"
    t.integer  "marca_id"
    t.string   "modelo"
    t.boolean  "es_equipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "asignados", :force => true do |t|
    t.date     "fecha"
    t.integer  "persona_id"
    t.boolean  "esta_activo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "careas", :force => true do |t|
    t.string   "nombre"
    t.integer  "cgeneral_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cgenerals", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "desasignados", :force => true do |t|
    t.date     "fecha"
    t.integer  "asignado_id"
    t.integer  "motivo_id"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "despachos", :force => true do |t|
    t.integer  "persona_id"
    t.date     "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "esta_activo"
  end

  create_table "existencias", :force => true do |t|
    t.integer  "factura_id"
    t.integer  "activo_id"
    t.integer  "cantidad"
    t.integer  "saldo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "serial"
    t.boolean  "es_asignado", :default => false
    t.boolean  "esta_activo", :default => false
  end

  create_table "facturas", :force => true do |t|
    t.datetime "fecha"
    t.integer  "proveedor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "factura"
    t.string   "estado",       :default => "en proceso"
  end

  create_table "fichas", :force => true do |t|
    t.date     "fecha"
    t.string   "componente"
    t.integer  "medida"
    t.integer  "umedida_id"
    t.integer  "activo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lineas_asignados", :force => true do |t|
    t.integer  "existencia_id"
    t.integer  "asignado_id"
    t.boolean  "esta_activo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "desasignado_id"
  end

  create_table "lineas_despachos", :force => true do |t|
    t.integer  "existencia_id"
    t.integer  "cantidad"
    t.boolean  "esta_activo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "despacho_id"
  end

  create_table "marcas", :force => true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "motivos", :force => true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personas", :force => true do |t|
    t.string   "cedula"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "cargo"
    t.integer  "carea_id"
    t.integer  "ubicacione_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proveedors", :force => true do |t|
    t.string   "nombre"
    t.string   "rif"
    t.string   "direccion"
    t.string   "contacto"
    t.string   "telefono"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ubicaciones", :force => true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "umedidas", :force => true do |t|
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
