class CreateCompletionStatuses < ActiveRecord::Migration
  def change
    create_table :completion_statuses do |t|

      t.timestamps
    end
  end
end
