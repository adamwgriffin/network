class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
      t.references :requester, null: false, foreign_key: { to_table: :users }
      t.references :recipient, null: false, foreign_key: { to_table: :users }
      t.string :status, null: false, default: 'pending'
      t.timestamps
    end

    add_index :connections, [:requester_id, :recipient_id], unique: true
    add_index :connections, :status
  end
end
