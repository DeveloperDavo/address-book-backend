# frozen_string_literal: true

require 'rails_helper'

describe Api::ContactsController do
  describe '#index' do
    it 'returns a list of all contacts' do
      create(:contact, first_name: 'Anna', last_name: 'A')
      create(:contact, first_name: 'Boris', last_name: 'B')

      get api_contacts_url

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      expect(body.count).to eq(2)
    end

    it 'returns fields of an item' do
      anna = create(:contact, first_name: 'Anna', last_name: 'A')

      get api_contacts_url

      first_entry = JSON.parse(response.body).first
      expect(first_entry['id']).to eq(anna.id)
      expect(first_entry['first_name']).to eq(anna.first_name)
      expect(first_entry['last_name']).to eq(anna.last_name)
      expect(first_entry.key?('created_at')).to eq(false)
      expect(first_entry.key?('update_at')).to eq(false)
    end
  end


  describe '#create' do
    it 'creates a contact' do
      contact_params = attributes_for(:contact, first_name: 'Cameron', last_name: 'C')

      post api_contacts_url, params: { contact: contact_params }

      expect(response.status).to eq 201

      body = JSON.parse(response.body)
      expect(body['first_name']).to eq contact_params[:first_name]
      expect(body.key?('created_at')).to eq(false)
      expect(body.key?('update_at')).to eq(false)
    end
  end

  describe '#show' do
    it 'displays a contact' do
      anna = create(:contact, first_name: 'Anna', last_name: 'A')

      get "/api/contacts/#{anna['id']}"

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      expect(body['id']).to eq(anna.id)
      expect(body['first_name']).to eq(anna.first_name)
      expect(body['last_name']).to eq(anna.last_name)
      expect(body.key?('created_at')).to eq(false)
      expect(body.key?('update_at')).to eq(false)
    end
  end
end
