# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'POST /api/ticket/:id/payments', :clear_db, :with_frozen_time do
  include Rack::Test::Methods

  subject { post url, body, headers }

  let(:url) { "/api/tickets/#{id}/payments" }
  let(:body) do
    {
      payment: {
        method: method
      }
    }.to_json
  end
  let(:headers) { {} }
  let(:frozen_time) { Time.utc(2019, 12, 31) }

  let(:id) { '5b192f70a7ab640d' }
  let(:method) { 'cash' }

  shared_examples 'error_case' do
    it 'returns error code' do
      expect(subject.status).to eq code
      expect(subject.content_type).to eq 'application/json'
    end
  end

  context 'when the ticket does not exists' do
    let(:code) { 404 }

    it_behaves_like 'error_case'
  end

  context 'when the id is invalid format' do
    let(:id) { 'invalid' }
    let(:code) { 400 }

    it_behaves_like 'error_case'
  end

  context 'when the ticket exists' do
    before { ticket }
    let(:ticket) { FactoryBot.create(:ticket, id: id) }

    it 'returns successful status' do
      expect(subject.status).to eq 201
    end

    it 'stores a new payment' do
      expect { subject }.to change { Repositories::Payment.count }.by(1)
    end

    it 'marks the ticket as paid' do
      expect { subject }
        .to change { Repositories::Ticket.find(id).state }
        .from('open').to('paid')
    end

    context 'when the payment method is not valid' do
      let(:method) { 'invalid' }
      let(:code) { 400 }

      it_behaves_like 'error_case'
    end
  end
end
