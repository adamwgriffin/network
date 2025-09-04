class CreateConnectionRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :connection_requests do |t|
      t.references :sender, null: false, foreign_key: { to_table: :users }
      t.references :receiver, null: false, foreign_key: { to_table: :users }
      t.string :status, null: false, default: 'pending'
      t.datetime :responded_at
      t.timestamps
    end

    add_index :connection_requests, [:sender_id, :receiver_id], unique: true
  end
end
