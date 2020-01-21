# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'POST /api/ticket', :clear_tickets, :with_frozen_time do
  include Rack::Test::Methods

  subject { post '/api/tickets', {}, headers }

  before do
    allow(SecureRandom).to receive(:hex).and_return(id)
  end

  let(:headers) { {} }
  let(:id) { '5b192f70a7ab640d' }
  let(:frozen_time) { Time.utc(2019, 12, 31) }

  it 'creates the new post and stores it' do
    expect { subject }.to change { Repositories::Ticket.count }.by(1)
  end

  it 'returns the new serialized ticket' do
    expect(subject.status).to eq 200
    verify { subject.body }
  end
end
