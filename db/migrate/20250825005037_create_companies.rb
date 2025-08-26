class CreateCompanies < ActiveRecord::Migration[8.0]
  def change
    create_table :companies do |t|
      t.text :name, null: false
      t.text :headquarters, null: false
      t.text :description

      t.timestamps
    end
  end
end
