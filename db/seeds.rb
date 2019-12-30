# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Email.delete_all
Contact.delete_all

hash = ActiveSupport::JSON.decode(File.read('db/seeds/contacts.json'))

hash.each do |contact_entry|
  contact = Contact.create!("first_name": contact_entry["first_name"])

  contact_entry['emails'].each do |email_entry|
    contact.emails.create!(email_entry)
  end

end
