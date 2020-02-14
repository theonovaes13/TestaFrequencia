class ChangeColumnSubscriptionClassToSubject < ActiveRecord::Migration[6.0]
  def change
    rename_column(:subscriptions, :class_id, :subject_id)
  end
end
