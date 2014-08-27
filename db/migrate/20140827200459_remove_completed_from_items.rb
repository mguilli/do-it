class RemoveCompletedFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :completed, :boolean
  end
end
