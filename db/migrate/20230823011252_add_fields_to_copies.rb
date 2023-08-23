class AddFieldsToCopies < ActiveRecord::Migration[7.0]
  def change
    add_column :copies, :copy_location, :string
    add_column :copies, :copy_purpose, :string
    add_column :copies, :copy_tone, :string
  end
end
