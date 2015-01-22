class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, unique: true
      t.text :password_digest
      t.boolean :admin
      t.timestamps
    end
  end
end
