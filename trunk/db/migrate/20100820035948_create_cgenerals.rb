class CreateCgenerals < ActiveRecord::Migration
  def self.up
    create_table :cgenerals do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :cgenerals
  end
end
