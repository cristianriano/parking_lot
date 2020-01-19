# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UseCases::Tickets::Create do
  describe '.call' do
    subject { instance.call }

    before do
      allow(SecureRandom).to receive(:hex).and_return(id)
      allow(repo).to receive(:insert) { |ticket| ticket }
    end

    let(:instance) { described_class.new }
    let(:repo) { Repositories::Ticket }
    let(:id) { 'fbbe784a1f67df8e' }

    it 'call the repo with the new built ticket' do
      expect(repo).to receive(:insert) do |ticket|
        expect(ticket).to be_instance_of(Models::Ticket)
      end

      subject
    end

    it 'returns the new ticket' do
      expect(subject).to be_instance_of(Models::Ticket)
      expect(subject.id).to eq id
    end
  end
end
