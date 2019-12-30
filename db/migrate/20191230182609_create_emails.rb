class CreateEmails < ActiveRecord::Migration[6.0]
  def change
    create_table :emails do |t|
      t.string :account
      t.string :kind
      t.boolean :default
      t.references :contact, null: false, foreign_key: true
    end
  end
end
