class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.integer :student_id
      t.integer :class_id

      t.timestamps
    end
  end
end
