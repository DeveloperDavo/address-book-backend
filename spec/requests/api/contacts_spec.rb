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
