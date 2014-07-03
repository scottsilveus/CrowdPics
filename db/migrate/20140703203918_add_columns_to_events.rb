class AddColumnsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :title, :string
    add_column :events, :description, :text
    add_column :events, :start_date, :datetime
    add_column :events, :end_date, :datetime
  end
end
