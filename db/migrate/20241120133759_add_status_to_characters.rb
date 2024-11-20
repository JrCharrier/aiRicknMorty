class AddStatusToCharacters < ActiveRecord::Migration[7.1]
  def change
    add_column :characters, :status, :boolean, default: false
  end
end
