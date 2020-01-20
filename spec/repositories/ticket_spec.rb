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

  describe '.find' do
    subject { described_class.find(id) }

    before { Timecop.freeze(Time.new(2019, 12, 31)) }
    after { Timecop.return }

    let(:id) { SecureRandom.hex(8) }

    context 'when the id does not exists' do
      it 'raises NotFound error' do
        expect { subject }.to raise_error(Errors::NotFound)
      end
    end

    context 'when the id exists' do
      before { described_class.insert(ticket) }

      let(:ticket) { FactoryBot.build(:ticket, id: id) }

      it 'returns the ticket' do
        expect(subject).to be_instance_of(Models::Ticket)
        expect(subject.id).to eq ticket.id
        expect(subject.created_at).to eq ticket.created_at
      end
    end
  end
end
