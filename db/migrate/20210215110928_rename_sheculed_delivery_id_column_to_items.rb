class RenameSheculedDeliveryIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :sheculed_delivery_id, :scheduled_delivery_id
  end
end
