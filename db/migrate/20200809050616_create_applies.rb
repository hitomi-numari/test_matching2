class CreateApplies < ActiveRecord::Migration[5.2]
  def change
    create_table :applies do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :status, default: 0, null: false
      t.integer :evaluation

      t.timestamps
    end
  end
end
