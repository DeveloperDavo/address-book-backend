class Contact < ApplicationRecord
  has_many :emails, dependent: :destroy
end
