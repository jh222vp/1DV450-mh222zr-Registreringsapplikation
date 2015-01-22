class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.string :key, unique: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
