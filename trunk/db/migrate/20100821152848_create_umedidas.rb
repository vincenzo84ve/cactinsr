class CreateUmedidas < ActiveRecord::Migration
  def self.up
    create_table :umedidas do |t|
      t.string :descripcion

      t.timestamps
    end
  end

  def self.down
    drop_table :umedidas
  end
end
