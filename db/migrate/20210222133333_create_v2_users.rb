class CreateV2Users < ActiveRecord::Migration[6.1]
  def change
    create_table :v2_users do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.string :password

      t.timestamps
    end
  end
end
