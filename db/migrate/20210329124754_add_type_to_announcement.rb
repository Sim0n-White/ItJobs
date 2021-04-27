class AddTypeToAnnouncement < ActiveRecord::Migration[6.1]
  def change
    add_column :announcements, :document_type, :string
  end
end
