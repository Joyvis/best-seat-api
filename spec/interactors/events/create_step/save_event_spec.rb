# frozen_string_literal: true

require 'rails_helper'

describe Events::CreateStep::SaveEvent, type: :interactor do
  subject { described_class.call(event_params: event) }

  context 'with valid parameters' do
    context 'and it is receiving a hash parameter' do
      let(:event) { attributes_for(:event) }

      it 'event has been created' do
        expect(subject.event).to be_a(Event)
        expect(subject.success?).to be_truthy
        expect(subject.event.valid?).to be_truthy
        expect(subject.errors).not_to be_present
      end
    end
  end

  context 'with invalid parameters' do
    let(:event) { { name: 'foo' } }

    it 'event has not been created' do
      expect(subject.failure?).to be_truthy
      expect(subject.errors).to be_present
    end
  end
end
