# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'GET /api/tickets/:id', :clear_tickets, :with_frozen_time do
  include Rack::Test::Methods

  subject { get "/api/tickets/#{id}", {}, headers }

  let(:headers) { {} }
  let(:id) { '175bbc34c26334c4' }
  let(:frozen_time) { Time.new(2019, 12, 31, 10) }

  context 'when the id does not exists' do
    it 'returns a 404' do
      expect(subject.status).to eq 404
    end
  end

  context 'when the id is not a valid barcode' do
    let(:id) { 'string' }

    it 'returns a 400' do
      expect(subject.status).to eq 400
    end
  end

  context 'when the id exists' do
    let(:ticket) { FactoryBot.create(:ticket, id: id) }

    context 'after 1,5 hours' do
      before do
        ticket # store the ticket
        Timecop.freeze(frozen_time + 5400)
      end

      it 'returns the ticket and correct price' do
        expect(subject.status).to eq 200
        verify { subject.body }
      end
    end
  end
end
