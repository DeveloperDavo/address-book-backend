class AddLastNameToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :last_name, :string
  end
end
