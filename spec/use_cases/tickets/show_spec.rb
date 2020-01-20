# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UseCases::Tickets::Show do
  describe '.initialize' do
    subject { described_class.new(id) }

    let(:id) { 'string' }

    it 'raises error when id is not valid' do
      expect { subject }.to raise_error(Dry::Types::ConstraintError)
    end
  end

  describe '.call' do
    subject { described_class.new(id).call }

    let(:repo) { Repositories::Ticket }
    let(:id) { 'fbbe784a1f67df8e' }

    it 'calls the repo with correct params' do
      expect(repo).to receive(:find).with(id)
      subject
    end
  end
end
