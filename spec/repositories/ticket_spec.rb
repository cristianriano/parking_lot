# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Repositories::Ticket, :clear_tickets do
  describe '.insert' do
    subject { described_class.insert(ticket) }

    let(:ticket) { FactoryBot.build(:ticket) }

    context 'valid ticket' do
      it 'inserts the new ticket' do
        expect { subject }.to change { described_class.count }.by(1)
      end
    end

    context 'when the id is already stored' do
      before { described_class.insert(ticket) }

      it 'raises an exception' do
        expect { subject }.to raise_error(Errors::EntityAlreadyExists)
      end
    end
  end
end
