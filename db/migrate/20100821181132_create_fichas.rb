class CreateFichas < ActiveRecord::Migration
  def self.up
    create_table :fichas do |t|
      t.date :fecha
      t.string :componente
      t.integer :medida
      t.integer :umedida_id
      t.integer :activo_id

      t.timestamps
    end
  end

  def self.down
    drop_table :fichas
  end
end
