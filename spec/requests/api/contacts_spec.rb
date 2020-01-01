# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /api/contacts' do
  it 'returns a list of all contacts' do
    anna = create(:contact, first_name: 'Anna', last_name: 'A')
    create(:contact, first_name: 'Boris', last_name: 'B')

    get '/api/contacts'

    body = JSON.parse(@response.body)
    expect(body.count).to eq(2)
    expect(body[0]['id']).to eq(anna.id)
    expect(body[0]['first_name']).to eq(anna.first_name)
    expect(body[0]['last_name']).to eq(anna.last_name)
  end
end

RSpec.describe 'POST /api/contacts' do
  it 'creates a contact' do
    contact_params = attributes_for(:contact, first_name: 'Cameron', last_name: 'C')

    post '/api/contacts', params: {contact: contact_params}

    expect(response.status).to eq 201
    expect(Contact.last.first_name).to eq contact_params[:first_name]
  end
end

