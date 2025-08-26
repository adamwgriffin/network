class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.references :company, null: false, foreign_key: true
      t.text :first_name, null: false
      t.text :middle_name
      t.text :last_name, null: false
      t.text :nickname
      t.text :credentials

      t.timestamps
    end
  end
end
